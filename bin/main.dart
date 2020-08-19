import 'dart:io';

import 'package:args/command_runner.dart';

extension StringExtensions on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

void main(List<String> arguments) async {
  if (!File('pubspec.yaml').existsSync()) {
    print('This command is only supported in a dart or flutter project root');
    return;
  }

  var type = arguments[0];
  if (type == 'view') {
    var view_name = arguments[1];
    await generateView(view_name);
    await generateRoutes(view_name);
  } else if (type == 'service') {
    var service_name = arguments[1];
    generateService(service_name);
  } else {
    print('Unsupported type: be sure to be one of view or service');
  }
}

void generateService(String service_name) async {
  var dirPath = 'lib/services';

  await Directory(dirPath).create(recursive: true);
  var serviceFile =
      await File('$dirPath/${service_name.capitalize()}Service.dart').create();
  var serviceTemplate = readTplFile('Service');
  serviceFile.writeAsStringSync(serviceTemplate.replaceAll(
      '{{CLASS_NAME}}', '${service_name.capitalize()}'));
}

void generateView(String dir) async {
  var dirPath = 'lib/ui/views/$dir';

  await Directory(dirPath).create(recursive: true);
  var viewFile = await File('$dirPath/${dir.capitalize()}View.dart').create();
  var modelFile =
      await File('$dirPath/${dir.capitalize()}ViewModel.dart').create();
  var viewTemplate = readTplFile('View');
  var viewModelTemplate = readTplFile('ViewModel');

  viewFile.writeAsStringSync(
      viewTemplate.replaceAll('{{CLASS_NAME}}', '${dir.capitalize()}'));
  modelFile.writeAsStringSync(
      viewModelTemplate.replaceAll('{{CLASS_NAME}}', '${dir.capitalize()}'));
}

void generateRoutes(String dir) async{
  var routeData = readTplFile('router').split('\n');
  var importLineTmpl = routeData[1];
  var routeLineTmpl = routeData[5];
  routeData.removeAt(1);
  routeData.replaceRange(4,5,['']);
  var top = routeData.sublist(0,4);
  var bottom = routeData.sublist(5,8);
  var listOfViews = await Directory('lib/ui/views/').listSync();
  var routes = [];
  for(var dirRecord in listOfViews){
    var name = dirRecord.path.split('/').last;
    var importLine = importLineTmpl.replaceAll('{{DIR_NAME}}',name);
    importLine = importLine.replaceAll('{{CLASS_NAME}}',name.capitalize());
    var routeLine = routeLineTmpl.replaceAll('{{CLASS_NAME}}',name.capitalize());
    top.insert(1, importLine);
    routes.add(routeLine);
  }
  var finalRoutes = [
    ...top,
    ...routes,
    ...bottom
  ];
  await Directory('lib/app').create(recursive: true);
  File('lib/app/router.dart').writeAsStringSync(finalRoutes.join('\n'));
}

String readTplFile(String fileName) {
  var tplPath = Platform.script.path;
  var tplSplit = tplPath.split('/');
  tplSplit.removeLast();
  tplPath = tplSplit.join('/');
  return File('${tplPath}/../$fileName.tmpl').readAsStringSync();
}
