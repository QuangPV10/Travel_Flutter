import 'package:flutter/material.dart';
import 'package:travel_ui_200lab/src/helpers/dummy_data.dart';
import 'package:travel_ui_200lab/src/screens/check_out_screen.dart';
import 'package:travel_ui_200lab/widgets/app_bar_container.dart';
import 'package:travel_ui_200lab/widgets/item_room.dart';

class SelectRoomScreen extends StatelessWidget {
  const SelectRoomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AppBarContainer(
      impLeading: true,
      impTrailing: false,
      titleString: 'Select Room',
      child: SingleChildScrollView(
        child: Column(
            children: listRoom
                .map((roomModel) => ItemRoom(
                      roomModel: roomModel,
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CheckoutScreen())),
                    ))
                .toList()),
      ),
    ));
  }
}
