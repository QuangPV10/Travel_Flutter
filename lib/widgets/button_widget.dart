import 'package:flutter/material.dart';
import 'package:travel_ui_200lab/src/constant/color_constant.dart';
import 'package:travel_ui_200lab/src/constant/dimension_constant.dart';
import 'package:travel_ui_200lab/src/constant/text_style_constant.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function() onTap;
  final Color? opacity;
  const ButtonWidget(
      {this.opacity, required this.text, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kMediumPadding),
            gradient:
                opacity != null ? null : Gradients.defaultGradientBackground,
            color: opacity),
        child: Text(
          text,
          style: TextStyles.defaultStyle.bold.whiteTextColor.copyWith(
              color:
                  opacity != null ? ColorPalette.primaryColor : Colors.white),
        ),
      ),
    );
  }
}
