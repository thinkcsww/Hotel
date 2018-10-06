import 'package:flutter/foundation.dart';

class Hotel {
  const Hotel({
    @required this.id,
    @required this.name,
    @required this.address,
    @required this.star,
    @required this.imageAddress,
    @required this.explain,
    @required this.phoneNumber,
  }) :  assert(id != null),
        assert(name != null),
        assert(address != null),
        assert(imageAddress != null),
        assert(explain != null),
        assert(phoneNumber != null),
        assert(star != null);


  final int id;
  final String name;
  final String address;
  final String imageAddress;
  final String explain;
  final int star;
  final String phoneNumber;


  @override
  String toString() => "$name (id=$id)";

}