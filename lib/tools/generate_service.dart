import 'dart:io';

import '../common/string_extension.dart';
import 'read_tmpl_file.dart';

void generateService(String service_name) async {
  var dirPath = 'lib/services';

  await Directory(dirPath).create(recursive: true);
  var serviceFile =
      await File('$dirPath/${service_name.capitalize()}Service.dart').create();
  var serviceTemplate = readTplFile('Service');
  serviceFile.writeAsStringSync(serviceTemplate.replaceAll(
      '{{CLASS_NAME}}', '${service_name.capitalize()}'));
}
