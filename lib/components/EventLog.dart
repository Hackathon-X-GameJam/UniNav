import 'package:flutter/material.dart';
import 'package:uninav/nav/graph.dart';
import 'package:uninav/util/util.dart';

class EventLog extends StatefulWidget {
  final List<GraphFeature> events;

  const EventLog({Key? key, required this.events}) : super(key: key);

  @override
  _EventLogState createState() => _EventLogState();
}

class _EventLogState extends State<EventLog> {
  int _selectedIndex = -1;

  void _onEventTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _scrollController.animateTo(
      index * _itemExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  final ScrollController _scrollController = ScrollController();
  static const double _itemExtent = 60.0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          controller: _scrollController,
          itemExtent: _itemExtent + 8.0,
          itemCount: widget.events.length,
          itemBuilder: (BuildContext context, int index) {
            final event = widget.events[index];
            final isActive = index >= _selectedIndex;
            return GestureDetector(
              onTap: () => _onEventTapped(index),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color:
                      isActive ? Colors.white : Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4.0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(getIconForEvent(event)),
                    const SizedBox(width: 8.0),
                    Text(
                      getLabelForEvent(event),
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

IconData getIconForEvent(GraphFeature event) => event.when(
      buildingFloor: (level, feature) => Icons.directions_walk,
      portal: (fromFloor, from, toFloor, to, baseFeature) =>
          baseFeature.type.maybeWhen(
        door: (connects) => Icons.door_front_door,
        stairs: (connects) => Icons.stairs,
        lift: (connects_levels) => Icons.elevator,
        orElse: () => Icons.question_mark,
      ),
      basicFeature: (level, building, baseFeature) => Icons.location_on,
    );

String getLabelForEvent(GraphFeature event) => event.when(
      buildingFloor: (level, feature) => feature.name,
      portal: (fromFloor, from, toFloor, to, baseFeature) =>
          "$from:$fromFloor -> $to:$toFloor",
      basicFeature: (level, building, baseFeature) =>
          formatFeatureTitle(baseFeature),
    );
