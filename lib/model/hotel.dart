import 'package:flutter/foundation.dart';

class Hotel {
  const Hotel({
    @required this.id,
    @required this.name,
    @required this.address,
    @required this.star,
  }) :  assert(id != null),
        assert(name != null),
        assert(address != null),
        assert(star != null);

  final int id;
  final String name;
  final String address;
  final int star;

  String get assetName => '$id-0.jpg';
  String get assetPackage => 'shirine_images';

  @override
  String toString() => "$name (id=$id)";

}