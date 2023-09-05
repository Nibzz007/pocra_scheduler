import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:load_management/core/app_style.dart';
import 'package:load_management/src/controller/drop_down_controller.dart';
import 'package:load_management/src/model/all_farmers_model.dart';
import 'package:load_management/src/view/farmerslist%20screen/farmer_each_crop_irrigation_details_screen.dart';
import '../../../core/app_color.dart';
import '../widgets/common_appbar_widget.dart';

class FarmerCropsScreen extends StatelessWidget {
  FarmerCropsScreen({super.key, required this.farmers});

  final controller = Get.put(DropDownController());
  final CropElement farmers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CommonAppbarWidget(text: '${farmers.crop.name}'),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: GetBuilder<DropDownController>(
            builder: (controller) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      controller.cropList[index],
                      style: listTileTextStyle,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    onTap: () {
                      Get.to(() => EachCropIrrigationDetailScreen());
                    },
                    splashColor: kGreen300,
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 0.4,
                    indent: 4,
                    endIndent: 4,
                  );
                },
                itemCount: controller.cropList.length,
              );
            },
          )),
    );
  }
}
