import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:uninav/components/drawer..dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Map'),
            leading: Builder(
              builder: (context) {
                return IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              }
            ),

            // right side expanding search bar widget
            actions: [
              AnimSearchBar(
                width: /* media query device width  */ 300,
                textController: TextEditingController(),
                onSuffixTap: () {
                  print('Search');
                },
                closeSearchOnSuffixTap: false,
                onSubmitted: (p0) => {
                  print('Search: $p0'),
                },
              ),
            ]),
        drawer: MyDrawer(),
        body: FlutterMap(
          mapController: MapController(),
          options: MapOptions(
            center: LatLng(51.5, -0.09),
            zoom: 13.0,
          ),
          children: [
            TileLayer(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: const ['a', 'b', 'c'],
            ),
            RichAttributionWidget(attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
                onTap: () =>
                    launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
              )
            ])
            // PolygonLayer(polygons: myGeoJson.polygons),
            // PolylineLayer(polylines: myGeoJson.polylines),
            // MarkerLayer(markers: myGeoJson.markers)
          ],
        ));
  }
}
