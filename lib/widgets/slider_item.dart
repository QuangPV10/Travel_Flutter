import 'package:flutter/cupertino.dart';
import 'package:travel_ui_200lab/src/constant/dimension_constant.dart';
import 'package:travel_ui_200lab/src/constant/text_style_constant.dart';
import 'package:travel_ui_200lab/src/helpers/image_helper.dart';

class SliderItem extends StatelessWidget {
  final String img;
  final String title;
  final String description;
  final Alignment alignment;

  const SliderItem(
      {required this.img,
      required this.title,
      required this.description,
      required this.alignment,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: alignment,
          child: ImageHelper.loadFormAsset(img,
              height: 400, fit: BoxFit.fitHeight),
        ),
        const SizedBox(height: kMediumPadding * 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.defaultStyle.bold.copyWith(fontSize: 18),
              ),
              const SizedBox(height: kMediumPadding),
              Text(
                description,
                style: TextStyles.defaultStyle.copyWith(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
