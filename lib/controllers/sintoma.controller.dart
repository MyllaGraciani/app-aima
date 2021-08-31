import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:aima/models/sintoma.model.dart';

Future<SintomasModel> fetch() async {
  var url = Uri.https('', '/sintomas/0');
  var response = await http.get(url);
  var json = jsonDecode(response.body);
  var sintomas = SintomasModel.fromJson(json);
  return sintomas;
}
