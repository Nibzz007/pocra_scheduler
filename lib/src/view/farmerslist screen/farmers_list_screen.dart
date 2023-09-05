import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:load_management/core/app_color.dart';
import 'package:load_management/core/app_sizes.dart';
import 'package:load_management/core/app_style.dart';
import 'package:load_management/src/model/all_farmers_model.dart';
import 'package:load_management/src/view/farmerslist%20screen/add_new_farmer_screen.dart';
import 'package:load_management/src/view/widgets/common_appbar_widget.dart';

import '../../repositories/get_all_farmers.dart';

class FarmersListScreen extends StatelessWidget {
  const FarmersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CommonAppbarWidget(text: 'Farmers list'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kGreen,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddNewFarmerScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: kWhite,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CupertinoSearchTextField(),
              kHeight20,
              FutureBuilder<AllFarmersModel?>(
                future: getFarmers(),
                // initialData: [],
                builder: (context, snapshot) => snapshot.connectionState ==
                        ConnectionState.waiting
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : snapshot.data == null
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ListTile(
                                splashColor: kGreen300,
                                title: Text(
                                  snapshot.data!.data[index].name,
                                  style: listTileTextStyle,
                                ),
                                trailing: const Icon(Icons.arrow_forward_ios),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(
                                thickness: 0.4,
                                indent: 4,
                                endIndent: 4,
                              );
                            },
                            itemCount: snapshot.data!.data.length,
                          ),
              ),
              // ListView.separated(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemBuilder: (context, index) {
              //     return ListTile(
              //       // onTap: () {
              //       //   Navigator.of(context).push(
              //       //     MaterialPageRoute(
              //       //       builder: (context) =>
              //       //           // const FarmerIrrigationRequirementScreen(),
              //       //           const FarmerCropsScreen(),
              //       //     ),
              //       //   );
              //       // },
              //       splashColor: kGreen300,
              //       title: Text(
              //         'सांबा मातो',
              //         style: listTileTextStyle,
              //       ),
              //       trailing: const Icon(Icons.arrow_forward_ios),
              //     );
              //   },
              //   separatorBuilder: (context, index) {
              //     return const Divider(
              //       thickness: 0.4,
              //       indent: 4,
              //       endIndent: 4,
              //     );
              //   },
              //   itemCount: 15,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
