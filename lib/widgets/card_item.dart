import 'package:flutter/material.dart';
import 'package:travel_ui_200lab/src/constant/dimension_constant.dart';

class CardItem extends StatelessWidget {
  final Widget icon;
  final String description;
  final String title;
  final Function() onTap;
  const CardItem(
      {required this.icon,
      required this.description,
      required this.title,
      required this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        child: Row(
          children: [
            icon,
            const SizedBox(width: kDefaultPadding * 2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: kMinPadding),
                Text(description,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold))
              ],
            )
          ],
        ),
      ),
    );
  }
}
