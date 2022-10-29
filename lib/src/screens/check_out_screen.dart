import 'package:flutter/material.dart';
import 'package:travel_ui_200lab/src/constant/asset_constant.dart';
import 'package:travel_ui_200lab/src/constant/color_constant.dart';
import 'package:travel_ui_200lab/src/constant/dimension_constant.dart';
import 'package:travel_ui_200lab/src/constant/text_style_constant.dart';
import 'package:travel_ui_200lab/src/helpers/image_helper.dart';
import 'package:travel_ui_200lab/src/models/room.dart';
import 'package:travel_ui_200lab/src/screens/bottom_bar.dart';
import 'package:travel_ui_200lab/widgets/app_bar_container.dart';
import 'package:travel_ui_200lab/widgets/button_widget.dart';
import 'package:travel_ui_200lab/widgets/item_room.dart';

class CheckoutScreen extends StatelessWidget {
  final RoomModel roomModel;
  CheckoutScreen({required this.roomModel, Key? key}) : super(key: key);

  final List<String> listSteps = ['Book and review', 'Payment', 'Confirm'];

  Widget _buildItemStepCheckout(
      int step, String stepName, bool isEnd, bool isCheck) {
    return Row(children: [
      Container(
        alignment: Alignment.center,
        width: kMediumPadding,
        height: kMediumPadding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kMediumPadding),
            color: isCheck ? Colors.white : Colors.white.withOpacity(0.1)),
        child: Text(step.toString(),
            style: TextStyle(color: isCheck ? Colors.black : Colors.white)),
      ),
      const SizedBox(width: kMinPadding),
      Text(
        stepName,
        style: const TextStyle(color: Colors.white, fontSize: 13),
      ),
      const SizedBox(width: kMinPadding),
      if (!isEnd)
        const SizedBox(
          width: kDefaultPadding,
          child: Divider(
            height: 1,
            thickness: 1,
            color: Colors.white,
          ),
        ),
      if (!isEnd) const SizedBox(width: kMinPadding)
    ]);
  }

  Widget _buildItemOptionsCheckout(
      String icon, String title, String value, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(kDefaultPadding)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageHelper.loadFormAsset(
                icon,
              ),
              const SizedBox(width: kDefaultPadding),
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
            ],
          ),
          const SizedBox(height: kDefaultPadding),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              color: ColorPalette.primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(
                40,
              ),
            ),
            padding: const EdgeInsets.all(kMinPadding),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kMediumPadding),
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.add,
                  ),
                ),
                const SizedBox(width: kDefaultPadding),
                Text(
                  value,
                  style: TextStyles.defaultStyle.primaryTextColor.bold,
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
      impLeading: true,
      impTrailing: false,
      titleString: 'Checkout',
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: listSteps
                .map((e) => _buildItemStepCheckout(
                    listSteps.indexOf(e) + 1,
                    e,
                    listSteps.indexOf(e) == listSteps.length - 1,
                    listSteps.indexOf(e) == 0))
                .toList(),
          ),
          const SizedBox(height: kMediumPadding),
          Expanded(
              child: SingleChildScrollView(
            child: Column(children: [
              ItemRoom(
                onTap: () {},
                roomModel: roomModel,
                numberOfRoom: 1,
              ),
              const SizedBox(height: kMinPadding),
              _buildItemOptionsCheckout(
                  iconUser, 'Contact Detail', 'Add Contact', context),
              const SizedBox(height: kMediumPadding),
              _buildItemOptionsCheckout(
                  iconPromo, 'Promo Code', 'Add Promo Code', context),
              const SizedBox(height: kMediumPadding),
              ButtonWidget(
                  text: 'Payment',
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const BottomBar()))),
            ]),
          ))
        ],
      ),
    ));
  }
}
