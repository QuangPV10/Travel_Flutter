import 'package:flutter/material.dart';
import 'package:travel_ui_200lab/src/constant/dimension_constant.dart';
import 'package:travel_ui_200lab/src/constant/text_style_constant.dart';
import 'package:travel_ui_200lab/src/helpers/image_helper.dart';
import 'package:travel_ui_200lab/src/models/room.dart';
import 'package:travel_ui_200lab/widgets/button_widget.dart';
import 'package:travel_ui_200lab/widgets/dash_line.dart';
import 'package:travel_ui_200lab/widgets/item_hotel_utility.dart';

class ItemRoom extends StatelessWidget {
  final RoomModel roomModel;
  final Function()? onTap;
  final int? numberOfRoom;
  const ItemRoom(
      {required this.onTap,
      this.numberOfRoom,
      required this.roomModel,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(bottom: kMediumPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      roomModel.roomName,
                      style: TextStyles.defaultStyle.fontHeader.bold,
                    ),
                    const SizedBox(height: kDefaultPadding),
                    Text(
                      'Room Size: ${roomModel.size} m2',
                      maxLines: 2,
                    ),
                    const SizedBox(height: kDefaultPadding),
                    Text(
                      roomModel.utility,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: ImageHelper.loadFormAsset(roomModel.roomImage,
                    radius: BorderRadius.circular(kItemPadding)),
              ),
            ],
          ),
          const SizedBox(height: kDefaultPadding),
          const ItemHotelUtility(),
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
                      '\$ ${roomModel.price}',
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
                child: numberOfRoom == null
                    ? ButtonWidget(
                        text: 'Choose',
                        onTap: onTap!,
                      )
                    : Text(
                        '$numberOfRoom room',
                        textAlign: TextAlign.end,
                      ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
