import 'package:auto_route/auto_route.dart';
import 'package:mysmartdesk/authentication/authentication.dart';
import 'package:mysmartdesk/dashboard/dashboard.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: [
  AutoRoute(page: LoginPage, initial: true),
  AutoRoute(page: SignUpPage),
  AutoRoute(page: DashboardPage)
])
class $AppRouter {}
