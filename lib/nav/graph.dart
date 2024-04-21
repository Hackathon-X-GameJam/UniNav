import 'package:anyhow/anyhow.dart';
import 'package:collection/collection.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:rust_core/iter.dart';
import 'package:uninav/data/geo/model.dart';
import 'package:uninav/util/geojson_util.dart';
import 'package:uninav/util/util.dart';
import 'dart:collection';

part 'graph.freezed.dart';

@freezed
class GraphFeature with _$GraphFeature {
  const factory GraphFeature.buildingFloor(int floor, Feature building) =
      BuildingFloor;
  const factory GraphFeature.portal(int fromFloor, String from, int toFloor,
      String to, Feature baseFeature) = Portal;
  const factory GraphFeature.basicFeature(
      int floor, String building, Feature feature) = BasicFeature;

  const GraphFeature._();

  Result<LatLng> getCenter() {
    return when(
      buildingFloor: (floor, building) => building.getCenterPoint(),
      portal: (fromFloor, from, toFloor, to, baseFeature) =>
          baseFeature.getCenterPoint(),
      basicFeature: (floor, building, feature) => feature.getCenterPoint(),
    );
  }

  double distanceTo(GraphFeature other, String unit) => distanceBetweenLatLng(
      getCenter().unwrap(), other.getCenter().unwrap(), unit);

  double metersTo(GraphFeature other) => distanceTo(other, "meters");

  String get id => when(
        buildingFloor: (floor, building) => building.id,
        portal: (fromFloor, from, toFloor, to, baseFeature) => baseFeature.id,
        basicFeature: (floor, building, feature) => feature.id,
      );

  // String? get buildingName => when(
  //       buildingFloor: (floor, building) => building.name,
  //       portal: (fromFloor, from, toFloor, to, baseFeature) =>
  //           baseFeature.type.maybeWhen(
  //         door: (_) => null,
  //         orElse: () => baseFeature.building,
  //       ),
  //       basicFeature: (floor, building, feature) => feature.type.maybeWhen(
  //         door: (_) => null,
  //         orElse: () => building,
  //       ),
  //     );

  @override
  String toString() {
    return when(
      buildingFloor: (floor, building) => 'Floor (${building.name}:$floor)',
      portal: (fromFloor, from, toFloor, to, _) =>
          'Portal ($from:$fromFloor -> $to:$toFloor)',
      basicFeature: (floor, building, feature) =>
          'Feature (${formatFeatureTitle(feature)} ($building:$floor))',
    );
  }

  @override
  int get hashCode {
    return when(
      buildingFloor: (floor, building) => Object.hash(floor, building),
      portal: (fromFloor, from, toFloor, to, baseFeature) =>
          Object.hash(fromFloor, from, toFloor, to, baseFeature),
      basicFeature: (floor, building, feature) =>
          Object.hash(floor, building, feature),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GraphFeature &&
        other.when(
          buildingFloor: (floor, building) =>
              this is BuildingFloor &&
              (this as BuildingFloor).floor == floor &&
              (this as BuildingFloor).building == building,
          portal: (fromFloor, from, toFloor, to, baseFeature) =>
              this is Portal &&
              (this as Portal).fromFloor == fromFloor &&
              (this as Portal).from == from &&
              (this as Portal).toFloor == toFloor &&
              (this as Portal).to == to &&
              (this as Portal).baseFeature == baseFeature,
          basicFeature: (floor, building, feature) =>
              this is BasicFeature &&
              (this as BasicFeature).floor == floor &&
              (this as BasicFeature).building == building &&
              (this as BasicFeature).feature == feature,
        );
  }
}

class Graph {
  final List<(GraphFeature, double, GraphFeature)> _edges = [];
  final HashSet<GraphFeature> _nodes = HashSet();
  final HashSet<(GraphFeature, GraphFeature)> _edgesSet = HashSet();

  Iterable<GraphFeature> get nodes => _nodes.iter();

  void addNode(GraphFeature node) {
    _nodes.add(node);
    if (node is BasicFeature && node.feature.name == 'H22') {
      print(node);
      print(node.hashCode);
    }
  }

  void addEdge(GraphFeature from, GraphFeature to, double weight) {
    addNode(from);
    addNode(to);
    if (!_edgesSet.contains((from, to))) {
      _edgesSet.add((from, to));
      _edges.add((from, weight, to));
    }
    if (!_edgesSet.contains((to, from))) {
      _edgesSet.add((to, from));
      _edges.add((to, weight, from));
    }
  }

  List<(GraphFeature, double, GraphFeature)> getEdges(GraphFeature node) {
    return _edges.where((edge) => edge.$1 == node).toList();
  }

  bool contains(GraphFeature node) {
    return _nodes.contains(node);
  }

  bool containsEdge(GraphFeature from, GraphFeature to) {
    return _edgesSet.contains((from, to));
  }

  @override
  String toString() {
    return 'Graph(_edges: $_edges, _nodes: $_nodes, _edgesSet: $_edgesSet)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Graph &&
        listEquals(other._edges, _edges) &&
        setEquals(other._nodes, _nodes) &&
        setEquals(other._edgesSet, _edgesSet);
  }

  @override
  int get hashCode => _edges.hashCode ^ _nodes.hashCode ^ _edgesSet.hashCode;
}

IList<GraphFeature> wrap(Feature feature, int floor, String buildingFrom) {
  return feature.type
      .maybeWhen(
        building: () => [GraphFeature.buildingFloor(floor, feature)],
        stairs: (floors) => stairPortalGenerator(floors, floor, feature),
        lift: (floors) => stairPortalGenerator(floors, floor, feature, 99),
        door: (connections) =>
            doorPortalGenerator(connections, floor, buildingFrom, feature),
        orElse: () => [
          GraphFeature.basicFeature(
              floor, feature.building ?? buildingFrom, feature)
        ],
      )
      .lock;
}

List<GraphFeature> doorPortalGenerator(
    List<String> connections, int floor, String from, Feature feature) {
  final portals = <GraphFeature>[];

  for (final connection in connections.where((c) => !eq(c, from))) {
    portals.add(GraphFeature.portal(floor, from, floor, connection, feature));
  }

  return portals;
}

List<GraphFeature> stairPortalGenerator(
    List<int> floors, int floor, Feature feature,
    [int maxDist = 1]) {
  final portals = <GraphFeature>[];
  for (int i = 1; i <= maxDist; i++) {
    if (floors.contains(floor - i)) {
      portals.add(GraphFeature.portal(
          floor, feature.building!, floor - i, feature.building!, feature));
    }
    if (floors.contains(floor + i)) {
      portals.add(GraphFeature.portal(
          floor, feature.building!, floor + i, feature.building!, feature));
    }
  }
  return portals;
}

Feature unwrap(GraphFeature feature) {
  return feature.when(
    buildingFloor: (floor, building) => building,
    portal: (fromFloor, from, toFloor, to, baseFeature) => baseFeature,
    basicFeature: (floor, building, f) => f,
  );
}

double sum(double left, double right) => left + right;

// WeightedDirectedGraph createGraph(Feature origin, List<Feature> allFeatures) {
//
// }

List<GraphFeature> findAdjacent(
    GraphFeature feature, Iterable<Feature> allFeatures) {
  List<GraphFeature> adjacentFeatures = [];

  if (feature is BuildingFloor) {
    // find all features in the building on the right floor
    adjacentFeatures = allFeatures
        .where((f) => eq(f.building, feature.building.name) || f.type is Door)
        .where((f) => f.type.maybeWhen(
            lift: (levels) => levels.contains(feature.floor),
            stairs: (levels) => levels.contains(feature.floor),
            door: (connections) =>
                f.level == feature.floor &&
                connections
                    .map((e) => e.toLowerCase())
                    .contains(feature.building.name.toLowerCase()),
            orElse: () => f.level == feature.floor))
        .mapMany((f) => wrap(f, feature.floor, feature.building.name))
        .toList();
  } else if (feature is Portal) {
    adjacentFeatures = allFeatures
        .where((f) => eq(f.name, feature.to) && f.type is Building)
        .mapMany((f) => wrap(f, feature.toFloor, feature.to))
        .toList();
  } else if (feature is BasicFeature) {
    adjacentFeatures = allFeatures
        .where(
            (f) => eq(f.name, feature.feature.building) && f.type is Building)
        .mapMany((f) => wrap(f, feature.feature.level!, f.name))
        .toList();
  }
  return adjacentFeatures;
}

Graph makeGraph(GraphFeature origin, List<Feature> allFeatures,
    [Graph? graph]) {
  // final usedFeatures = <GraphFeature>[origin];

  graph ??= Graph();
  graph.addNode(origin);

  final adjacent = findAdjacent(origin, allFeatures);
  for (final feature in adjacent.asSet()..removeAll(graph.nodes)) {
    graph.addEdge(origin, feature,
        origin.metersTo(feature)); // (feature is Portal ? 10.0 : 0.0));
    final _ = makeGraph(feature, allFeatures, graph);
    // graph.addAll(deeper);
  }

  return graph;
}

Result<List<(GraphFeature, double)>> findShortestPath(GraphFeature origin,
    bool Function(GraphFeature) destinationSelector, List<Feature> allFeatures,
    {heuristicVariant = "zero", heuristicMultiplier = 0.2}) {
  Graph graph = makeGraph(origin, allFeatures);

  final GraphFeature? destination =
      graph.nodes.firstWhereOrNull(destinationSelector);

  if (!(graph.contains(origin) &&
      destination != null &&
      graph.contains(destination))) {
    return bail("Origin or destination not in graph");
  }

  // euclidean distance heuristic

  double Function(GraphFeature) heuristic =
      (GraphFeature node) => 0.0; // standard zero
  if (heuristicVariant == "zero") {
    heuristic = (GraphFeature node) => 0.0;
  } else if (heuristicVariant == "euclidean") {
    heuristic =
        (GraphFeature node) => node.metersTo(destination) * heuristicMultiplier;
  }

  //heuristic(GraphFeature node) => 0.0;

  // openlist
  // format: (heuristic, g-val, parent?, node)
  PriorityQueue<(double, double, GraphFeature?, GraphFeature)> openlist =
      HeapPriorityQueue(
    // reverse order (cmp b to a) because lower f-val (shorter distance) is better
    (a, b) => (b.$1 + b.$2).compareTo((a.$1 + a.$2)),
  );

  final Map<GraphFeature, (GraphFeature?, double)> bestPathMap = {
    origin: (null, 0.0)
  };

  openlist.add((heuristic(origin), 0.0, null, origin));

  // closed list
  Set<GraphFeature> closedlist = {};

  var cost = 0.0;

  while (openlist.isNotEmpty) {
    final (f, g, parent, node) = openlist.removeFirst();
    closedlist.add(node);
    bestPathMap[node] = (parent, g);
    if (node == destination) {
      cost = g;
      break;
      // TODO: restore path
    }

    // expand node
    final edges = graph.getEdges(node);
    for (final entry in edges) {
      final adjNode = entry.$3;
      final adjCost = entry.$2;

      if (closedlist.contains(adjNode)) {
        continue;
      }

      bool found = false;
      for (final open in openlist.unorderedElements) {
        if (open.$4 == adjNode) {
          found = true;
          if (g + adjCost < open.$2) {
            openlist.remove(open);
            openlist.add((
              open.$1 /* heuristic stays the same */,
              g + adjCost,
              adjNode,
              open.$4
            ));
          }
          break;
        }
      }

      if (!found) {
        openlist.add((
          f + heuristic(adjNode),
          g + adjCost,
          node,
          adjNode,
        ));
      }
    }
  }
  if (bestPathMap.isNotEmpty) {
    final path = <(GraphFeature, double)>[];
    (GraphFeature?, double)? currentNode = (destination, cost);
    while (currentNode?.$1 != null) {
      final nextNode = bestPathMap[currentNode!.$1];
      path.insert(
          0, (currentNode!.$1!, currentNode.$2 - (nextNode?.$2 ?? 0.0)));
      currentNode = nextNode;
    }
    return Ok(path);
  }

  return bail("No path found");
}
