import 'dart:convert';

import 'package:http/http.dart';

String liveUrl = "https://run.mocky.io/v3/8d07cc20-4da0-4e26-8d65-49c189dd5a00";
String testResultUrl =
    "https://run.mocky.io/v3/707824a8-7cba-4bf0-93a5-f79a35e06197";
Future getLiveLecData() async {
  List data = [];

  Response response;
  try {
    response = await get(Uri.parse(liveUrl));
    data.add(jsonDecode(response.body)['Live']);
    return data;
  } catch (e) {
    print(e);
    return e;
  }
}

Future getTestResult() async {
  List data = [];

  Response response;
  try {
    response = await get(Uri.parse(testResultUrl));
    data.add(jsonDecode(response.body)['testReusltData']);
    return data;
  } catch (e) {
    print(e);
    return e;
  }
}
