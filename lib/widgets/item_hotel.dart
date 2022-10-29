import 'package:flutter/material.dart';
import 'package:travel_ui_200lab/src/constant/asset_constant.dart';
import 'package:travel_ui_200lab/src/constant/dimension_constant.dart';
import 'package:travel_ui_200lab/src/constant/text_style_constant.dart';
import 'package:travel_ui_200lab/src/helpers/image_helper.dart';
import 'package:travel_ui_200lab/src/models/hotel.dart';
import 'package:travel_ui_200lab/src/screens/hotel_detail_screen.dart';
import 'package:travel_ui_200lab/widgets/button_widget.dart';
import 'package:travel_ui_200lab/widgets/dash_line.dart';

class ItemHotel extends StatelessWidget {
  final HotelModel hotelModel;
  const ItemHotel({required this.hotelModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(bottom: kMediumPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: ImageHelper.loadFormAsset(
              hotelModel.hotelImage,
              radius: const BorderRadius.only(
                topLeft: Radius.circular(
                  kDefaultPadding,
                ),
                bottomRight: Radius.circular(
                  kDefaultPadding,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: kMediumPadding,
              ),
              Text(
                hotelModel.hotelName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: kDefaultPadding),
              Row(
                children: [
                  ImageHelper.loadFormAsset(iconLocationBlank),
                  const SizedBox(width: kMinPadding),
                  Text(hotelModel.location),
                  Expanded(
                    child: Text(
                      ' - ${hotelModel.awayKilometer} from destination',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles
                          .defaultStyle.subTitleTextColor.fontCaption
                          .copyWith(fontSize: 15),
                    ),
                  )
                ],
              ),
              const SizedBox(height: kDefaultPadding),
              Row(
                children: [
                  ImageHelper.loadFormAsset(iconStar),
                  const SizedBox(width: kMinPadding),
                  Text(hotelModel.star.toString()),
                  Expanded(
                    child: Text(
                      ' - ${hotelModel.numberOfReview} reviews',
                      style: TextStyles.defaultStyle.subTitleTextColor
                          .copyWith(fontSize: 14),
                    ),
                  )
                ],
              ),
              const SizedBox(height: kDefaultPadding),
              const DashLine(),
              const SizedBox(height: kDefaultPadding),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$ ${hotelModel.price}',
                          style: TextStyles.defaultStyle.fontHeader.bold,
                        ),
                        const SizedBox(height: kMinPadding),
                        Text(
                          '/night',
                          style: TextStyles.defaultStyle.fontCaption,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: ButtonWidget(
                          text: 'Book A Room',
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const HotelDetailScreen()))))
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
