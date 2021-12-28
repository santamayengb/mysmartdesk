// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../authentication/authentication.dart' as _i2;
import '../core/auth_flow/auth.flow.dart' as _i1;
import '../core/splash/splash_screen.page.dart' as _i5;
import '../dashboard/dashboard.dart' as _i6;
import '../PhoneAuth/pages/otp_verification.page.dart' as _i4;
import '../PhoneAuth/pages/phone_auth.page.dart' as _i3;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AuthFlow.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AuthFlow());
    },
    SignUpRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignUpPage());
    },
    PhoneAuthRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.PhoneAuthPage());
    },
    OtpVerificationRoute.name: (routeData) {
      final args = routeData.argsAs<OtpVerificationRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.OtpVerificationPage(key: args.key, number: args.number));
    },
    SplashScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.SplashScreenPage());
    },
    DashboardRoute.name: (routeData) {
      final args = routeData.argsAs<DashboardRouteArgs>(
          orElse: () => const DashboardRouteArgs());
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.DashboardPage(key: args.key));
    },
    LoginRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig('/#redirect',
            path: '/', redirectTo: '/login', fullMatch: true),
        _i7.RouteConfig(AuthFlow.name, path: '/login', children: [
          _i7.RouteConfig(SplashScreenRoute.name,
              path: 'splash-screen-page', parent: AuthFlow.name),
          _i7.RouteConfig(DashboardRoute.name,
              path: 'dashboard-page', parent: AuthFlow.name),
          _i7.RouteConfig(LoginRoute.name,
              path: 'login-page', parent: AuthFlow.name)
        ]),
        _i7.RouteConfig(SignUpRoute.name, path: '/sign-up-page'),
        _i7.RouteConfig(PhoneAuthRoute.name, path: '/phone-auth-page'),
        _i7.RouteConfig(OtpVerificationRoute.name,
            path: '/otp-verification-page')
      ];
}

/// generated route for
/// [_i1.AuthFlow]
class AuthFlow extends _i7.PageRouteInfo<void> {
  const AuthFlow({List<_i7.PageRouteInfo>? children})
      : super(AuthFlow.name, path: '/login', initialChildren: children);

  static const String name = 'AuthFlow';
}

/// generated route for
/// [_i2.SignUpPage]
class SignUpRoute extends _i7.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: '/sign-up-page');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i3.PhoneAuthPage]
class PhoneAuthRoute extends _i7.PageRouteInfo<void> {
  const PhoneAuthRoute() : super(PhoneAuthRoute.name, path: '/phone-auth-page');

  static const String name = 'PhoneAuthRoute';
}

/// generated route for
/// [_i4.OtpVerificationPage]
class OtpVerificationRoute extends _i7.PageRouteInfo<OtpVerificationRouteArgs> {
  OtpVerificationRoute({_i8.Key? key, required String number})
      : super(OtpVerificationRoute.name,
            path: '/otp-verification-page',
            args: OtpVerificationRouteArgs(key: key, number: number));

  static const String name = 'OtpVerificationRoute';
}

class OtpVerificationRouteArgs {
  const OtpVerificationRouteArgs({this.key, required this.number});

  final _i8.Key? key;

  final String number;

  @override
  String toString() {
    return 'OtpVerificationRouteArgs{key: $key, number: $number}';
  }
}

/// generated route for
/// [_i5.SplashScreenPage]
class SplashScreenRoute extends _i7.PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(SplashScreenRoute.name, path: 'splash-screen-page');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i6.DashboardPage]
class DashboardRoute extends _i7.PageRouteInfo<DashboardRouteArgs> {
  DashboardRoute({_i8.Key? key})
      : super(DashboardRoute.name,
            path: 'dashboard-page', args: DashboardRouteArgs(key: key));

  static const String name = 'DashboardRoute';
}

class DashboardRouteArgs {
  const DashboardRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'DashboardRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: 'login-page');

  static const String name = 'LoginRoute';
}
