import 'package:flutter/material.dart';

import '../../../models/search/places_suggestion.dart';
import '../../../shared/components/colors.dart';

class PlaceItem extends StatelessWidget {
  final PlaceSuggestion suggestion;

  const PlaceItem({Key? key, required this.suggestion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var subTitle = suggestion.description
        .replaceAll(suggestion.description.split(",")[0], "");
    return Container(
        width: double.infinity,
        margin: const EdgeInsetsDirectional.all(5),
        padding: const EdgeInsetsDirectional.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.place, color: thirdColor),
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${suggestion.description.split(",")[0]}\n",
                      style: TextStyle(
                        color: thirdColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: subTitle.substring(2),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}