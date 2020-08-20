import 'package:stacked_cli/stacked_cli.dart';

void main(List<String> arguments) async {
  if (arguments.isEmpty) {
    print('Arguments required like: view or service');
    return;
  } else if (arguments[1].isEmpty) {
    print('Required view or service name');
    return;
  } else {
    run_stacked_cli(arguments);
  }
}
