const ROUTER_TEMPLATE =
    """import 'package:auto_route/auto_route_annotations.dart';
import '../ui/views/{{DIR_NAME}}/{{CLASS_NAME}}View.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: {{CLASS_NAME}}View),
  ],
)
class \$Router {}""";
