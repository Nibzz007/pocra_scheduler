import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:load_management/core/app_sizes.dart';
import 'package:load_management/src/controller/drop_down_controller.dart';
import 'package:load_management/src/view/farmerslist%20screen/widgets/drop_down_container_widget.dart';
import 'package:load_management/src/view/widgets/text_form_field_widget.dart';
import 'package:load_management/src/view/widgets/text_widget.dart';
import '../../../core/app_color.dart';
import '../widgets/common_appbar_widget.dart';
import '../widgets/elevated_button_widget.dart';

class PumbInformationScreen extends StatelessWidget {
  PumbInformationScreen({super.key});

  final selectedOption = 0.obs;

  void handleOptionChange(int value) {
    selectedOption.value = value;
  }

  DropDownController controller = Get.find<DropDownController>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CommonAppbarWidget(
          text: 'Add Pump information',
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kHeight20,
                // const TextWidget(text: 'DT id'),
                // kHeight10,
                // DropDownContainerWidget(
                //   height: height,
                //   width: width,
                //   hintText: 'DT id', list: controller.dtIdList,
                // ),
                // kHeight20,
                const TextWidget(text: 'Pump capacity'),
                kHeight10,
                TextFormFieldWidget(
                  hintText: '50hP',
                  keyboardType: TextInputType.number,
                ),
                kHeight20,
                const TextWidget(text: 'Source type'),
                kHeight10,
                DropDownContainerWidget(
                  height: height,
                  width: width,
                  hintText: 'Select the water source', list: controller.waterSourceList,
                ),
                kHeight20,
                const TextWidget(
                  text: 'Water pumping directly to field from water source',
                ),
                kHeight10,
                Obx(
                  () => RadioListTile(
                    activeColor: kGreen,
                    value: 0,
                    groupValue: selectedOption.value,
                    onChanged: (value) => handleOptionChange(value!),
                    title: const Text('Yes'),
                  ),
                ),
                Obx(
                  () => RadioListTile(
                    activeColor: kGreen,
                    value: 1,
                    groupValue: selectedOption.value,
                    onChanged: (value) => handleOptionChange(value!),
                    title: const Text('No'),
                  ),
                ),
                kHeight40,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        ElevatedButtonWidget(
                          onPressed: () {},
                          text: 'Add more',
                          widget: const Icon(
                            Icons.add,
                            color: kWhite,
                          ),
                          backgroundColor: kGreen,
                        ),
                        kHeight20,
                        ElevatedButtonWidget(
                          onPressed: () {},
                          text: 'Save',
                          widget: const Icon(
                            Icons.save,
                            color: kWhite,
                          ),
                          backgroundColor: kGreen,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
