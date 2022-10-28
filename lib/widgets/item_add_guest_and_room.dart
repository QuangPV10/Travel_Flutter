import 'package:flutter/material.dart';
import 'package:travel_ui_200lab/src/constant/asset_constant.dart';
import 'package:travel_ui_200lab/src/constant/dimension_constant.dart';
import 'package:travel_ui_200lab/src/helpers/image_helper.dart';

class ItemAddGuestAndRoom extends StatefulWidget {
  final String title;
  final String icon;
  final int initData;
  const ItemAddGuestAndRoom(
      {required this.icon,
      required this.initData,
      required this.title,
      Key? key})
      : super(key: key);

  @override
  State<ItemAddGuestAndRoom> createState() => _ItemAddGuestAndRoomState();
}

class _ItemAddGuestAndRoomState extends State<ItemAddGuestAndRoom> {
  late TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  late int number;

  @override
  void initState() {
    super.initState();
    number = widget.initData;
    textEditingController =
        TextEditingController(text: widget.initData.toString())
          ..addListener(() {
            number = int.parse(textEditingController.text);
          });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      margin: const EdgeInsets.only(bottom: kMediumPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kDefaultPadding),
      ),
      child: Row(
        children: [
          ImageHelper.loadFormAsset(widget.icon),
          const SizedBox(width: kDefaultPadding),
          Text(widget.title),
          const Spacer(),
          GestureDetector(
            onTap: () {
              if (number > 1) {
                setState(() {
                  number--;
                });
                textEditingController.text = number.toString();
                if (focusNode.hasFocus) focusNode.unfocus();
              }
            },
            child: ImageHelper.loadFormAsset(iconDecre),
          ),
          Container(
            height: 35,
            width: 60,
            padding: const EdgeInsets.only(left: 3),
            alignment: Alignment.center,
            child: TextField(
              controller: textEditingController,
              textAlign: TextAlign.center,
              focusNode: focusNode,
              enabled: true,
              autocorrect: false,
              minLines: 1,
              maxLines: 1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.only(
                  bottom: 18,
                ),
              ),
              onChanged: (value) {},
              onSubmitted: (String submitValue) {},
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                number++;
              });
              textEditingController.text = number.toString();
              if (focusNode.hasFocus) focusNode.unfocus();
            },
            child: ImageHelper.loadFormAsset(iconIncre),
          ),
        ],
      ),
    );
  }
}
