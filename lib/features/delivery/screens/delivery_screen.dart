import 'dart:async';
import 'dart:io';
import 'package:coffee_shop/common/theme/pallete.dart';
import 'package:coffee_shop/features/delivery/widgets/progress_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import '../../../common/secret/google_api_key.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  static const String routeName = 'delivery';

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  final ScrollController scrollController = ScrollController();

  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  static const LatLng _pApplePark = LatLng(37.3346, -122.0090);
  static const LatLng _googlePlex = LatLng(37.427964, -122.08574);

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  final Location _locationController = Location();

  LatLng? _currentLocation;

  Map<PolylineId, Polyline> polylines = {};

  void setMarkerIcon() {
    // BitmapDescriptor.fromAssetImage(const ImageConfiguration(), "assets/images/")
    //     .then((icon) {
    //   setState(() {
    //     markerIcon = icon;
    //   });
    // });
  }

  Future<void> getUserCurrentLocation() async {
    bool serviceLocationEnable;

    PermissionStatus permissionGranted;

    serviceLocationEnable = await _locationController.serviceEnabled();

    if (serviceLocationEnable) {
      serviceLocationEnable = await _locationController.requestService();
    } else {
      return;
    }

    permissionGranted = await _locationController.hasPermission();

    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _locationController.requestPermission();

      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentLocation =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          cameraToPosition(_currentLocation!);
        });
      }
    });
  }

  Future<void> cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;

    CameraPosition cameraPosition = CameraPosition(
      target: pos,
      zoom: 13,
    );

    await controller
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  Future<List<LatLng>> getPolynineCoordinates() async {
    List<LatLng> polylineCoordinate = [];

    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult polylineResult =
        await polylinePoints.getRouteBetweenCoordinates(
            googleApiKey,
            PointLatLng(_googlePlex.latitude, _googlePlex.longitude),
            PointLatLng(_pApplePark.latitude, _pApplePark.longitude),
            travelMode: TravelMode.driving);

    if (polylineResult.points.isNotEmpty) {
      for (PointLatLng point in polylineResult.points) {
        polylineCoordinate.add(LatLng(point.latitude, point.longitude));
      }
    } else {
      throw Exception(polylineResult.errorMessage);
    }

    return polylineCoordinate;
  }

  void generatePolylineFromPoint(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Pallete.primaryColor,
        points: polylineCoordinates,
        width: 8);

    setState(() {
      polylines[id] = polyline;
    });
  }

  @override
  void initState() {
    super.initState();
    setMarkerIcon();
    getUserCurrentLocation().then((value) => {
          getPolynineCoordinates()
              .then((coordonate) => {generatePolylineFromPoint(coordonate)})
        });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * .01;
    return Scaffold(
      backgroundColor: Pallete.textlightDarkColor,
      body: Stack(fit: StackFit.expand, children: [
        _currentLocation != null
            ? GoogleMap(
                initialCameraPosition:
                    const CameraPosition(target: _googlePlex, zoom: 13),
                onMapCreated: ((GoogleMapController controller) =>
                    _mapController.complete(controller)),
                markers: {
                  Marker(
                      markerId: const MarkerId("_current_location"),
                      icon: markerIcon,
                      position: _currentLocation!),
                  Marker(
                      markerId: const MarkerId("coffee_shop"),
                      icon: markerIcon,
                      position: _googlePlex),
                  Marker(
                      markerId: const MarkerId("delivery_place"),
                      icon: markerIcon,
                      position: _pApplePark),
                },
                polylines: Set<Polyline>.of(polylines.values),
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: Pallete.primaryColor,
                ),
              ),
        Positioned(
            top: 45,
            child: Container(
              width: width * 93,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Pallete.whiteColor),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                          onTap: () => context.pop(),
                          borderRadius: BorderRadius.circular(15),
                          child: Icon(
                            Platform.isAndroid
                                ? Icons.arrow_back
                                : Icons.arrow_back_ios,
                            color: Pallete.titleColor,
                          )),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Pallete.whiteColor),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(15),
                          child: const Center(
                            child: Icon(
                              Icons.gps_fixed_rounded,
                              color: Pallete.titleColor,
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ))
      ]),
      bottomSheet: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.4,
        minChildSize: 0.03,
        maxChildSize: 0.7,
        builder: (context, scrollDragController) => SingleChildScrollView(
          controller: scrollDragController,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            width: double.maxFinite,
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Pallete.indicatorColor,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '10 minutes left',
                  style: GoogleFonts.sora(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Pallete.titleColor),
                ),
                const SizedBox(
                  height: 8,
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Delivery to",
                        style: GoogleFonts.sora(
                            color: Pallete.subTitleColor, fontSize: 12)),
                    TextSpan(
                        text: " J1. Kpg Sutoyo",
                        style: GoogleFonts.sora(
                            color: Pallete.titleColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600))
                  ]),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProgressBarWidget(color: Pallete.greenColor),
                    ProgressBarWidget(color: Pallete.greenColor),
                    ProgressBarWidget(color: Pallete.greenColor),
                    ProgressBarWidget(color: Pallete.progressBarGreyColor)
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      border: Border.all(
                          style: BorderStyle.solid, color: Pallete.greyColor),
                      borderRadius: BorderRadiusDirectional.circular(10)),
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              style: BorderStyle.solid,
                              color: Pallete.greyColor),
                        ),
                        child: Image.asset("assets/images/delivery.png"),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Delivered your order",
                            style: GoogleFonts.sora(
                                color: Pallete.titleColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: width * 100 <= 360 ? width * 60 : width * 65,
                            child: Text(
                              "We deliver your goods to you in the shortes possible time.",
                              style: GoogleFonts.sora(
                                  color: Pallete.subTitleColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            "assets/images/delivery_profil.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kevin KONE",
                              style: GoogleFonts.sora(
                                  color: Pallete.titleColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Personal Courier",
                              style: GoogleFonts.sora(
                                  color: Pallete.subTitleColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            style: BorderStyle.solid, color: Pallete.greyColor),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: () {},
                          child: const Icon(
                            Icons.phone_in_talk,
                            color: Pallete.titleColor,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
