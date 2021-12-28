// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../authentication/authentication.dart' as _i2;
import '../core/auth_flow/auth.flow.dart' as _i1;
import '../core/splash/splash_screen.page.dart' as _i4;
import '../dashboard/dashboard.dart' as _i5;
import '../PhoneAuth/pages/phone_auth.page.dart' as _i3;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AuthFlow.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AuthFlow());
    },
    SignUpRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignUpPage());
    },
    PhoneAuthRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.PhoneAuthPage());
    },
    SplashScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SplashScreenPage());
    },
    DashboardRoute.name: (routeData) {
      final args = routeData.argsAs<DashboardRouteArgs>(
          orElse: () => const DashboardRouteArgs());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.DashboardPage(key: args.key));
    },
    LoginRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig('/#redirect',
            path: '/', redirectTo: '/login', fullMatch: true),
        _i6.RouteConfig(AuthFlow.name, path: '/login', children: [
          _i6.RouteConfig(SplashScreenRoute.name,
              path: 'splash-screen-page', parent: AuthFlow.name),
          _i6.RouteConfig(DashboardRoute.name,
              path: 'dashboard-page', parent: AuthFlow.name),
          _i6.RouteConfig(LoginRoute.name,
              path: 'login-page', parent: AuthFlow.name)
        ]),
        _i6.RouteConfig(SignUpRoute.name, path: '/sign-up-page'),
        _i6.RouteConfig(PhoneAuthRoute.name, path: '/phone-auth-page')
      ];
}

/// generated route for
/// [_i1.AuthFlow]
class AuthFlow extends _i6.PageRouteInfo<void> {
  const AuthFlow({List<_i6.PageRouteInfo>? children})
      : super(AuthFlow.name, path: '/login', initialChildren: children);

  static const String name = 'AuthFlow';
}

/// generated route for
/// [_i2.SignUpPage]
class SignUpRoute extends _i6.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: '/sign-up-page');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i3.PhoneAuthPage]
class PhoneAuthRoute extends _i6.PageRouteInfo<void> {
  const PhoneAuthRoute() : super(PhoneAuthRoute.name, path: '/phone-auth-page');

  static const String name = 'PhoneAuthRoute';
}

/// generated route for
/// [_i4.SplashScreenPage]
class SplashScreenRoute extends _i6.PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(SplashScreenRoute.name, path: 'splash-screen-page');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i5.DashboardPage]
class DashboardRoute extends _i6.PageRouteInfo<DashboardRouteArgs> {
  DashboardRoute({_i7.Key? key})
      : super(DashboardRoute.name,
            path: 'dashboard-page', args: DashboardRouteArgs(key: key));

  static const String name = 'DashboardRoute';
}

class DashboardRouteArgs {
  const DashboardRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'DashboardRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: 'login-page');

  static const String name = 'LoginRoute';
}
