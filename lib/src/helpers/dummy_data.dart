import 'package:travel_ui_200lab/src/constant/asset_constant.dart';
import 'package:travel_ui_200lab/src/models/hotel.dart';

import '../models/room.dart';

final List<HotelModel> listHotel = [
  HotelModel(
    hotelImage: hotel1Img,
    hotelName: 'Royal Palm Heritage',
    location: 'Purwokerto, Jateng',
    awayKilometer: '364 m',
    star: 4.5,
    numberOfReview: 3241,
    price: 143,
  ),
  HotelModel(
    hotelImage: hotel2Img,
    hotelName: 'Grand Luxury\'s',
    location: 'Banyumas, Jateng',
    awayKilometer: '2.3 km',
    star: 4.2,
    numberOfReview: 3241,
    price: 234,
  ),
  HotelModel(
    hotelImage: hotel3Img,
    hotelName: 'The Orlando House',
    location: 'Ajibarang, Jateng',
    awayKilometer: '1.1 km',
    star: 3.8,
    numberOfReview: 1234,
    price: 132,
  ),
];

final List<RoomModel> listRoom = [
  RoomModel(
    roomImage: room1Img,
    roomName: 'Deluxe Room',
    size: 27,
    utility: 'Free Cancellation',
    price: 245,
  ),
  RoomModel(
    roomImage: room2Img,
    roomName: 'Executive Suite',
    size: 32,
    utility: 'Non-refundable',
    price: 289,
  ),
  RoomModel(
    roomImage: room3Img,
    roomName: 'King Bed Only Room',
    size: 24,
    utility: 'Non-refundable',
    price: 214,
  ),
];

const List<Map<String, String>> listUtilityHotel = [
  {'icon': iconWifi, 'name': 'Free\nWifi'},
  {'icon': iconNonRefund, 'name': 'Non-\nRefundable'},
  {'icon': iconBreakfast, 'name': 'Free-\nBreakfast'},
  {'icon': iconNonSmoke, 'name': 'Non-\nSmoking'},
];
