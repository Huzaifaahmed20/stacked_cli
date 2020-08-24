import 'package:stacked_cli/templates/Service.dart';
import 'package:stacked_cli/templates/ServiceInject.dart';
import 'package:stacked_cli/templates/View.dart';
import 'package:stacked_cli/templates/ViewModel.dart';
import 'package:stacked_cli/templates/router.dart';

enum Templates{
 ROUTER,SERVICE,SERVICE_INJECT,VIEW,VIEW_MODEL
}

String readTplFile(Templates template) {
  var templateMap = {
    Templates.ROUTER:ROUTER_TEMPLATE,
    Templates.SERVICE:SERVICE_TEMPLATE,
    Templates.SERVICE_INJECT:SERVICE_INJECT_TEMPLATE,
    Templates.VIEW:VIEW_TEMPLATE,
    Templates.VIEW_MODEL:VIEW_MODEL_TEMPLATE,
  };
  return templateMap[template];
}

/* var tplPath = Platform.script.path;
  var tplSplit = tplPath.split('/bin');
  tplPath = '${tplSplit[0]}/lib/templates';
//  tplSplit.removeLast();
//  tplPath = tplSplit.join('/');
  return File('${tplPath}/$fileName.tmpl').readAsStringSync();*/
