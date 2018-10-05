import 'hotel.dart';

class HotelsRepository {
  static List<Hotel> loadHotels() {
    const allHotels = <Hotel> [
      Hotel(
          id: 0,
          name: 'Burj Al Arab, Dubai',
          address: 'Burj Al Arab, Jumeirah Road, Umm Suqeim 3, Dubai, United Arab Emirates',
          star: 7)
    ];
  }
}