import 'dart:io';

import 'package:process_run/which.dart';

import 'tools/generate_route.dart';
import 'tools/generate_service.dart';
import 'tools/generate_view.dart';
import 'tools/inject_service.dart';

void main(List<String> arguments) async {
  if (!File('pubspec.yaml').existsSync()) {
    print('This command is only supported in a dart or flutter project root');
    return;
  }

  var type = arguments[0];
  if (type == 'view') {
    var view_name = arguments[1];
    print('Adding ${view_name}View in your app ...');
    await generateView(view_name);
    await generateRoutes(view_name);
    await runProcess();
    print('Successfully added ${view_name}View in your app');
  } else if (type == 'service') {
    var service_name = arguments[1];
    print('Adding ${service_name}Service in your app ...');
    await generateService(service_name);
    await injectService(service_name);
    await runProcess();
    print('Successfully added ${service_name}Service in your app');
  } else {
    print('Unsupported type: be sure to be one of view or service');
  }
}

void runProcess() {
  var flutterExecutable = whichSync('flutter');
  if (flutterExecutable.isEmpty) {
    print('Make sure you have set your flutter environment');
    return;
  }
  Process.runSync('flutter', ['pub', 'run', 'build_runner', 'build']);
}
