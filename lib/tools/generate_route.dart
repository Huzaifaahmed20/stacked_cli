import 'dart:io';
import '../common/string_extension.dart';
import 'read_tmpl_file.dart';

void generateRoutes(String dir) async {
  var routeData = readTplFile('router').split('\n');
  var importLineTmpl = routeData[1];
  var routeLineTmpl = routeData[5];
  routeData.removeAt(1);
  routeData.replaceRange(4, 5, ['']);
  var top = routeData.sublist(0, 4);
  var bottom = routeData.sublist(5, 8);
  var listOfViews = await Directory('lib/ui/views/').listSync();
  var routes = [];
  for (var dirRecord in listOfViews) {
    var name = dirRecord.path.split('/').last;
    var importLine = importLineTmpl.replaceAll('{{DIR_NAME}}', name);
    importLine = importLine.replaceAll('{{CLASS_NAME}}', name.capitalize());
    var routeLine =
        routeLineTmpl.replaceAll('{{CLASS_NAME}}', name.capitalize());
    top.insert(1, importLine);
    routes.add(routeLine);
  }
  var finalRoutes = [...top, ...routes, ...bottom];
  await Directory('lib/app').create(recursive: true);
  File('lib/app/router.dart').writeAsStringSync(finalRoutes.join('\n'));
}
