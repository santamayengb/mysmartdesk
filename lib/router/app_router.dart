import 'package:auto_route/auto_route.dart';
import 'package:mysmartdesk/PhoneAuth/pages/phone_auth.page.dart';
import 'package:mysmartdesk/authentication/authentication.dart';
import 'package:mysmartdesk/core/auth_flow/auth.flow.dart';
import 'package:mysmartdesk/core/splash/splash_screen.page.dart';
import 'package:mysmartdesk/dashboard/dashboard.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: [
  AutoRoute(
    initial: true,
    page: AuthFlow,
    path: '/login',
    children: [
      AutoRoute(page: SplashScreenPage),
      AutoRoute(page: DashboardPage),
      AutoRoute(page: LoginPage),
    ],
  ),
  AutoRoute(page: SignUpPage),
  AutoRoute(page: PhoneAuthPage)
])
class $AppRouter {}
