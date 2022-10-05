import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:note_app/presentation/components/check_with_text.dart';
import 'package:note_app/presentation/components/custom_bottom_sheet.dart';
import 'package:note_app/presentation/components/text_with_switch.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_text_style.dart';
import '../../config/constants/assets.dart';
import '../components/extras_menu_button.dart';
import 'custom_color_picker.dart';

class ExtrasBottomSheetMenuBody extends StatefulWidget {
  const ExtrasBottomSheetMenuBody({
    Key? key,
    required this.onSelectedColorIndex,
    required this.onRemindedTimeSelected,
    required this.onSelectedLabels,
    required this.onMarkAsFinished,
    required this.onDelete,
  }) : super(key: key);

  final Function(int selectedColorIndex) onSelectedColorIndex;
  final Function(List<String> labels) onSelectedLabels;
  final Function(DateTime remindedTime) onRemindedTimeSelected;
  final Function() onMarkAsFinished;
  final Function() onDelete;

  @override
  State<ExtrasBottomSheetMenuBody> createState() =>
      _ExtrasBottomSheetMenuBodyState();
}

class _ExtrasBottomSheetMenuBodyState extends State<ExtrasBottomSheetMenuBody> {
  int currentView = 0;
  List<Widget> pages = [];
  bool isReminder = false;
  int selectedDayIndex = 0;

  // bottom sheet bodies heights to show animation with changing heights
  List<Map<String, double>> heightsBottomSheet = [
    {"": 362},
    {"Extras": 240},
    {"Set Reminder": 140},
    {"Set Reminder": 140},
    {"Set Reminder": 250},
    {"Repeat": 230},
  ];

  late double lastHeight;

  @override
  void initState() {
    pages = [
      extrasMainPage(),
      extrasReminder(),
      extrasDate(),
      extrasTime(),
      extrasRepeat(),
      extrasRepeatCustom()
    ];
    lastHeight = heightsBottomSheet[0].values.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double currentHeight = heightsBottomSheet[currentView].values.first;
    Curve curve = Curves.easeOutBack;
    lastHeight = currentHeight;
    return CustomBottomSheet(
      title: heightsBottomSheet[currentView].keys.first,
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: curve,
        height: heightsBottomSheet[currentView].values.first,
        child: pages[currentView],
      ),
      onBackTap: () => setState(
        () {
          currentView == 1 ? currentView-- : currentView = 1;
        },
      ),
    );
  }

  Widget extrasMainPage() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16, left: 16),
            child: Text(
              "CHANGE BACKGROUND",
              style: AppTextStyle.regularXs
                  .copyWith(color: AppColors.neutralColor.darkGrey),
            ),
          ),
          // Color picker for that project
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomColorPicker(
              onSelectedColor: widget.onSelectedColorIndex,
            ),
          ),
          // Divider
          Padding(
            padding: const EdgeInsets.all(16),
            child: Divider(
              color: AppColors.neutralColor.lightGrey,
              thickness: 1,
              height: 1,
            ),
          ),
          // Extra menus label
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 16),
            child: Text(
              "EXTRAS",
              style: AppTextStyle.regularXs
                  .copyWith(color: AppColors.neutralColor.darkGrey),
            ),
          ),
          // Set Reminder
          ExtrasMenuButton(
            icon: Assets.icons.clock,
            menuTitle: "Set Reminder",
            label: "Not set",
            isArrowVisible: true,
            onTap: () {},
          ),
          // TODO: Thinking about adding it
          // ExtrasMenuButton(
          //   icon: Assets.icons.edit,
          //   menuTitle: "Change Note Type",
          //   label: "Buying something",
          //   isArrowVisible: true,
          //   onTap: () {},
          // ),
          ExtrasMenuButton(
            icon: Assets.icons.tag,
            menuTitle: "Give Label",
            isArrowVisible: true,
            label: "Not set",
            onTap: () {},
          ),
          ExtrasMenuButton(
            icon: Assets.icons.check,
            menuTitle: "Mark as Finished",
            onTap: () {
              // Navigator.pushNamed(context, Routes.interestingIdeaPage);
              // showCustomBottomSheet(
              //     context: context,
              //     body: const CustomBottomSheet(
              //         body: NotificationBottomSheetMenu()));
              setState(() {
                currentView = 1;
              });
            },
          ),
          // Divider
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Divider(
              color: AppColors.neutralColor.lightGrey,
              thickness: 1,
              height: 1,
            ),
          ),
          ExtrasMenuButton(
            icon: Assets.icons.delete,
            iconColor: AppColors.errorColor.base,
            menuTitle: "Delete Note",
            menuTitleColor: AppColors.errorColor.base,
            onTap: widget.onDelete,
          ),
        ],
      ),
    );
  }

  Widget extrasReminder() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Divider
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 0),
            child: Divider(
              color: AppColors.neutralColor.lightGrey,
              thickness: 1,
              height: 1,
            ),
          ),
          // Extra menus label
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextWithSwitch(
              value: isReminder,
              label: "Reminder",
              onChanged: (value) => setState(() {
                isReminder = value;
              }),
            ),
          ),
          // Set Reminder
          ExtrasMenuButton(
            menuTitle: "Date",
            label: "Not set",
            isArrowVisible: true,
            onTap: () {
              setState(() {
                currentView = 2;
              });
            },
          ),
          ExtrasMenuButton(
            menuTitle: "Time",
            label: "Not set",
            isArrowVisible: true,
            onTap: () {
              setState(() {
                currentView = 3;
              });
            },
          ),
          ExtrasMenuButton(
            menuTitle: "Repeat",
            label: "Not set",
            isArrowVisible: true,
            onTap: () {
              setState(() {
                currentView = 4;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget extrasDate() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Divider
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: Divider(
              color: AppColors.neutralColor.lightGrey,
              thickness: 1,
              height: 1,
            ),
          ),
          // Extra menus label
          DatePickerWidget(
            dateFormat: "dd-MMM-yyyy",
            initialDateTime: DateTime.now(),
            pickerTheme: DateTimePickerTheme(
              itemTextStyle: AppTextStyle.mediumXl
                  .copyWith(color: AppColors.primaryColor.base),
              pickerHeight: 160,
              itemHeight: 60,
            ),
            onChange: (selectedDate, changeList) {
              debugPrint(selectedDate.toString() + changeList.toString());
            },
          )
        ],
      ),
    );
  }

  Widget extrasTime() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Divider
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: Divider(
              color: AppColors.neutralColor.lightGrey,
              thickness: 1,
              height: 1,
            ),
          ),
          // Extra menus label
          TimePickerWidget(
            dateFormat: "HH:mm",
            initDateTime: DateTime.now(),
            pickerTheme: DateTimePickerTheme(
              itemTextStyle: AppTextStyle.mediumXl
                  .copyWith(color: AppColors.primaryColor.base),
              pickerHeight: 160,
              itemHeight: 60,
            ),
            onChange: (selectedDate, changeList) {
              debugPrint(selectedDate.toString() + changeList.toString());
            },
          )
        ],
      ),
    );
  }

  Widget extrasRepeat() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Divider
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: Divider(
              color: AppColors.neutralColor.lightGrey,
              thickness: 1,
              height: 1,
            ),
          ),
          // Extra menus label
          CheckWithText(
            isSelected: selectedDayIndex == 0,
            label: "Once",
            onSelected: () => setState(() {
              selectedDayIndex = 0;
            }),
          ),
          CheckWithText(
            isSelected: selectedDayIndex == 1,
            label: "Daily",
            onSelected: () => setState(() {
              selectedDayIndex = 1;
            }),
          ),
          CheckWithText(
            isSelected: selectedDayIndex == 2,
            label: "Monday to Firday",
            onSelected: () => setState(() {
              selectedDayIndex = 2;
            }),
          ),
          CheckWithText(
            isSelected: selectedDayIndex == 3,
            label: "Saturday & Sunday",
            onSelected: () => setState(() {
              selectedDayIndex = 3;
            }),
          ),
          CheckWithText(
            isSelected: selectedDayIndex == 4,
            label: "Custom",
            onSelected: () => setState(() {
              currentView = 5;
            }),
          ),
        ],
      ),
    );
  }

  Widget extrasRepeatCustom() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Divider
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: Divider(
              color: AppColors.neutralColor.lightGrey,
              thickness: 1,
              height: 1,
            ),
          ),
          // Extra menus label

        ],
      ),
    );
  }
}
