import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/place_detail.dart';
import 'package:flutter/material.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({super.key, required this.placeItems});

  final List<Place> placeItems;

  @override
  Widget build(BuildContext context) {
    if (placeItems.isEmpty) {
      return Center(
        child: Text("No data available",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                )),
      );
    }

    return ListView.builder(
      itemCount: placeItems.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PlaceDetailScreen(place: placeItems[index]),
            ),
          );
        },
        leading: CircleAvatar(
          radius: 26,
          backgroundImage: FileImage(placeItems[index].image),
        ),
        title: Text(placeItems[index].title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                )),
      ),
    );
  }
}
