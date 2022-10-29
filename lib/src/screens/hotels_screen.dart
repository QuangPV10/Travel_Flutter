import 'package:flutter/material.dart';
import 'package:travel_ui_200lab/src/helpers/dummy_data.dart';
import 'package:travel_ui_200lab/widgets/app_bar_container.dart';
import 'package:travel_ui_200lab/widgets/item_hotel.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({Key? key}) : super(key: key);

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AppBarContainer(
      titleString: 'Hotels',
      impLeading: true,
      impTrailing: true,
      child: SingleChildScrollView(
        child: Column(
            children: listHotel
                .map((hotelModel) => ItemHotel(hotelModel: hotelModel))
                .toList()),
      ),
    ));
  }
}
