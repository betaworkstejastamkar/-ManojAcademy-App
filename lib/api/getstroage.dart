import 'dart:io';
import 'package:dio/dio.dart';
// import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

late File? _file;

const _fileName = 'user_file.json';

// Get the data file
Future<File> get file async {
  if (_file != null) return _file!;

  _file = await _initFile();
  return _file!;
}

// Inititalize file
Future<File> _initFile() async {
  final _directory = await getApplicationDocumentsDirectory();
  final _path = _directory.path;
  return File('$_path/$_fileName');
}

Future openFile({required String filename, required String url}) async {
  final file = await downloadFile(url, filename);
  if (file == null) return null;
  print('Path: ${file.path}');
  // OpenFile.open(file.path);

  return null;
}

Future downloadFile(String url, String filename) async {
  final appStorage = await getApplicationDocumentsDirectory();
  final file = File('${appStorage.path}/$filename');
  try {
    final respones = await Dio().get(url,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 0));

    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(respones.data);
    await raf.close();
    return file;
  } catch (e) {
    return null;
  }
}
