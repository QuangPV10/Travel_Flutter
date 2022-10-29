import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui_200lab/src/constant/asset_constant.dart';
import 'package:travel_ui_200lab/src/constant/color_constant.dart';
import 'package:travel_ui_200lab/src/constant/dimension_constant.dart';
import 'package:travel_ui_200lab/src/constant/text_style_constant.dart';
import 'package:travel_ui_200lab/src/helpers/image_helper.dart';
import 'package:travel_ui_200lab/src/models/hotel.dart';
import 'package:travel_ui_200lab/widgets/button_widget.dart';
import 'package:travel_ui_200lab/widgets/dash_line.dart';
import 'package:travel_ui_200lab/widgets/item_hotel_utility.dart';

class HotelDetailScreen extends StatefulWidget {
  final HotelModel hotelModel;
  const HotelDetailScreen({required this.hotelModel, Key? key})
      : super(key: key);

  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(hotelScreenImg), fit: BoxFit.fill)),
        ),
        Positioned(
            top: kMediumPadding * 3,
            left: kMediumPadding,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: kDefaultPadding),
                child: Container(
                  padding: const EdgeInsets.all(kItemPadding),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.all(Radius.circular(kDefaultPadding))),
                  child: const Icon(FontAwesomeIcons.arrowLeft, size: 18),
                ),
              ),
            )),
        Positioned(
            top: kMediumPadding * 3,
            right: kMediumPadding,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: kDefaultPadding),
                child: Container(
                  padding: const EdgeInsets.all(kItemPadding),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.all(Radius.circular(kDefaultPadding))),
                  child: const Icon(
                    FontAwesomeIcons.heart,
                    size: 18,
                    color: Colors.red,
                  ),
                ),
              ),
            )),
        DraggableScrollableSheet(
          initialChildSize: 0.3,
          maxChildSize: 0.8,
          minChildSize: 0.3,
          builder: (context, scrollController) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kDefaultPadding * 2),
                      topRight: Radius.circular(kDefaultPadding * 2))),
              child: Column(children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: kDefaultPadding),
                  child: Container(
                    height: 5,
                    width: 60,
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            BorderRadius.all(Radius.circular(kItemPadding))),
                  ),
                ),
                const SizedBox(height: kMinPadding),
                Expanded(
                    child: ListView(
                  controller: scrollController,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.hotelModel.hotelName,
                          style: TextStyles.defaultStyle.fontHeader.bold
                              .copyWith(fontSize: 20),
                        ),
                        const Spacer(),
                        Text(
                          '\$ ${widget.hotelModel.price}',
                          style: TextStyles.defaultStyle.fontHeader.bold,
                        ),
                        const Text('/night')
                      ],
                    ),
                    const SizedBox(height: kMinPadding),
                    Row(
                      children: [
                        ImageHelper.loadFormAsset(iconLocationBlank),
                        const SizedBox(width: kMinPadding),
                        Text(widget.hotelModel.location,
                            style: TextStyles
                                .defaultStyle.subTitleTextColor.fontCaption
                                .copyWith(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: kMinPadding),
                    const DashLine(),
                    const SizedBox(height: kMinPadding),
                    Row(
                      children: [
                        ImageHelper.loadFormAsset(iconStar),
                        const SizedBox(width: kMinPadding),
                        Text('${widget.hotelModel.star}/5'),
                        const SizedBox(width: kMinPadding),
                        Expanded(
                          child: Text(
                            '(${widget.hotelModel.numberOfReview} reviews)',
                            style: TextStyles.defaultStyle.subTitleTextColor
                                .copyWith(fontSize: 14),
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'See All',
                              style: TextStyles.defaultStyle.bold.copyWith(
                                  color: ColorPalette.primaryColor,
                                  fontSize: 16),
                            ))
                      ],
                    ),
                    const SizedBox(height: kMinPadding),
                    const DashLine(),
                    const SizedBox(height: kDefaultPadding),
                    Text(
                      'Information',
                      style: TextStyles.defaultStyle.fontHeader.bold,
                    ),
                    const SizedBox(height: kMinPadding),
                    Text(
                      '''You will find every comfort because many of the services that the hotel offers for travellers and of course the hotel is very comfortable.''',
                      style: TextStyles.defaultStyle
                          .copyWith(fontSize: 16, wordSpacing: 2),
                    ),
                    const SizedBox(height: kDefaultPadding),
                    const ItemHotelUtility(),
                    const SizedBox(height: kDefaultPadding),
                    Text(
                      'Location',
                      style: TextStyles.defaultStyle.fontHeader.bold,
                    ),
                    const SizedBox(height: kDefaultPadding),
                    Text(
                      '''Located in the famous neighborhood of Seoul, Grand Luxury’s is set in a building built in the 2010s.''',
                      style: TextStyles.defaultStyle
                          .copyWith(fontSize: 16, wordSpacing: 2.5),
                    ),
                    const SizedBox(height: kDefaultPadding),
                    ImageHelper.loadFormAsset(imageMap, fit: BoxFit.fitWidth),
                    const SizedBox(height: kDefaultPadding),
                    ButtonWidget(text: 'Select Room', onTap: () {})
                  ],
                ))
              ]),
            );
          },
        )
      ]),
    );
  }
}
