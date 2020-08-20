import 'dart:io';
import '../common/string_extension.dart';
import 'read_tmpl_file.dart';

void injectService(String serviceName) async {
  var serviceTmpl = readTplFile(Templates.SERVICE_INJECT).split('\n');
  var importLineTmpl = serviceTmpl[2];
  var laxyTmpl = serviceTmpl[12];
  var serviceInjTmpl = serviceTmpl[13];
  serviceTmpl.removeAt(12);
  serviceTmpl.removeAt(2);
  serviceTmpl.replaceRange(11, 12, ['']);
  var top = serviceTmpl.sublist(0, 12);
  var bottom = serviceTmpl.sublist(13, 14);

  var listOfServices = await Directory('lib/services').listSync();
  var services = [];
  for (var dirRecord in listOfServices) {
    var name = dirRecord.path.split('/').last.split('.').first;
    print(name);
    if (name != 'Services') {
      var lazy = laxyTmpl.replaceAll('{{LAZY}}', '@lazySingleton');

      var importLine = importLineTmpl.replaceAll('{{SERVICE_DIR_NAME}}', name);
      var serviceInjLine =
          serviceInjTmpl.replaceAll('{{SERVICE_NAME}}', name.capitalize());

      serviceInjLine =
          serviceInjLine.replaceAll('{{SERVICE_VAR}}', name.smallize());
      top.insert(1, importLine);
      services.add(lazy);
      services.add(serviceInjLine);
    }
    var finalRoutes = [...top, ...services, ...bottom];

    await Directory('lib/services').create(recursive: true);
    File('lib/services/Services.dart')
        .writeAsStringSync(finalRoutes.join('\n'));
  }
}
