import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:mobile_guys_run/modules/maps/models/entry.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class MyMap extends StatefulWidget {
  const MyMap({Key? key}) : super(key: key);

  @override
  State<MyMap> createState() => MyMapState();
}

class MyMapState extends State<MyMap> {
  final Location _location = Location();
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();

  Set<Polyline> polyline = {};
  late GoogleMapController _mapController;
  final LatLng _center = const LatLng(0, 0);
  List<LatLng> route = [];
  String _displayTime = '0';
  int _time = 0;
  int _lastTime = 0;
  double _dist = 0;
  double _speed = 0;
  double _avgSpeed = 0;
  int _speedCounter = 0;
  Marker? _origin;
  Marker? _destination;
  Location currentLocation = Location();
  Set<Marker> _markers = {};

  void getLocation() async {
    var location = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((LocationData loc) {
      _mapController
          .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
        zoom: 12.0,
      )));
      print(loc.latitude);
      print(loc.longitude);
      setState(() {
        _markers.add(Marker(
            markerId: const MarkerId('Home'),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)));
      });
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    double appendDist;

    _location.onLocationChanged.listen((event) {
      LatLng loc = LatLng(event.latitude!, event.longitude!);
      _mapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: loc, zoom: 20)));

      if (route.isNotEmpty) {
        appendDist = Geolocator.distanceBetween(route.last.latitude,
            route.last.longitude, loc.latitude, loc.longitude);
        _dist = _dist + appendDist;
        int timeDuration = (_time - _lastTime);

        if (_lastTime != 0 && timeDuration != 0) {
          _speed = (appendDist / (timeDuration / 100)) * 3.6;
          if (_speed != 0) {
            _avgSpeed = _avgSpeed + _speed;
            _speedCounter++;
          }
        }
      }
      _lastTime = _time;
      route.add(loc);

      polyline.add(Polyline(
          polylineId: PolylineId(event.toString()),
          visible: true,
          points: route,
          width: 5,
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
          color: Colors.deepOrange));

      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
  }

  @override
  void dispose() async {
    await _stopWatchTimer.dispose(); // Need to call dispose function.

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            //mapType: MapType.hybrid,
            myLocationEnabled: true,
            zoomControlsEnabled: true,
            initialCameraPosition: CameraPosition(target: _center, zoom: 20),
            onMapCreated: _onMapCreated,
            myLocationButtonEnabled: true,
            polylines: polyline,
            zoomGesturesEnabled: true,
            // markers: {
            //   if (_origin != null) _origin!,
            //   if (_destination != null) _destination!,
            // },
            // onLongPress: _addMarker,
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 40),
                height: 140,
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text("SPEED (KM/H)",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w300)),
                            Text(_speed.toStringAsFixed(2),
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w300))
                          ],
                        ),
                        Column(
                          children: [
                            const Text("TIME",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w300)),
                            StreamBuilder<int>(
                              stream: _stopWatchTimer.rawTime,
                              initialData: 0,
                              builder: (context, snap) {
                                _time = snap.data!;
                                _displayTime =
                                    "${StopWatchTimer.getDisplayTimeHours(_time)}:${StopWatchTimer.getDisplayTimeMinute(_time)}:${StopWatchTimer.getDisplayTimeSecond(_time)}";
                                return Text(_displayTime,
                                    style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w300));
                              },
                            )
                          ],
                        ),
                        Column(
                          children: [
                            const Text("DISTANCE (KM)",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w300)),
                            Text((_dist / 1000).toStringAsFixed(2),
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w300))
                          ],
                        )
                      ],
                    ),
                    const Divider(),
                    IconButton(
                      icon: const Icon(
                        Icons.stop_circle_outlined,
                        size: 50,
                        color: Colors.redAccent,
                      ),
                      padding: const EdgeInsets.all(0),
                      onPressed: () async {
                        Entry en = Entry(
                            date: DateFormat.yMMMMd('en_US')
                                .format(DateTime.now()),
                            duration: _displayTime,
                            speed: _speedCounter == 0
                                ? 0
                                : _avgSpeed / _speedCounter,
                            distance: _dist);
                        //Navigator.pop(context, en);
                      },
                    )
                  ],
                ),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.location_searching,
          color: Colors.white,
        ),
        onPressed: () {
          getLocation();
        },
      ),
    );
  }

// void _addMarker(LatLng pos) async {
//   if (_origin == null || (_origin != null && _destination != null)) {
//     // Origin is not set OR Origin/Destination are both set
//     // Set origin
//     setState(() {
//       _origin = Marker(
//         markerId: const MarkerId('origin'),
//         infoWindow: const InfoWindow(title: 'Origin'),
//         icon:
//             BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//         position: pos,
//       );
//       // Reset destination
//       _destination = null;
//
//       // Reset info
//     });
//   } else {
//     // Origin is already set
//     // Set destination
//     setState(() {
//       _destination = Marker(
//         markerId: const MarkerId('destination'),
//         infoWindow: const InfoWindow(title: 'Destination'),
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//         position: pos,
//       );
//     });
//   }
// }
}
