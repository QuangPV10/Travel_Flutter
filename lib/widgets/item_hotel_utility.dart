import 'package:flutter/material.dart';
import 'package:travel_ui_200lab/src/constant/dimension_constant.dart';
import 'package:travel_ui_200lab/src/helpers/dummy_data.dart';
import 'package:travel_ui_200lab/src/helpers/image_helper.dart';

class ItemHotelUtility extends StatelessWidget {
  const ItemHotelUtility({Key? key}) : super(key: key);

  Widget _buildIteHotelUtility({required String icon, required String name}) {
    return Column(
      children: [
        ImageHelper.loadFormAsset(icon),
        const SizedBox(height: kTopPadding),
        Text(
          name,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: listUtilityHotel
          .map((e) => _buildIteHotelUtility(
              icon: e['icon'].toString(), name: e['name'].toString()))
          .toList(),
    );
  }
}
