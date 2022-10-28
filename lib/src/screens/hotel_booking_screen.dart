import 'package:flutter/material.dart';
import 'package:travel_ui_200lab/src/constant/asset_constant.dart';
import 'package:travel_ui_200lab/src/constant/dimension_constant.dart';
import 'package:travel_ui_200lab/src/helpers/image_helper.dart';
import 'package:travel_ui_200lab/src/screens/select_date_screen.dart';
import 'package:travel_ui_200lab/widgets/app_bar_container.dart';
import 'package:travel_ui_200lab/widgets/button_widget.dart';
import 'package:travel_ui_200lab/widgets/card_item.dart';

class HotelBookingScreen extends StatelessWidget {
  const HotelBookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBarContainer(
          titleString: 'Hotel Booking',
          impTrailing: false,
          impLeading: true,
          child: Container(
            margin: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                CardItem(
                    onTap: () {},
                    icon: ImageHelper.loadFormAsset(iconLocation),
                    description: 'South Korea',
                    title: 'Destination'),
                const SizedBox(height: kMediumPadding),
                CardItem(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SelectDateScreen())),
                    icon: ImageHelper.loadFormAsset(iconCalendal),
                    description: '13 Feb - 18 Feb 2022',
                    title: 'Select Date'),
                const SizedBox(height: kMediumPadding),
                CardItem(
                    onTap: () {},
                    icon: ImageHelper.loadFormAsset(iconBed),
                    description: '2 Guest, 1 Room',
                    title: 'Guest And Room'),
                const SizedBox(height: kMediumPadding),
                ButtonWidget(text: 'Search', onTap: () {})
              ],
            ),
          )),
    );
  }
}
