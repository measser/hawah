import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hawwah/models/search/place_details.dart';
import 'package:hawwah/models/search/place_directions_model.dart';
import 'package:hawwah/models/search/places_suggestion.dart';
import 'package:hawwah/shared/network/remote/search_helper.dart';

class MapsRepo {
  final SearchHelper searchHelper;
  MapsRepo(this.searchHelper);

  Future<List<PlaceSuggestion>> fetchSuggestions(
      String place, String sessionToken,) async {
     final suggestions =
     await searchHelper.fetchSuggestions(place, sessionToken);
    return suggestions
        .map((suggestion) => PlaceSuggestion.fromJson(suggestion))
        .toList();
  }


  Future<Place> getPlaceLocation(
      String placeId,
      String sessionToken,
      ) async {
    final place =
    await searchHelper.getPlaceLocation(placeId, sessionToken);

    return Place.fromJson(place);
  }


  Future<PlaceDirections> getPlaceDirections(
      LatLng? origin,
      LatLng? destination,
      ) async {
    final directions =
    await searchHelper.getPlaceDirections(origin!, destination!);

    return PlaceDirections.fromJson(directions);
  }
}