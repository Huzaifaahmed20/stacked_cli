import 'dart:io';

import 'tools/generate_route.dart';
import 'tools/generate_service.dart';
import 'tools/generate_view.dart';

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
