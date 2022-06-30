part of 'search_cubit.dart';

@immutable
abstract class SearchStates {}

class SearchInitialState extends SearchStates {}

class PlacesLoadedState extends SearchStates {
  final List<PlaceSuggestion> places;
  PlacesLoadedState(this.places);
}

class PlacesDetailsLoadedState extends SearchStates {
  final Place place;
  PlacesDetailsLoadedState(this.place);
}

class PlacesDirectionsLoadedState extends SearchStates {
  final PlaceDirections placeDirections;
  PlacesDirectionsLoadedState(this.placeDirections);
}



