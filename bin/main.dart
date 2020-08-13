import 'dart:io';

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

void main(List<String> arguments) async {
  var dir = arguments[0];
  var dirPath = 'lib/ui/views/$dir';
  if(!File('pubspec.yaml').existsSync()){
    print('This command is only supported in a dart or flutter project root');
  }
  await Directory(dirPath).create(recursive: true);
  var viewFile = await File('$dirPath/${dir.capitalize()}View.dart').create();
  var modelFile = await File('$dirPath/${dir.capitalize()}ViewModel.dart').create();
  var viewTemplate = readTplFile('View');
  var viewModelTemplate = readTplFile('ViewModel');
  
  viewFile.writeAsStringSync(viewTemplate.replaceAll('{{CLASS_NAME}}', '${dir.capitalize()}'));
  modelFile.writeAsStringSync(viewModelTemplate.replaceAll('{{CLASS_NAME}}', '${dir.capitalize()}'));
}

String readTplFile(String fileName){
  var tplPath = Platform.script.path;
  var tplSplit = tplPath.split('/');
  tplSplit.removeLast();
  tplPath = tplSplit.join('/');
  return File('${tplPath}/../$fileName.tmpl').readAsStringSync();
}