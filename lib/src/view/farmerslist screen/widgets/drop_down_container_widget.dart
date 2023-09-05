import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:load_management/core/app_sizes.dart';
import 'package:load_management/src/controller/drop_down_controller.dart';

class DropDownContainerWidget extends StatefulWidget {
  const DropDownContainerWidget({
    super.key,
    required this.height,
    required this.width,
    required this.hintText,
    required this.list,
  });

  final double height;
  final double width;
  final String hintText;
  final List<String?> list;

  @override
  State<DropDownContainerWidget> createState() =>
      _DropDownContainerWidgetState();
}

class _DropDownContainerWidgetState extends State<DropDownContainerWidget> {
  String? selected;
  final DropDownController controller = Get.find<DropDownController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height * 0.06,
      width: widget.width * 0.9,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Row(
          children: [
            kWidth30,
            DropdownButton(
              hint: Text(selected == null ? widget.hintText : selected!),
              items: widget.list
                  .map(
                    (item) => DropdownMenuItem(
                      value: item,
                      child: Text(item!),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                selected = value;
                controller.updateSelectedOption(value!);
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}
