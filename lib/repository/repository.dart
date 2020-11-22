import 'dart:convert';

import 'package:covid19/model/case_model.dart';
import 'package:http/http.dart' as http;

class Repository {
  final String baseUrl = 'https://api.kawalcorona.com';
  var client = http.Client();

  Future<CaseModel> getCase() async {
    try {
      var response = await http.get("$baseUrl/indonesia");
      if (response.statusCode == 200) {
        var resString = jsonDecode(response.body);
        for( Map i in resString){
          return CaseModel.fromJson(i);
        }

      } else {
        throw Exception('Failed');
      }
    } catch (e) {
      return null;
    }
  }
}
