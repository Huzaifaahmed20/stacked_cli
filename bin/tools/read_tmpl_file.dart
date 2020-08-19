import 'dart:io';

String readTplFile(String fileName) {
  var tplPath = Platform.script.path;
  var tplSplit = tplPath.split('/');
  tplSplit.removeLast();
  tplPath = tplSplit.join('/');
  return File('${tplPath}/$fileName.tmpl').readAsStringSync();
}
