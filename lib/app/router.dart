import 'package:auto_route/auto_route_annotations.dart';
import '../ui/views/home/HomeView.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: HomeView),
  ],
)
class $Router {}