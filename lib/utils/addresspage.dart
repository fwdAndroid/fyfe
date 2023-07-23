import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fyfe/utils/text_util.dart';
import 'package:fyfe/utils/textformfield.dart';
import 'package:fyfe/widgets/palette.dart';
import 'package:fyfe/widgets/save_button_widget.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';

String routepage = "addressPage";

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  AddressPageState createState() => AddressPageState();
}

class AddressPageState extends State<AddressPage> {
  final controller = MapController(
    location: const LatLng(-33.8688, 151.2093),
  );

  @override
  void initState() {
    propertyAddressController.text = propertyAddressController.text;
    super.initState();
  }

  Future<void> getAddressFromLatLong(double latitude, double longitude) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    propertyAddressController.text =
        "${place.country}, ${place.administrativeArea}, ${place.thoroughfare} ${place.subLocality} ${place.locality}";
    setState(() {});
  }

  void _gotoDefault() {
    // controller.center = const LatLng(35.68, 51.41);
    // setState(() {});
    _determinePosition().then((value) {
      if (value is Position) {
        Position pos = value;
        controller.center = LatLng(pos.latitude, pos.longitude);
        controller.zoom = 17.0;
      }
      // controller.zoom
    }).onError((error, stackTrace) {});
    setState(() {});
  }

  void _onDoubleTap(MapTransformer transformer, Offset position) {
    const delta = 0.5;
    final zoom = clamp(controller.zoom + delta, 2, 18);

    transformer.setZoomInPlace(zoom, position);
    setState(() {});
  }

  Offset? _dragStart;
  double _scaleStart = 1.0;
  void _onScaleStart(ScaleStartDetails details) {
    _dragStart = details.focalPoint;
    _scaleStart = 1.0;
  }

  void _onScaleUpdate(ScaleUpdateDetails details, MapTransformer transformer) {
    final scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;

    if (scaleDiff > 0) {
      controller.zoom += 0.02;
      setState(() {});
    } else if (scaleDiff < 0) {
      controller.zoom -= 0.02;
      setState(() {});
    } else {
      final now = details.focalPoint;
      final diff = now - _dragStart!;
      _dragStart = now;
      transformer.drag(diff.dx, diff.dy);
      setState(() {});
    }
  }

  Future _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      // log('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        Geolocator.openAppSettings();
        // log('Location permissions are permanently denied, we cannot request permissions.');
        return;
      } else if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        // log('Location permissions are denied');
        return;
      }
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Widget _buildMarkerWidget(Offset pos, Color color, selected,
      [IconData icon = Icons.location_on]) {
    return Positioned(
      left: pos.dx - 24,
      top: pos.dy - 24,
      width: 48,
      height: 48,
      child: GestureDetector(
        child: Icon(
          selected ? Icons.home : icon,
          color: selected ? Colors.red : color,
          size: 48,
        ),
        onTap: () {
          locationSelected = true;
          setState(() {});

          getAddressFromLatLong(
              controller.center.latitude, controller.center.longitude);

          // showDialog(
          //   context: context,
          //   builder: (context) => const AlertDialog(
          //     content: Text('You have clicked a marker!'),
          //   ),
          // );
        },
      ),
    );
  }

  final formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool locationSelected = false;
  String errorLocation = "";
  TextEditingController propertyAddressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(colors: [
              Color(
                0xff3AC1CD,
              ),
              Color(
                0xff3AC1CD,
              ),
              Color(
                0xff3AADC6,
              ),
              Color(
                0xff395CAA,
              )
            ], radius: 1.8, center: Alignment.topCenter),
          ),
          padding: const EdgeInsets.fromLTRB(21.0, 21.0, 21.0, 21.0),
          child: Column(
            children: [
              Expanded(
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: TextUtil(
                                    title: "Address",
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 50)
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 9),
                          child: TextUtil(
                            title: "* Property Address",
                          ),
                        ),
                        const SizedBox(
                          height: 11,
                        ),
                        TextFormInputField(
                          controller: propertyAddressController,
                          validat: (value) {
                            if (value!.isEmpty) {
                              return "This field is required";
                            }
                            return null;
                          },
                          hintText: "15 Roma Rd St Ives",
                          textInputType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 500,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18)),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: MapLayout(
                                  controller: controller,
                                  builder: (context, transformer) {
                                    final centerLocation = Offset(
                                        transformer.constraints.biggest.width /
                                            2,
                                        transformer.constraints.biggest.height /
                                            2);

                                    final centerMarkerWidget =
                                        _buildMarkerWidget(centerLocation,
                                            Colors.purple, locationSelected);

                                    return GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onDoubleTapDown: (details) =>
                                          _onDoubleTap(
                                        transformer,
                                        details.localPosition,
                                      ),
                                      onScaleStart: _onScaleStart,
                                      onScaleUpdate: (details) =>
                                          locationSelected
                                              ? (v) {}
                                              : _onScaleUpdate(
                                                  details, transformer),
                                      child: Listener(
                                        behavior: HitTestBehavior.opaque,
                                        onPointerSignal: (event) {
                                          if (event is PointerScrollEvent) {
                                            final delta =
                                                event.scrollDelta.dy / -1000.0;
                                            final zoom = clamp(
                                                controller.zoom + delta, 2, 18);

                                            transformer.setZoomInPlace(
                                                zoom, event.localPosition);
                                            setState(() {});
                                          }
                                        },
                                        child: Stack(
                                          children: [
                                            TileLayer(
                                              builder: (context, x, y, z) {
                                                final tilesInZoom =
                                                    pow(2.0, z).floor();

                                                while (x < 0) {
                                                  x += tilesInZoom;
                                                }
                                                while (y < 0) {
                                                  y += tilesInZoom;
                                                }

                                                x %= tilesInZoom;
                                                y %= tilesInZoom;

                                                return CachedNetworkImage(
                                                  imageUrl:
                                                      'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425',
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                            ),
                                            // homeMarkerWidget,
                                            // ...markerWidgets,
                                            centerMarkerWidget,
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Positioned(
                                right: 10,
                                top: 10,
                                child: FloatingActionButton(
                                    heroTag: "btn1",
                                    onPressed: () {
                                      locationSelected = false;
                                      setState(() {});
                                    },
                                    backgroundColor: Colors.white,
                                    child: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Palette.aqua,
                                    )),
                              ),
                              Positioned(
                                right: 10,
                                bottom: 10,
                                child: FloatingActionButton(
                                  heroTag: "btn2",
                                  onPressed: _gotoDefault,
                                  tooltip: 'My Location',
                                  backgroundColor: Colors.white,
                                  child: const Icon(
                                    Icons.my_location,
                                    color: Palette.aqua,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (errorLocation.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 10),
                            child: Text(
                              errorLocation,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 195, 10, 10),
                                  backgroundColor:
                                      Color.fromARGB(255, 252, 221, 221),
                                  fontSize: 12),
                            ),
                          ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: SaveButton(
                            title: "Save",
                            onTap: () {
                              if (formKey.currentState!.validate() &&
                                  locationSelected) {
                                Navigator.pop(context, [
                                  propertyAddressController.text,
                                  controller.center.latitude,
                                  controller.center.longitude
                                ]);
                              } else if (!locationSelected) {
                                // errorLocation = "You must select a location";
                                // setState(() {});
                                Navigator.pop(context, [
                                  propertyAddressController.text,
                                  null,
                                  null
                                ]);
                              } else {
                                errorLocation = "";
                                setState(() {});
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double clamp(double x, double min, double max) {
    if (x < min) x = min;
    if (x > max) x = max;

    return x;
  }
}
