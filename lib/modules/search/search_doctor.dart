// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:hawwah/modules/search/search_screen.dart';
// import 'package:hawwah/shared/components/colors.dart';
//
// class SearchDoctor extends StatefulWidget {
//   final double? myLat,myLng;
//
//   const SearchDoctor({Key? key, this.myLat, this.myLng}) : super(key: key);
//   @override
//   State<SearchDoctor> createState() => _SearchDoctorState();
// }
//
// class _SearchDoctorState extends State<SearchDoctor> {
//   final Completer<GoogleMapController> _controller = Completer();
//
//   @override
//   initState() {
//     addMarkers();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//
//           body: Stack(
//         children: [
//           // Map Setting
//           SizedBox(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             child: GoogleMap(
//               mapType: MapType.normal,
//               initialCameraPosition: CameraPosition(
//                 target: LatLng(widget.myLat!, widget.myLng!),
//                 zoom: 10,
//               ),
//               myLocationEnabled: true,
//               tiltGesturesEnabled: true,
//               //compassEnabled: true,
//
//              // scrollGesturesEnabled: true,
//               zoomGesturesEnabled: true,
//               markers:myMarkers,
//               onMapCreated: (GoogleMapController controller) {
//                 setState(() {
//                   _controller.complete(controller);
//                 });
//               },
//             ),
//           ),
//
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const SearchScreen()));
//                       },
//                       icon:  Icon(
//                         Icons.arrow_back_ios,
//                         color:thirdColor,
//                         size: 30,
//                       ),
//                     ),
//                     const Spacer(),
//                     const Image(
//                       image: AssetImage('assets/icons/search_doctor.png'),
//                       height: 70.0,
//                     ),
//
//                   ],
//                 ),
//
//               ],
//             ),
//           ),
//         ],
//       )),
//     );
//   }
//
//
//   Set<Marker> myMarkers = {};
//
//   Future<void> addMarkers() async {
//     myMarkers.add( const Marker(
//       markerId:  MarkerId("Said"),
//       position:  LatLng(30.0541558938057, 31.346532475689095),
//
//     ));
//     myMarkers.add(const Marker(
//       markerId: MarkerId("user"),
//       position: LatLng(31.87633, 30.99056),
//     ));
//     myMarkers.add(const Marker(
//       markerId: MarkerId("Doctor"),
//       position: LatLng(31.83633, 30.90056),
//     ));
//     myMarkers.add(const Marker(
//         markerId: MarkerId("Labs"),
//         position: LatLng(31.222,31.877)));
//   }
// }

import 'dart:async';

import 'package:flutter/cupertino.dart';
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

class SearchDoctor extends StatefulWidget {
  const SearchDoctor({Key? key}) : super(key: key);

  @override
  State<SearchDoctor> createState() => _SearchDoctorState();
}

class _SearchDoctorState extends State<SearchDoctor> {
  List<PlaceSuggestion> places = [];

  Completer<GoogleMapController> _mapController = Completer();

  FloatingSearchBarController floatingSearchBarController =
  FloatingSearchBarController();
  GlobalKey<FormState> floatingSearchBarKey = GlobalKey<FormState>();
  static Position? position;

  //TODO Variables for getPlacesLocation///
  Set<Marker> markers = {};
   BitmapDescriptor? customIcon;
  getCustomIcon() async {
    customIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'assets/icons/search_doctor.png');
  }
  late PlaceSuggestion placeSuggestion;
  late Place selectedPlace;
  late Marker searchedPlaceMarker;
  late Marker currentLocationMarker;
  late CameraPosition goToSearchedForPlacePosition;

  //TODO these variables for getDirections
  PlaceDirections? placeDirections;
  var progressIndicator = false;
  late List<LatLng> polylinePoints;
  var isSearchedPlaceMarkerClicked = false;
  var isTimeAndDistanceVisible = false;
  late String time;
  late String distance;

  @override
  initState() {
    super.initState();
    _getMyCurrentLocation();
    getCustomIcon();
    addMarkers();
  }

  void addMarkers() async {
    // // Current Location Marker
    // markers.add(  Marker(
    //   markerId:  const MarkerId("currentLocation"),
    //   position:  LatLng(position!.latitude, position!.longitude),
    //   //TODO: add ifo window
    //   infoWindow:   InfoWindow(
    //     title:  "Your Current Location",
    //    // snippet:  "This is a marker that has a info window",
    //
    //     // onTap: (){
    //     //   showModalBottomSheet(
    //     //     shape: const RoundedRectangleBorder(
    //     //       borderRadius: BorderRadius.vertical(
    //     //         top: Radius.circular(30),
    //     //       ),
    //     //     ),
    //     //     context: context,
    //     //     builder: (context)=> buildDoctorMarkerDetails(
    //     //       doctorName: "klsjgksdlfm;lskjdf;",
    //     //       doctorAddressArabic: " lkdsfklshgkldfsh",
    //     //       doctorAddressEnglish: " -  8Mourad, Oula, Giza ;lsdfkjl;sjdf;kjs, Giza Governorate ",
    //     //       doctorNumber: " 0122523515163142207",
    //     //       doctorServices1: " -عـلاج السds,fmklsdرطـان",
    //     //       doctorServices2: "- الكشف المبكر والوskdfjklsjoifقاية من السرطان",
    //     //
    //     //     ),
    //     //   );
    //     // },
    //   ),
    //
    //
    //
    // ));

       //Doctor1 Marker
    markers.add( Marker(
      markerId:  const MarkerId("0"),
      position:  const LatLng(30.046428860664676, 31.21060976873396),
      //TODO: add ifo window
      infoWindow:  InfoWindow(
        title:  "مركز ا.د محمد عبدالله - د. عماد شاش لعلاج الأورام",
        snippet:  "This is a marker that has a info window",

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
              doctorName: "مركز ا.د محمد عبدالله - د. عماد شاش لعلاج الأورام",
              doctorAddress: " - 8 مراد، أولى، قسم الجيزة، الجيزة \n -  8Mourad, Oula, Giza District, Giza Governorate",
              doctorNumber: " 01223142207",
              doctorServices1: " -عـلاج السرطـان",
              doctorServices2: "- الكشف المبكر والوقاية من السرطان",

            ),
          );
        },
      ),


      //TODO: add icon
      //icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),


    ));
    // Doctor2 Marker
    markers.add( Marker(
      markerId:  const MarkerId("1"),
      position:  const LatLng(29.99886600175735, 31.22725178737928),
      //TODO: add ifo window
      infoWindow:  InfoWindow(
        title:  "د/ أشرف الزيــات",
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
              doctorName: "د/ أشرف الزيــات \n Dr. Ashraf El Zaiat",
              doctorAddress: " - 43 أول كورنيش المعادى القاهرة , مصـر ",
              doctorNumber: " 01020223215",
              doctorServices1: " -عملية استئصال سرطان الثدي \n - علاج سرطان الثدي \n - علاج إفرازات الثدي",
              doctorServices2: "- علاج اورام الثدي \n - علاج الم الثدي \n - عملية اعادة بناء الثدي",
            ),
          );
        },
      ),
      //TODO: add icon
      //icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),


    ));
    // Doctor3 Marker
    markers.add( Marker(
      markerId:  const MarkerId("2"),
      position:  const LatLng(30.019984666393285, 31.434304402304036),
      //TODO: add ifo window
      infoWindow:  InfoWindow(
        title:  "أ.د محمد سعد العشري",
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
              doctorName: "د/ محمد سعد العشرى\n Dr/ Mohamed Saad El Ashry",
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
   // Doctor4 Marker
    markers.add( Marker(
      markerId:  const MarkerId("3"),
      position:  const LatLng(30.04285926123055, 31.216192065783464),
      //TODO: add ifo window
      infoWindow:  InfoWindow(
        title:  "د/ إبراهيم سلام",
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
              doctorName: "د/ إبراهيم سلام",
              doctorAddress: "12El Saraya St. Vinny Square. MISR International Hospital,  Giza",
              doctorNumber: " 01003131181",
              doctorServices1: " - جراحات الثدى و الغدد و الاورام",
              doctorServices2: "- علاج التثدى عند الرجال \n - جراحات الاورام التجميلية",
            ),
          );
        },
      ),
      //TODO: add icon
      //icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),


    ));
    // Doctor5 Marker
    markers.add( Marker(
      markerId:  const MarkerId("3"),
      position:  const LatLng(30.11291411522357, 31.348412513443705),
      //TODO: add ifo window
      infoWindow:  InfoWindow(
        title:  "د/ جورج عزت فهمى",
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
              doctorName: "د/ جورج عزت فهمى \n Dr. George Ezzat Fahmy ",
              doctorAddress: "181 شارع الحجاز، المطار، قسم النزهة، محافظة القاهرة \n 181 El Hegaz St, Al Matar, El Nozha, Cairo Governorate ",
              doctorNumber: " 01003131181",
              doctorServices1: " - جراحات الثدى و الغدد و الاورام",
              doctorServices2: "- علاج التثدى عند الرجال \n - جراحات الاورام التجميلية",
            ),
          );
        },
      ),
      //TODO: add icon
      //icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),


    ));
    // Doctor6 Marker
    markers.add( Marker(
      markerId:  const MarkerId("3"),
      position:  const LatLng(31.201528870628795, 29.902265604741846),
      //TODO: add ifo window
      infoWindow:  InfoWindow(
        title:  "مركز د/محمد فاروق عسل - مدرس جراحة الأورام والمناظير المتقدمة",
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
              doctorName: "د/محمد فاروق عسل",
              doctorAddress: " 5شارع الدكتور علي إبراهيم، المسلة شرق، Attarin",
              doctorNumber: " 01225264464",
              doctorServices1: "- دكتوراة جراحة أورام و تجميل الثدي",
              doctorServices2: "-التخلص من كل الام ومشاكل الثدى ",
            ),
          );
        },
      ),
      //TODO: add icon
      //icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),


    ));
    //Doctor7 Marker
    markers.add( Marker(
      markerId:  const MarkerId("3"),
      position:  const LatLng(31.04614555481647, 31.387970759505436),
      //TODO: add ifo window
      infoWindow:  InfoWindow(
        title:  "أ.د محمد سعد العشري",
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
              doctorName: "د/ محمد سعد العشرى\n Dr/ Mohamed Saad El Ashry",
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
    //Doctor8 Marker
    markers.add( Marker(
      markerId:  const MarkerId("3"),
      position:  const LatLng(31.045823102635545, 31.382718197874144),
      //TODO: add ifo window
      infoWindow:  InfoWindow(
        title: "د/ أشرف ممدوح اسماعيل شومة",
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
              doctorName: "د/ أشرف ممدوح اسماعيل شومة",
              doctorAddress: "برج الملكة، السكة الجديدة،, المنصورة (قسم 2)، المنصورة، الدقهلية",
              doctorNumber: "0502250955",
              doctorServices1: " -علاج الاورام \n - الجراحة العامه",
              doctorServices2: "- جراحة الثدى",
            ),
          );
        },
      ),
      //TODO: add icon

    ));


  }






  void buildCameraNewPosition() {
    goToSearchedForPlacePosition = CameraPosition(
      bearing: 0.0,
      tilt: 0.0,
      target: LatLng(
        selectedPlace.result.geometry.location.lat,
        selectedPlace.result.geometry.location.lng,
      ),
      zoom: 10,
    );
  }

  static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      bearing: 0.0,
      tilt: 0.0,
      zoom: 10.0
  );

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
        hint: 'البحث عن طبيب ....',
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
          setState(() {});
        }
      },
      child: Container(),
    );
  }

  void getPolylinePoints() {
    polylinePoints = placeDirections!.polylinePoints.map((e) =>
        LatLng(e.latitude, e.longitude)).toList();
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
      markerId:  const MarkerId('1'),
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
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
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
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
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
              ? buildMap() : const Center(child: CircularProgressIndicator(),
          ),
          Positioned(
            top: 10, left: 0, right: 0,
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
                        image: AssetImage('assets/icons/search_doctor.png'),
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





