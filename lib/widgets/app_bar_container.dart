import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui_200lab/src/constant/asset_constant.dart';
import 'package:travel_ui_200lab/src/constant/dimension_constant.dart';
import 'package:travel_ui_200lab/src/helpers/image_helper.dart';

import '../src/constant/color_constant.dart';

class AppBarContainer extends StatelessWidget {
  final Widget child;
  final Widget? title;
  final bool? impLeading;
  final bool? impTrailing;
  final String? titleString;
  const AppBarContainer(
      {this.title,
      Key? key,
      required this.child,
      this.impLeading,
      this.impTrailing,
      this.titleString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 220,
            child: AppBar(
              title: Container(
                margin: const EdgeInsets.only(top: 30),
                child: title ??
                    Row(
                      children: [
                        if (impLeading!)
                          Container(
                            padding: const EdgeInsets.all(kItemPadding),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(kDefaultPadding)),
                            child: const Icon(
                              FontAwesomeIcons.arrowLeft,
                              color: Colors.black,
                              size: kDefaultIconSize,
                            ),
                          ),
                        Expanded(
                            child: Center(
                          child: Column(
                            children: [
                              Text(
                                titleString ?? '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              )
                            ],
                          ),
                        )),
                        if (impTrailing!)
                          Container(
                            padding: const EdgeInsets.all(kItemPadding),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(kDefaultPadding)),
                            child: const Icon(
                              FontAwesomeIcons.arrowLeft,
                              color: Colors.black,
                              size: kDefaultIconSize,
                            ),
                          ),
                      ],
                    ),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 150,
              backgroundColor: ColorPalette.backgroundScaffoldColor,
              flexibleSpace: Stack(children: [
                Container(
                  decoration: const BoxDecoration(
                      gradient: Gradients.defaultGradientBackground,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(35))),
                ),
                Positioned(
                    top: 0,
                    left: 0,
                    child: ImageHelper.loadFormAsset(iconOvalTop)),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: ImageHelper.loadFormAsset(iconOvalBottom))
              ]),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 190),
            padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
            child: child,
          )
        ],
      ),
    );
  }
}
