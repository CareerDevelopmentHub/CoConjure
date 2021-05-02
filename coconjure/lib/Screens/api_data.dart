import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'covid_complete_data_json.dart';
import 'covid_data_distictwise_json.dart';
void getstatewisedata()
async {
  var url = Uri.parse('https://api.covid19india.org/v2/state_district_wise.json');
  var response = await http.get(url);
  final coviddetails = coviddetailsFromJson(response.body);
  print("");
}

void getcompletedata()
async {
  var url = Uri.parse('https://api.covid19india.org/data.json');
  var response = await http.get(url);
final covidcompletedata = covidcompletedataFromJson(response.body);

}