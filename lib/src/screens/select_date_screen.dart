import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:travel_ui_200lab/src/constant/color_constant.dart';
import 'package:travel_ui_200lab/src/constant/dimension_constant.dart';
import 'package:travel_ui_200lab/widgets/app_bar_container.dart';
import 'package:travel_ui_200lab/widgets/button_widget.dart';

class SelectDateScreen extends StatelessWidget {
  const SelectDateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime? rangeStartDate;
    DateTime? rangeEndDate;
    return Scaffold(
        body: AppBarContainer(
      impLeading: true,
      impTrailing: false,
      titleString: 'Select Date',
      child: Column(
        children: [
          const SizedBox(height: kMediumPadding * 1.5),
          SfDateRangePicker(
              view: DateRangePickerView.month,
              selectionMode: DateRangePickerSelectionMode.range,
              monthViewSettings:
                  const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
              selectionColor: ColorPalette.yellowColor,
              startRangeSelectionColor: ColorPalette.yellowColor,
              endRangeSelectionColor: ColorPalette.yellowColor,
              rangeSelectionColor: ColorPalette.yellowColor.withOpacity(0.25),
              todayHighlightColor: ColorPalette.yellowColor,
              toggleDaySelection: true,
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                if (args.value is PickerDateRange) {
                  rangeStartDate = args.value.startDate;
                  rangeEndDate = args.value.endDate;
                } else {
                  rangeStartDate = null;
                  rangeEndDate = null;
                }
              }),
          const SizedBox(height: kMediumPadding),
          ButtonWidget(
              text: 'Select',
              onTap: () {
                Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
              }),
          const SizedBox(height: kDefaultPadding),
          ButtonWidget(
              opacity: ColorPalette.primaryColor.withOpacity(0.3),
              text: 'Cancel',
              onTap: () =>
                  Navigator.of(context).pop([rangeStartDate, rangeEndDate])),
        ],
      ),
    ));
  }
}
