import 'dart:io';

import 'package:favorite_places/models/place_location.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Place {
  Place({required this.title, required this.image, required this.location})
      : id = uuid.v4();

  final String id;
  final String title;
  final File image;
  final PlaceLocation location;
}
