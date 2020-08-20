const SERVICE_INJECT_TEMPLATE = """import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import './{{SERVICE_DIR_NAME}}.dart';

@module
abstract class Services {
  @lazySingleton
  NavigationService get navigationService;

  @lazySingleton
  DialogService get dialogService;

  {{LAZY}}
  {{SERVICE_NAME}} get {{SERVICE_VAR}};

}""";
