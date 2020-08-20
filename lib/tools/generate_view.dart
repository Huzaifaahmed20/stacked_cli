import 'dart:io';
import '../common/string_extension.dart';
import 'read_tmpl_file.dart';

void generateView(String dir) async {
  var dirPath = 'lib/ui/views/$dir';

  await Directory(dirPath).create(recursive: true);
  var viewFile = await File('$dirPath/${dir.capitalize()}View.dart').create();
  var modelFile =
      await File('$dirPath/${dir.capitalize()}ViewModel.dart').create();
  var viewTemplate = readTplFile(Templates.VIEW);
  var viewModelTemplate = readTplFile(Templates.VIEW_MODEL);

  viewFile.writeAsStringSync(
      viewTemplate.replaceAll('{{CLASS_NAME}}', '${dir.capitalize()}'));
  modelFile.writeAsStringSync(
      viewModelTemplate.replaceAll('{{CLASS_NAME}}', '${dir.capitalize()}'));
}
