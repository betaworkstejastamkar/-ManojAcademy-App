import 'dart:convert';

import 'package:http/http.dart';

String liveUrl = "https://run.mocky.io/v3/8d07cc20-4da0-4e26-8d65-49c189dd5a00";
String testResultUrl =
    "https://run.mocky.io/v3/707824a8-7cba-4bf0-93a5-f79a35e06197";

String subPlanUrl =
    "https://run.mocky.io/v3/9f043ff2-9011-46c6-8686-199889e9693c";

String certificateUrl =
    "https://run.mocky.io/v3/822e8bb7-99ee-41f2-9f28-c5711dd73873";
Future getLiveLecData() async {
  List data = [];

  Response response;
  try {
    response = await get(Uri.parse(liveUrl));
    data.add(jsonDecode(response.body)['Live']);
    return data;
  } catch (e) {
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
    return e;
  }
}

Future getSubPlan() async {
  List data = [];

  Response response;
  try {
    response = await get(Uri.parse(subPlanUrl));
    data.add(jsonDecode(response.body)['plans']);
    return data;
  } catch (e) {
    return e;
  }
}

Future getCertificates() async {
  List data = [];

  Response response;
  try {
    response = await get(Uri.parse(certificateUrl));
    data.add(jsonDecode(response.body)['certificate']);
    return data;
  } catch (e) {
    return e;
  }
}
