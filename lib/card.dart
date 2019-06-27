import 'package:flutter/foundation.dart';

class Card {
  const Card({
    @required this.id,
    @required this.name,
    @required this.description,
  })  : assert(id != null),
        assert(name != null),
        assert(description != null);
  final int id;
  final String description;
  final String name;

  String get assetName => '$name.jpg';
  // String get assetPackage => 'shrine_images';

  // @override
  // String toString() => "$name (id=$id)";
}
