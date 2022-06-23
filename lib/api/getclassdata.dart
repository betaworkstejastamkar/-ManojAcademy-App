import 'dart:convert';

import 'package:http/http.dart';

const String classUrl =
    'https://run.mocky.io/v3/d0927447-e21a-442e-b239-e53a255f6878';
const String homagePageData =
    "https://run.mocky.io/v3/88c9abd4-e893-428a-b947-5c9364c94a67";

Future fetchHomePage() async {
  List data = [];

  Response response;
  try {
    response = await get(Uri.parse(homagePageData));
    data.add(jsonDecode(response.body)['CarouselImages']);
    data.add(jsonDecode(response.body)['ContinueWatching']);
    response = await get(Uri.parse(classUrl));
    data.add(jsonDecode(response.body)['Class-6']["Popular"]);

    return data;
  } catch (e) {
    return e;
  }
}
