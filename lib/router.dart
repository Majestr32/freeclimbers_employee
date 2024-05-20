
import 'dart:typed_data';

import 'package:freeclimbers_employee/main.dart';
import 'package:freeclimbers_employee/ui/screens/auth/account_created.dart';
import 'package:freeclimbers_employee/ui/screens/auth/reset_password.dart';
import 'package:freeclimbers_employee/ui/screens/auth/sign_in.dart';
import 'package:freeclimbers_employee/ui/screens/auth/sign_up.dart';
import 'package:freeclimbers_employee/ui/screens/home/settings/change_password_screen.dart';
import 'package:freeclimbers_employee/ui/screens/home/settings/settings_screen.dart';
import 'package:freeclimbers_employee/ui/screens/home/support/contact_us_screen.dart';
import 'package:freeclimbers_employee/ui/screens/home/support/license_screen.dart';
import 'package:freeclimbers_employee/ui/screens/home/support/support_screen.dart';
import 'package:freeclimbers_employee/ui/screens/home/support/web_document_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'consts/web_documents_enums.dart';

class RouteNames{
  ///Supports [extra] bool variable.
  ///True if you want to show animation
  static String signIn = '/sign_in';
  static String main = '/';
  static String signUp = '/sign_up';
  static String resetPassword = '/reset_password';
  static String accountCreated = '/account_created';

  ///Supports [extra] variable of type [WebDocumentRouteExtra] json
  static String webDocument(String lang, WebDocumentRoutes route, [int? branchId]) => '/web_document/$lang/${route.route}${branchId == null ? '' : '?branch_id=$branchId'}';
  ///Supports [extra] variable of type [WebBranchDocumentRouteExtra] json
  static String webBranchDocument(String lang, WebBranchDocumentRoutes route) => '/web_branch_document/$lang/${route.route}';
  static String license = '/license';
  static String settings = '/settings';
  static String help = '/help';
  static String contactUs = '/contact_us';

  static String changePassword = '/change_password';

  static String registrationComplete = '/registration_complete';
}

final GoRouter router = GoRouter(
  restorationScopeId: 'router',
    routes: <GoRoute>[
      GoRoute(
          path: RouteNames.contactUs,
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            opaque: true,
            key: state.pageKey,
            child: ContactUsScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                SlideTransition(
                    position: Tween<Offset>(
                        begin: const Offset(1,0),
                        end: Offset.zero
                    ).animate(animation),
                    child: child),
          ),
          builder: (context,state){
            return ContactUsScreen();
          }
      ),
      GoRoute(
          path: RouteNames.license,
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            opaque: true,
            key: state.pageKey,
            child: const LicenseScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                SlideTransition(
                    position: Tween<Offset>(
                        begin: const Offset(1,0),
                        end: Offset.zero
                    ).animate(animation),
                    child: child),
          ),
          builder: (context,state){
            return const LicenseScreen();
          }
      ),
      GoRoute(
          path: '/web_branch_document/:lang/:route',
          name: '/web_branch_document',
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            opaque: true,
            key: state.pageKey,
            child: WebDocumentScreen(locale: state.params["lang"] as String,route: state.params["route"] as String, fromRequest: true, content: (state.extra as Map)["content"], overrideBranch: (state.extra as Map)["overrideIcon"] == null ? null : (state.extra as Map)["overrideIcon"]!,),
            transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                SlideTransition(
                    position: Tween<Offset>(
                        begin: const Offset(1,0),
                        end: Offset.zero
                    ).animate(animation),
                    child: child),
          ),
          builder: (context,state){
            return WebDocumentScreen(locale: state.params["lang"] as String,route: state.params["route"] as String, fromRequest: true, content: (state.extra as Map)["content"], overrideBranch: (state.extra as Map)["overrideIcon"] == null ? null : (state.extra as Map)["overrideIcon"]!);
          }
      ),
      GoRoute(
          path: '/web_document/:lang/:route',
          name: '/web_document',
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            opaque: true,
            key: state.pageKey,
            child: WebDocumentScreen(locale: state.params["lang"] as String,route: state.params["route"] as String, overrideBranch: state.extra as Uint8List?,),
            transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                SlideTransition(
                    position: Tween<Offset>(
                        begin: const Offset(1,0),
                        end: Offset.zero
                    ).animate(animation),
                    child: child),
          ),
          builder: (context,state){
            return WebDocumentScreen(locale: state.params["lang"] as String,route: state.params["route"] as String, overrideBranch: state.extra as Uint8List?);
          }
      ),
      GoRoute(
          path: RouteNames.help,
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            opaque: true,
            key: state.pageKey,
            child: const SupportScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                SlideTransition(
                    position: Tween<Offset>(
                        begin: const Offset(1,0),
                        end: Offset.zero
                    ).animate(animation),
                    child: child),
          ),
          builder: (context,state){
            return const SupportScreen();
          }
      ),
      GoRoute(
          path: RouteNames.changePassword,
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            opaque: true,
            key: state.pageKey,
            child: const ChangePasswordScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                SlideTransition(
                    position: Tween<Offset>(
                        begin: const Offset(1,0),
                        end: Offset.zero
                    ).animate(animation),
                    child: child),
          ),
          builder: (context,state){
            return const ChangePasswordScreen();
          }
      ),
      GoRoute(
          path: RouteNames.settings,
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            restorationId: RouteNames.settings,
            key: state.pageKey,
            child: const SettingsScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                SlideTransition(
                    position: Tween<Offset>(
                        begin: const Offset(1,0),
                        end: Offset.zero
                    ).animate(animation),
                    child: child),
          ),
          builder: (context,state){
            return const SettingsScreen();
          }
      ),
      GoRoute(
        path: RouteNames.signIn,
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            transitionDuration: const Duration(milliseconds: 400),
            opaque: true,
            key: state.pageKey,
            child: const SignInScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                Stack(
                  children: [
                    SignInScreen(),
                    SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, - 1),
                          end: Offset.zero
                        ).animate(animation),
                        child: child),
                  ],
                ),
          ),
        builder: (context,state){
          return const SignInScreen();
        }
      ),
      GoRoute(
          path: RouteNames.resetPassword,
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            transitionDuration: const Duration(milliseconds: 400),
            opaque: true,
            key: state.pageKey,
            child: const ResetPassword(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                SlideTransition(
                    position: Tween<Offset>(
                        begin: const Offset(0,1),
                        end: Offset.zero
                    ).animate(animation),
                    child: child),
          ),
          builder: (context,state){
            return const ResetPassword();
          }
      ),
      GoRoute(
          path: RouteNames.accountCreated,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          transitionDuration: const Duration(milliseconds: 400),
          opaque: true,
          key: state.pageKey,
          child: const AccountCreated(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
                  position: Tween<Offset>(
                      begin: const Offset(0,1),
                      end: Offset.zero
                  ).animate(animation),
                  child: child),
        ),
          builder: (context,state){
            return const AccountCreated();
          },

      ),
      GoRoute(
        path: RouteNames.main,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          transitionDuration: const Duration(milliseconds: 400),
          opaque: true,
          key: state.pageKey,
          child: const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
                  position: Tween<Offset>(
                      begin: const Offset(0,1),
                      end: Offset.zero
                  ).animate(animation),
                  child: child),
        ),
        builder: (context,state){
          return const HomePage();
        },

      ),
      GoRoute(
          path: RouteNames.signUp,
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            transitionDuration: const Duration(milliseconds: 400),
            opaque: true,
            key: state.pageKey,
            child: const SignUpScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                SlideTransition(
                    position: Tween<Offset>(
                        begin: const Offset(0,1),
                        end: Offset.zero
                    ).animate(animation),
                    child: child),
          ),
          builder: (context,state){
            return const SignUpScreen();
          }
      )
    ]
  );