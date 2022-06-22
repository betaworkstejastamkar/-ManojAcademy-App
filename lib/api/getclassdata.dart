import 'dart:convert';

import 'package:http/http.dart';

const String classUrl =
    'https://run.mocky.io/v3/f381474c-cf0e-4ca6-a1b9-795196874188';

Future fetchPopularCardData() async {
  Response response;
  try {
    response = await get(Uri.parse(classUrl));
    return jsonDecode(response.body)['Class-6'][0]["Popular"];
  } catch (e) {
    print(e);
    return e;
  }
}
