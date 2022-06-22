import 'package:dio/dio.dart';

final Dio dio = Dio();

const String userUrl =
    'https://run.mocky.io/v3/da96d92c-09b6-4b33-844d-0dcd584a1e1e';

Future fetchAlbum() async {
  try {
    var response = await dio.get(userUrl);
    // print(response.data["Users"][1]);
    return response;
  } catch (e) {
    print(e);
  }
  return true;
}
