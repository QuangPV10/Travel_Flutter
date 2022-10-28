import 'package:flutter/material.dart';
import 'package:travel_ui_200lab/src/constant/asset_constant.dart';
import 'package:travel_ui_200lab/src/constant/dimension_constant.dart';
import 'package:travel_ui_200lab/widgets/app_bar_container.dart';
import 'package:travel_ui_200lab/widgets/button_widget.dart';
import 'package:travel_ui_200lab/widgets/item_add_guest_and_room.dart';

class GuestAndRoomScreen extends StatefulWidget {
  const GuestAndRoomScreen({Key? key}) : super(key: key);

  @override
  State<GuestAndRoomScreen> createState() => _GuestAndRoomScreenState();
}

class _GuestAndRoomScreenState extends State<GuestAndRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBarContainer(
        impLeading: true,
        impTrailing: false,
        titleString: 'Add guest and room',
        child: Column(
          children: [
            const SizedBox(height: kMediumPadding * 2),
            const ItemAddGuestAndRoom(
                icon: iconGuest, initData: 2, title: 'Guest'),
            const ItemAddGuestAndRoom(
                icon: iconBed, initData: 1, title: 'Room'),
            ButtonWidget(
                text: 'Select', onTap: () => Navigator.of(context).pop()),
            const SizedBox(height: kMediumPadding),
            ButtonWidget(
                text: 'Cancel', onTap: () => Navigator.of(context).pop())
          ],
        ),
      ),
    );
  }
}
