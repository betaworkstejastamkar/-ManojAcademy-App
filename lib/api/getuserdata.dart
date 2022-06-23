import 'dart:convert';

import 'package:http/http.dart';

const String userUrl =
    'https://run.mocky.io/v3/da96d92c-09b6-4b33-844d-0dcd584a1e1e';

const String userLecUrl =
    "https://run.mocky.io/v3/b25fec0b-8509-4372-ae91-ebd95b357309";
const String notificationUrl =
    "https://run.mocky.io/v3/c4c412d5-23b3-43fc-93c5-2c1b20d971e7";
Future getUser() async {
  List data = [];

  Response response;
  try {
    response = await get(Uri.parse(userUrl));
    data.add(jsonDecode(response.body)['Live']);
    return data;
  } catch (e) {
    return e;
  }
}

Future getUserLecture() async {
  List data = [];

  Response response;
  try {
    response = await get(Uri.parse(userLecUrl));
    data.add(jsonDecode(response.body)['lectureData']);
    return data;
  } catch (e) {
    return e;
  }
}

Future getNotification() async {
  List data = [];

  Response response;
  try {
    response = await get(Uri.parse(notificationUrl));
    data.add(jsonDecode(response.body)['Notification']);
    return data;
  } catch (e) {
    return e;
  }
}
