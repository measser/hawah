import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hawwah/models/search/place_details.dart';
import 'package:hawwah/models/search/places_suggestion.dart';
import 'package:hawwah/modules/search/cubit/search_cubit.dart';
import 'package:hawwah/modules/search/location_helper.dart';
import 'package:hawwah/modules/search/search_screen.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:uuid/uuid.dart';

import '../../models/search/place_directions_model.dart';
import 'widgets/bottom_sheet_details.dart';
import 'widgets/distance_and_time.dart';
import 'widgets/place_item.dart';

class SearchLab extends StatefulWidget {
  const SearchLab({Key? key}) : super(key: key);

  @override
  State<SearchLab> createState() => _SearchLabState();
}

class _SearchLabState extends State<SearchLab> {
  List<PlaceSuggestion> places = [];

  Completer<GoogleMapController> _mapController = Completer();

  FloatingSearchBarController floatingSearchBarController =
  FloatingSearchBarController();
  GlobalKey<FormState> floatingSearchBarKey = GlobalKey<FormState>();
  static Position? position;

  // Variables for getPlacesLocation///
  Set<Marker> markers = {};
  late PlaceSuggestion placeSuggestion;
  late Place selectedPlace;
  late Marker searchedPlaceMarker;
  late Marker currentLocationMarker;
  late CameraPosition goToSearchedForPlacePosition;

  @override
  initState() {
    super.initState();
    _getMyCurrentLocation();
    addMarkers();
  }



  void addMarkers() async {
    markers.add(  Marker(
      markerId:  MarkerId("Said"),
      position:  LatLng(position!.latitude, position!.longitude),
      //TODO: add ifo window
      infoWindow:  const InfoWindow(
        title:  "موقعك الحالى",
        //TODO: add onTap

      ),

      //TODO: add icon
      //icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),


    ));
    markers.add( Marker(
      markerId:  const MarkerId("عيادات مصر الحديثة"),
      position:  const LatLng(30.040580224190187, 31.20536412974938),
      //TODO: add ifo window
      infoWindow:  InfoWindow(
        title:  "عيادات مصر الحديثة",
        //TODO: add onTap
        onTap: () {

          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            context: context,
            builder: (ctx)=> buildDoctorMarkerDetails(
              doctorName: "عيادات مصر الحديثة",
              doctorAddress: "٣٩ ش د/ ميشيل باخوم من ش نادى الصيد - الدقى - امام مترو ماركت -الجيزة",
              doctorNumber: "01005511274",
              doctorServices1: "-علاج أورام الثدى",
              doctorServices2: "-جراحة عامة \n - اورام النسا ",
            ),
          );
        },
      ),
      //TODO: add icon
      //icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),


    ));

    markers.add( Marker(
      markerId:  const MarkerId("ABC"),
      position:  const LatLng(30.056669401477368, 31.205585766312964),
      //TODO: add ifo window
      infoWindow:  InfoWindow(
        title:  "ArabBreastCare (ABC)",
        //TODO: add onTap
        onTap: () {

          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            context: context,
            builder: (ctx)=> buildDoctorMarkerDetails(
              doctorName: "ArabBreastCare (ABC)",
              doctorAddress: "شارع جامعه الدول العربيه رقم 26 العماره اللي فيها مترو ماركت الدور الاول",
              doctorNumber: "0233465127",
              doctorServices1: "-علاج أورام الثدى",
              doctorServices2: "-جراحة عامة \n - اورام النسا ",
            ),
          );
        },
      ),
      //TODO: add icon
      //icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),


    ));

    markers.add( Marker(
      markerId:  const MarkerId("Egybrit"),
      position:  const LatLng(30.090081565154577, 31.328327918802596),
      //TODO: add ifo window
      infoWindow:  InfoWindow(
        title:  "مركز علاج الاورام (Egybrit)",
        //TODO: add onTap
        onTap: () {

          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            context: context,
            builder: (ctx)=> buildDoctorMarkerDetails(
              doctorName: "مركز علاج الاورام (Egybrit)",
              doctorAddress: "18Thawra st. QNB building, Heliopolis, Cairo",
              doctorNumber: "01557761111",
              doctorServices1: "-علاج أورام الثدى",
              doctorServices2: "-الكشف المبكر والفحص والتشخيص\n - علاج الأورام \n - العلاج الطبيعى والتغذية  ",
            ),
          );
        },
      ),
      //TODO: add icon
      //icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),


    ));

    markers.add( Marker(
      markerId:  const MarkerId("Alfa"),
      position:  const LatLng(30.098331975992483, 31.342409986474898),
      //TODO: add ifo window
      infoWindow:  InfoWindow(
        title:  "Alfa Cure Center",
        //TODO: add onTap
        onTap: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            context: context,
            builder: (ctx)=> buildDoctorMarkerDetails(
              doctorName: "Alfa Cure Center",
              doctorAddress: "116ش النزهة , هليوبلس, محافظة القاهرة",
              doctorNumber: "01101142143",
              doctorServices1: "-علاج أورام الثدى",
              doctorServices2: "-العلاج الاشعاعى\n - العلاج الكيماوى \n - العلاج بالنظائر المشعة  ",
            ),
          );
        },
      ),
      //TODO: add icon
      //icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),


    ));

    markers.add( Marker(
      markerId:  const MarkerId("Hope"),
      position:  const LatLng(30.019984666393285, 31.434304402304036),
      //TODO: add ifo window
      infoWindow:  InfoWindow(
        title:  "Hope Cure Oncology Center - مركز أمل لعلاج الأورام",
        //snippet:  "This is a marker that has a info window",
        //TODO: add onTap
        onTap: () {
          print("Marker onTap");
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            context: context,
            builder: (ctx)=> buildDoctorMarkerDetails(
              doctorName:  "Hope Cure Oncology Center - مركز أمل لعلاج الأورام",
              doctorAddress: " التجمع الخامس : ش التسعين ميديكال بارك بريمير الدور الأرضي خلف المستشفي الجوي",
              doctorNumber: " 01013313371",
              doctorServices1: " -علاج الاورام \n - العلاج الكيماوي \n - العلاج الاشعاعي",
              doctorServices2: "- العلاج الهرموني \n - العلاج الموجه \n - العلاج المناعي",
            ),
          );
        },
      ),
      //TODO: add icon
      //icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),


    ));

    markers.add( Marker(
      markerId:  const MarkerId("3"),
      position:  const LatLng(31.04614555481647, 31.387970759505436),
      //TODO: add ifo window
      infoWindow:  InfoWindow(
        title:   "Hope Cure Oncology Center - مركز أمل لعلاج الأورام",
        //snippet:  "This is a marker that has a info window",
        //TODO: add onTap
        onTap: () {
          print("Marker onTap");
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            context: context,
            builder: (ctx)=> buildDoctorMarkerDetails(
              doctorName:  "Hope Cure Oncology Center - مركز أمل لعلاج الأورام",
              doctorAddress: "المنصورة :ميدان المحطة برج الأطباء الدور الثامن مركز سيتي لعلاج الأورام سابقا",
              doctorNumber: " 01119255591 \n 0502300841",
              doctorServices1: " -علاج الاورام \n - العلاج الكيماوي \n - العلاج الاشعاعي",
              doctorServices2: "- العلاج الهرموني \n - العلاج الموجه \n - العلاج المناعي",
            ),
          );
        },
      ),
      //TODO: add icon

    ));


    markers.add( Marker(
      markerId:  const MarkerId("Sphinx"),
      position:  const LatLng(30.063356524608636, 31.20463746556843),
      //TODO: add ifo window
      infoWindow:  InfoWindow(
        title:   "مركز سفنكس للتشخيص المبكر وعلاج الاورام - Sphinx Cure Oncology Center",
        //snippet:  "This is a marker that has a info window",
        //TODO: add onTap
        onTap: () {
          print("Marker onTap");
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            context: context,
            builder: (ctx)=> buildDoctorMarkerDetails(
              doctorName:  "مركز سفنكس للتشخيص المبكر وعلاج الاورام - Sphinx Cure Oncology Center",
              doctorAddress: "Mohandeseen 90 (A) Ahmed Oraby St.(Omar Effendi Building)",
              doctorNumber: " 01007074786 \n  01004141404",
              doctorServices1: " -طب الأورام والعلاج الإشعاعي",
              doctorServices2: "- العلاج الهرموني\n - العلاج المناعي",
            ),
          );
        },
      ),
      //TODO: add icon

    ));

    markers.add( Marker(
      markerId:  const MarkerId("بهية"),
      position:  const LatLng(30.004599288756157, 31.186781784412513),
      //TODO: add ifo window
      infoWindow:  InfoWindow(
        title:    "مؤسسة بهية",
        //snippet:  "This is a marker that has a info window",
        //TODO: add onTap
        onTap: () {
          print("Marker onTap");
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            context: context,
            builder: (ctx)=> buildDoctorMarkerDetails(
              doctorName:  "مؤسسة بهية",
              doctorAddress: "4 شارع علوبة أول شارع الهرم بجوار داري , الجيزة , مصر",
              doctorNumber: "16602",
              doctorServices1: " -طب الأورام والعلاج الإشعاعي",
              doctorServices2: "- الصيدلة الاكلينيكية \n - العلاج المناعي",
            ),
          );
        },
      ),
      //TODO: add icon

    ));
    markers.add( Marker(
      markerId:  const MarkerId("BCFE"),
      position:  const LatLng(30.02680612442372, 31.23225649300966),
      //TODO: add ifo window
      infoWindow:  InfoWindow(
        title:    "المؤسسة المصرية لمكافحة سرطان الثدى (BCFE)",
        //snippet:  "This is a marker that has a info window",
        //TODO: add onTap
        onTap: () {
          print("Marker onTap");
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            context: context,
            builder: (ctx)=> buildDoctorMarkerDetails(
              doctorName:  "المؤسسة المصرية لمكافحة سرطان الثدى (BCFE)",
              doctorAddress: "33 شارع القصر العيني - فم الخليج، القاهرة 11441       الدور السابع - شقة 25",
              doctorNumber: "01003491104",
              doctorServices1: " -الكشف المبكر عن سرطان الثدى",
              doctorServices2: "تحليل الباثولوجى \n العمليات الجراحية \n أشعة الثدى",
            ),
          );
        },
      ),
      //TODO: add icon

    ));
    markers.add( Marker(
      markerId:  const MarkerId("Docspert"),
      position:  const LatLng(30.058213261242795, 31.32956335049295),
      //TODO: add ifo window
      infoWindow:  InfoWindow(
        title:    "Docspert Health",
        //TODO: add onTap
        onTap: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            context: context,
            builder: (ctx)=> buildDoctorMarkerDetails(
              doctorName:  "Docspert Health",
              doctorAddress: " 12ش عز الدين طه، مدينة نصر، القاهرة",
              doctorNumber: "01280958411 \n 01033564347",
              doctorServices1: " -الكشف المبكر عن الأورام",
              doctorServices2: "- جراحة النساء والخصوبة  \n -الجراحة العامة \n - المخ والأعصاب",
            ),
          );
        },
      ),
      //TODO: add icon

    ));

    markers.add( Marker(
      markerId:  const MarkerId("الخرطوم"),
      position:  const LatLng(15.560209884647229, 32.55208833200114),
      //TODO: add ifo window
      infoWindow:  InfoWindow(
        title:    "مركز الخرطوم لسرطان الثدى ",
        //TODO: add onTap
        onTap: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            context: context,
            builder: (ctx)=> buildDoctorMarkerDetails(
              doctorName:  "مركز الخرطوم لسرطان الثدى ",
              doctorAddress: "19شارع مأمون بحيرى ",
              doctorNumber: "2144",
              doctorServices1: " -الكشف المبكر عن سرطان الثدى",
              doctorServices2: "-العلاج الاشعاعى والكيميائى ",
            ),
          );
        },
      ),
      //TODO: add icon

    ));

  }



  // these variables for getDirections
  PlaceDirections? placeDirections;
  var progressIndicator = false;
  late List<LatLng> polylinePoints;
  var isSearchedPlaceMarkerClicked = false;
  var isTimeAndDistanceVisible = false;
  late String time;
  late String distance;



  void buildCameraNewPosition() {
    goToSearchedForPlacePosition = CameraPosition(
      bearing: 0.0,
      tilt: 0.0,
      target: LatLng(
        selectedPlace.result.geometry.location.lat,
        selectedPlace.result.geometry.location.lng,
      ),
      zoom: 13,
    );
  }

  static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      bearing: 0.0,
      tilt: 0.0,
      zoom: 14.0);

  Future<void> _getMyCurrentLocation() async {
    position = await LocationHelper.getCurrentPosition().whenComplete(() {
      setState(() {});
    });
  }

  Widget buildMap() {
    return GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _myCurrentLocationCameraPosition,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          setState(() {
            _mapController.complete(controller);
          });
        },
        markers: markers,
        polylines: placeDirections != null
            ? {
          Polyline(
            polylineId: const PolylineId("my_polyline"),
            //visible: true,
            points: polylinePoints,
            width: 3,
            color: Colors.red,
          ),
        } : {}

    );
  }

  Future<void> _goToMyCurrentLocation() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(_myCurrentLocationCameraPosition));
  }

  Widget buildFloatingSearchBar() {
    final isPortrait =
        MediaQuery
            .of(context)
            .orientation == Orientation.portrait;
    return FloatingSearchBar(
        key: floatingSearchBarKey,
        controller: floatingSearchBarController,
        elevation: 6,
        hintStyle: const TextStyle(fontSize: 20, color: Colors.grey),
        queryStyle: const TextStyle(fontSize: 18),
        hint: 'البحث عن معمل للتحاليل ....',
        border: const BorderSide(style: BorderStyle.none),
        margins: const EdgeInsets.fromLTRB(20, 95, 20, 0),
        padding: const EdgeInsets.fromLTRB(2, 0, 30, 0),
        height: 52,
        iconColor: thirdColor,
        scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
        transitionDuration: const Duration(milliseconds: 600),
        transitionCurve: Curves.easeInOut,
        physics: const BouncingScrollPhysics(),
        axisAlignment: isPortrait ? 0.0 : -1.0,
        openAxisAlignment: 0.0,
        width: isPortrait ? 600 : 600,
        debounceDelay: const Duration(milliseconds: 500),
        progress: progressIndicator,
        onQueryChanged: (query) {
          getPlacesSuggestions(query);
        },
        onFocusChanged: (_) {
          // hid distance and time:
          setState(() {
            isTimeAndDistanceVisible = false;
          });
        },
        transition: CircularFloatingSearchBarTransition(),
        actions: [
          FloatingSearchBarAction(
            showIfOpened: false,
            child: CircularButton(
              icon: Icon(Icons.place, color: thirdColor),
              onPressed: () {},
            ),
          )
        ],
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildSuggestionBloc(),
                  buildSelectedPlaceLocationBloc(),
                  buildDirectionsBloc(),
                ]),
          );
        });
  }

  Widget buildDirectionsBloc(){
    return BlocListener<SearchCubit, SearchStates>(
      listener: (context, state) {
        if (state is PlacesDirectionsLoadedState) {
          placeDirections = (state).placeDirections;
          getPolylinePoints();
          // setState(() {
          //
          // });

        }
      },
      child: Container(),

    );
  }

  void getPolylinePoints() {
    polylinePoints = placeDirections!.polylinePoints.map((e) => LatLng(e.latitude, e.longitude)).toList();
  }

  Widget buildSelectedPlaceLocationBloc() {
    return BlocListener<SearchCubit, SearchStates>(
      listener: (context, state) {
        if (state is PlacesDetailsLoadedState) {
          selectedPlace = (state).place;
          goToMySearchedLocation();
          getDirections();
        }

      },
      child: Container(),
    );
  }

  void getDirections(){
    BlocProvider.of<SearchCubit>(context).emitPlacesDirections(
      LatLng(position!.latitude, position!.longitude),
      LatLng(selectedPlace.result.geometry.location.lat,
          selectedPlace.result.geometry.location.lng),
    );
  }

  Future<void> goToMySearchedLocation() async {
    buildCameraNewPosition();
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(goToSearchedForPlacePosition));
    buildSearchedPlaceMarker();
  }

  void buildSearchedPlaceMarker(){
    searchedPlaceMarker = Marker(
      position: goToSearchedForPlacePosition.target,
      markerId:  MarkerId('1'),
      onTap: () {
        buildCurrentLocationMarker();
        // Show Time And Distance :
        setState(() {
          isSearchedPlaceMarkerClicked = true;
          isTimeAndDistanceVisible = true;
        });
      },
      infoWindow: InfoWindow(
        title: "${placeSuggestion.description}",
      ),

    );
    addMarkerToMarkersAndUpdateUi(searchedPlaceMarker);
  }

  void buildCurrentLocationMarker() {
    currentLocationMarker = Marker(
      position: LatLng(position!.latitude, position!.longitude),
      markerId: const MarkerId('2'),
      onTap: () {},
      infoWindow: const InfoWindow(
        title: "Your Current Location",
      ),

    );
    addMarkerToMarkersAndUpdateUi(currentLocationMarker);
  }



  void addMarkerToMarkersAndUpdateUi(Marker marker) {

    setState(() {
      markers.add(marker);
    });
  }

  void getPlacesSuggestions(String query) {
    final sessionToken = const Uuid().v4();
    BlocProvider.of<SearchCubit>(context)
        .emitPlacesSuggestion(query, sessionToken);
  }

  Widget buildSuggestionBloc() {
    return BlocBuilder<SearchCubit, SearchStates>(
        builder: (context, state) {
          if (state is PlacesLoadedState) {
            places = (state).places;
            if (places.length != 0) {
              return buildPlacesList();
            } else {
              return Container();
            }
          } else {
            return Container();
          }
        });
  }

  Widget buildPlacesList() {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return InkWell(
          onTap: () async {
            placeSuggestion = places[index];
            floatingSearchBarController.close();
            getSelectedPlaceLocation();
            polylinePoints.clear();
            // remove all markers :
          },
          child: PlaceItem(
            suggestion: places[index],
          ),
        );
      },
      itemCount: places.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
    );
  }

  void getSelectedPlaceLocation() async {
    final sessionToken = const Uuid().v4();
    BlocProvider.of<SearchCubit>(context).emitPlacesDetailsLocation(
      placeSuggestion.placeId,
      sessionToken,
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 8, 3),
        child: FloatingActionButton(
            backgroundColor: thirdColor,
            child: const Icon(
              Icons.my_location,
              color: Colors.white,
            ),
            onPressed: (){
              _goToMyCurrentLocation();
            }),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          position != null
              ? buildMap()
              : const Center(
            child: CircularProgressIndicator(),
          ),
          Positioned(
            top: 30,
            left: 10,
            right: 0,

            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SearchScreen()));
                        },
                        icon:  Icon(
                          Icons.arrow_back_ios,
                          color:thirdColor,
                          size: 30,
                        ),
                      ),
                      const Spacer(),
                      const Image(
                        image: AssetImage('assets/icons/search_laboratory.png'),
                        height: 50.0,
                        width: 50.0,
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ),

          buildFloatingSearchBar(),
          isSearchedPlaceMarkerClicked
              ?
          DistanceAndTime(
            isTimeAndDistanceVisible: isTimeAndDistanceVisible,
            placeDirections: placeDirections,
          )
              : Container(),

        ],),
    );
  }
}





