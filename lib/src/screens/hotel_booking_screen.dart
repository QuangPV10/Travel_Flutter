import 'package:flutter/material.dart';
import 'package:travel_ui_200lab/src/constant/asset_constant.dart';
import 'package:travel_ui_200lab/src/constant/dimension_constant.dart';
import 'package:travel_ui_200lab/src/helpers/image_helper.dart';
import 'package:travel_ui_200lab/src/screens/select_date_screen.dart';
import 'package:travel_ui_200lab/widgets/app_bar_container.dart';
import 'package:travel_ui_200lab/widgets/button_widget.dart';
import 'package:travel_ui_200lab/widgets/card_item.dart';
import 'package:travel_ui_200lab/src/extensions/date_ext.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({Key? key}) : super(key: key);

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  String? dateSelected;
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
                StatefulBuilder(
                  builder: (context, setState) {
                    return CardItem(
                        onTap: () async {
                          final result = await Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SelectDateScreen()));

                          if (!(result as List<DateTime?>)
                              .any((element) => element == null)) {
                            dateSelected =
                                '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';

                            // chỉ render lại chỗ có stateFulBuilder
                            setState(() {});
                          }
                        },
                        icon: ImageHelper.loadFormAsset(iconCalendal),
                        description: dateSelected ?? '13 Feb - 18 Feb 2022',
                        title: 'Select Date');
                  },
                ),
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
