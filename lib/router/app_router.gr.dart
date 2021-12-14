// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../authentication/authentication.dart' as _i4;
import '../core/auth_flow/auth.flow.dart' as _i1;
import '../core/splash/splash_screen.page.dart' as _i2;
import '../dashboard/dashboard.dart' as _i3;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AuthFlow.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AuthFlow());
    },
    SplashScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SplashScreenPage());
    },
    DashboardRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.DashboardPage());
    },
    LoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.LoginPage());
    },
    SignUpRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpRouteArgs>(
          orElse: () => const SignUpRouteArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.SignUpPage(key: args.key));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig('/#redirect',
            path: '/', redirectTo: '/login', fullMatch: true),
        _i5.RouteConfig(AuthFlow.name, path: '/login', children: [
          _i5.RouteConfig(SplashScreenRoute.name,
              path: 'splash-screen-page', parent: AuthFlow.name),
          _i5.RouteConfig(DashboardRoute.name,
              path: 'dashboard-page', parent: AuthFlow.name),
          _i5.RouteConfig(LoginRoute.name,
              path: 'login-page', parent: AuthFlow.name),
          _i5.RouteConfig(SignUpRoute.name,
              path: 'sign-up-page', parent: AuthFlow.name)
        ])
      ];
}

/// generated route for
/// [_i1.AuthFlow]
class AuthFlow extends _i5.PageRouteInfo<void> {
  const AuthFlow({List<_i5.PageRouteInfo>? children})
      : super(AuthFlow.name, path: '/login', initialChildren: children);

  static const String name = 'AuthFlow';
}

/// generated route for
/// [_i2.SplashScreenPage]
class SplashScreenRoute extends _i5.PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(SplashScreenRoute.name, path: 'splash-screen-page');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i5.PageRouteInfo<void> {
  const DashboardRoute() : super(DashboardRoute.name, path: 'dashboard-page');

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: 'login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.SignUpPage]
class SignUpRoute extends _i5.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({_i6.Key? key})
      : super(SignUpRoute.name,
            path: 'sign-up-page', args: SignUpRouteArgs(key: key));

  static const String name = 'SignUpRoute';
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key}';
  }
}
