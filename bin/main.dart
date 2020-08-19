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
    await generateView(view_name);
    await generateRoutes(view_name);
    await runProcess();
  } else if (type == 'service') {
    var service_name = arguments[1];
    await generateService(service_name);
    await injectService(service_name);
    await runProcess();
  } else {
    print('Unsupported type: be sure to be one of view or service');
  }
}

void runProcess() {
  var flutterExectutable = whichSync('flutter');
  if (flutterExectutable.isEmpty) {
    print('Make sure you have set your flutter environment');
    return;
  }
  Process.runSync('flutter', ['pub', 'run', 'build_runner', 'build']);
}
