import 'dart:io';

import 'package:path_provider/path_provider.dart';

class CounterReader {
  Future<String> get _localPath async {
    final path = await getApplicationDocumentsDirectory();
    return path.path;
  }

  Future<File> get _localFile async {
    final p = await _localPath;
    return File('$p/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final f = await _localFile;
      String s = await f.readAsString();
      return int.parse(s);
    } catch (e) {
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final f = await _localFile;
    return f.writeAsString('$counter');
  }
}
