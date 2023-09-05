import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../core/endpoints.dart';
import '../model/crop_model/get_crop_list._model.dart';
import '../model/irrigation_model/get_irrigation_method_model.dart';
import '../model/soil_model/get_soil_type_model.dart';

class DropDownController extends GetxController {
  var selectedOption = 'Option 1'.obs;
  List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3'];
  List<String> cropList = ['Soybean','Tur','Cotton','Wheat','Harbara','B. Jowar','Turmeric','Orange','Fodder','Vegetable','Onion','Chilly'];
  List<String> soilTypeList = ['Good','Medium','Poor'];
  List<String> irrigationList = ['Furrow irrigation','Sprinkler irrigation','Drip irrigation','Border irrigation'];
  List<String> dtIdList = ['Dhanora Makta'];
  List<String> waterSourceList = ['Open well', 'Bore well', 'Others'];
  List<String> pumbList = ['5.0','6.0'];

  void updateSelectedOption(String newValue) {
    selectedOption.value = newValue;
  }

  var cropsList = <AllCropListModel>[].obs;
  var irrigationMethods = <IrrigationMethodModel>[].obs;
  var soilTypes = <AllSoilTypeModel>[].obs;
  // var selectedCrop = Rx<Datum?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchCropList();
    fetchIrrigationList();
    fetchSoilTypeList();
  }
// crops list
  Future<void> fetchCropList() async {
    final response = await http.get(
      Uri.parse(EndPoints.baseUrl + EndPoints.getCropList),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final allCropListModel = AllCropListModel.fromJson(jsonResponse);
      cropsList.assignAll(allCropListModel as Iterable<AllCropListModel>);
    } else {
      throw Exception('Failed to load crop list');
    }
  }

  // irrigation methods list
  void fetchIrrigationList() async {
    try {
      final response = await http.get(Uri.parse(EndPoints.baseUrl+EndPoints.getIrrigationMethodList));

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        final List<IrrigationMethodModel> methods =
            jsonResponse.map((data) {
          return IrrigationMethodModel.fromJson(data);
        }).toList();

        irrigationMethods.assignAll(methods);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  // soil type list
  Future<void> fetchSoilTypeList() async {
    final response = await http.get(Uri.parse(EndPoints.baseUrl+EndPoints.getSoilList));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body)['data'];
      final List<AllSoilTypeModel> soilTypeList =
          responseData.map((data) => AllSoilTypeModel.fromJson(data)).toList();
      soilTypes.value = soilTypeList;
    } else {
      throw Exception('Failed to load soil types');
    }
  }

}
