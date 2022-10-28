import 'package:flutter/material.dart';
import 'package:travel_ui_200lab/src/constant/dimension_constant.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final Widget icon;
  final Function() onTap;
  const CategoryItem(
      {required this.onTap,
      required this.color,
      required this.icon,
      required this.title,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              height: 90,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: kMediumPadding),
              decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(kItemPadding * 2)),
              child: icon,
            ),
            const SizedBox(height: kItemPadding),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            )
          ],
        ));
  }
}
