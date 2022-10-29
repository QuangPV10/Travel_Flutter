import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui_200lab/src/constant/asset_constant.dart';
import 'package:travel_ui_200lab/src/constant/dimension_constant.dart';
import 'package:travel_ui_200lab/src/constant/text_style_constant.dart';
import 'package:travel_ui_200lab/src/helpers/dummy_data.dart';
import 'package:travel_ui_200lab/src/helpers/image_helper.dart';
import 'package:travel_ui_200lab/src/screens/hotel_booking_screen.dart';
import 'package:travel_ui_200lab/widgets/app_bar_container.dart';
import 'package:travel_ui_200lab/widgets/category_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget _buidlImageHomScreen(String name, String image) {
    return Container(
      margin: const EdgeInsets.only(bottom: kDefaultPadding),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          ImageHelper.loadFormAsset(
            image,
            width: double.infinity,
            fit: BoxFit.fitWidth,
            radius: BorderRadius.circular(kItemPadding),
          ),
          const Padding(
            padding: EdgeInsets.all(kDefaultPadding),
            child: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          Positioned(
            left: kDefaultPadding,
            bottom: kDefaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyles.defaultStyle.whiteTextColor.bold,
                ),
                const SizedBox(height: kItemPadding),
                Container(
                  padding: const EdgeInsets.all(kMinPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kMinPadding),
                    color: Colors.white.withOpacity(0.4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.star,
                        color: Color(0xffFFC107),
                      ),
                      SizedBox(
                        width: kItemPadding,
                      ),
                      Text('4.5')
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBarContainer(
          title: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Hi James!',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    SizedBox(height: kMediumPadding),
                    Text(
                      'Where are you going next!',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(
                  FontAwesomeIcons.bell,
                  size: kDefaultIconSize,
                  color: Colors.white,
                ),
                const SizedBox(width: kMinPadding * 3),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(kItemPadding)),
                  child: ImageHelper.loadFormAsset(personImg),
                )
              ]),
            ),
          ),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                    hintText: 'Search your destination',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(kTopPadding),
                      child: Icon(
                        FontAwesomeIcons.magnifyingGlass,
                        color: Colors.black,
                        size: kDefaultIconSize,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    contentPadding: EdgeInsets.symmetric()),
              ),
              const SizedBox(height: kDefaultPadding),
              Row(
                children: [
                  Expanded(
                    child: CategoryItem(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const HotelBookingScreen())),
                        color: const Color(0xfffe9c5e),
                        icon: ImageHelper.loadFormAsset(iconHotel),
                        title: 'Hotels'),
                  ),
                  const SizedBox(width: kDefaultPadding),
                  Expanded(
                    child: CategoryItem(
                        onTap: () {},
                        color: const Color(0xfff77777),
                        icon: ImageHelper.loadFormAsset(iconPlane),
                        title: 'Flights'),
                  ),
                  const SizedBox(width: kDefaultPadding),
                  Expanded(
                    child: CategoryItem(
                        onTap: () {},
                        color: const Color(0xff3ec8bc),
                        icon: ImageHelper.loadFormAsset(iconHotelPlane),
                        title: 'All'),
                  ),
                ],
              ),
              const SizedBox(height: kMediumPadding),
              Row(
                children: [
                  Text(
                    'Popular Destinations',
                    style: TextStyles.defaultStyle.bold,
                  ),
                  const Spacer(),
                  Text(
                    'See All',
                    style: TextStyles.defaultStyle.bold.primaryTextColor,
                  ),
                ],
              ),
              const SizedBox(height: kMediumPadding),
              Expanded(
                child: SingleChildScrollView(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: listImageLeft
                              .map(
                                (e) => _buidlImageHomScreen(
                                  e['name']!,
                                  e['image']!,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const SizedBox(width: kDefaultPadding),
                      Expanded(
                        child: Column(
                          children: listImageRight
                              .map(
                                (e) => _buidlImageHomScreen(
                                  e['name']!,
                                  e['image']!,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
