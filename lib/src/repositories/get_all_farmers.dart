import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:load_management/core/endpoints.dart';
import '../model/all_farmers_model.dart';

Future<List<String>> getallfarmers() async {
  final response = await http.get(Uri.parse(EndPoints.farmers));
  if (response.statusCode == 200) {
    // log(response.body);
    final dataList = json.decode(response.body);
    final List<dynamic> userjson = dataList['data'];
    List<String> usernames = [];
    for (int i = 0; i < userjson.length; i++) {
      usernames.add(userjson[i]['name']);
    }
    return usernames;
  } else {
    log(response.statusCode.toString());
    return [];
  }
}

Future<AllFarmersModel?> getFarmers() async {
  final response = await http.get(Uri.parse(EndPoints.farmers),headers: {'Authorization': 'token 095a3692f2c557c85b5a4f4cc9e873e80a204f85'});
  if(response.statusCode == 200) {
    log(response.body);
    final data = jsonDecode(response.body);
    final farmerList = allFarmersModelFromJson(data);
    return farmerList;
  } else {
    return null;
  }
}
