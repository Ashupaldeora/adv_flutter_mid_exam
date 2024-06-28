import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiServices {
  static ApiServices apiServices = ApiServices();
  String baseUrl =
      "https://api.chucknorris.io/jokes/random?_gl=1*rq1sm3*_ga*MTM0ODY2MDExMi4xNzA3OTcxODgz*_ga_ZCYG64C7PL*MTcxOTU2MzQ3MC4xMC4xLjE3MTk1NjQwMjEuMC4wLjA";

  Future<Map> fetchData() async {
    Uri url = Uri.parse(baseUrl);
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      Map result = jsonDecode(response.body);
      return result;
    } else {
      throw "Unexpected Error occurred";
    }
  }
}
