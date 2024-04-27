
import 'package:apex_cpd/data/models/cpd/cpd_model.dart';
import 'package:apex_cpd/presentation/screens/certificate/view_certificate.dart';
import 'package:apex_cpd/presentation/screens/intro/intro_screen.dart';
import 'package:apex_cpd/presentation/screens/profile/planning_review.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screens/mainNavigation/main_navigation.dart';
import '../../presentation/screens/profile/about_logging_cpd.dart';
import '../../presentation/screens/profile/edit_profile.dart';
import '../../presentation/screens/profile/my_cpd_summary.dart';
import '../../presentation/screens/sign_in/sign_in_screen.dart';
import '../../presentation/screens/sign_up/sign_up_screen.dart';
import '../../presentation/screens/splash/splash_screen.dart';


class AppRouter {
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
            path: '/',
           // name: 'signIn',
            builder: (BuildContext context, GoRouterState state) {
              return  MyNavigationBar();
            },
        routes: <RouteBase>[
            GoRoute(
            path: 'intro',
            name: 'intro',
            builder: (BuildContext context, GoRouterState state) {
              return  const IntroScreen();
            },
          ),
            GoRoute(
            path: 'signIn',
            name: 'signIn',
            builder: (BuildContext context, GoRouterState state) {
              return const SignInScreen();
            },
          ),
          
          GoRoute(
            path: 'signUp',
            name: 'signUp',
            builder: (BuildContext context, GoRouterState state) {
              return const SignUpScreen();
            },
          ),
          
         GoRoute(
            path: 'mainNavigation',
            name: 'mainNavigation',
            builder: (BuildContext context, GoRouterState state) {
              return const MyNavigationBar();
            },
          ),
           GoRoute(
            path: 'ViewCertificate',
            name: 'ViewCertificate',
            builder: (BuildContext context, GoRouterState state) {
              final CpdDataModel cpd = state.extra as CpdDataModel;
              return  ViewCertificate(cpd: cpd,);
            },
          ),
            GoRoute(
            path: 'AboutLoggingCpd',
            name: 'AboutLoggingCpd',
            builder: (BuildContext context, GoRouterState state) {
              return  AboutLoggingCpd();
            },
          ),
           GoRoute(
            path: 'PlanningReviewingCpd',
            name: 'PlanningReviewingCpd',
            builder: (BuildContext context, GoRouterState state) {
              return  PlanningReviewingCpd();
            },
          ),
           GoRoute(
            path: 'MyCpdSummary',
            name: 'MyCpdSummary',
            builder: (BuildContext context, GoRouterState state) {
              return  MyCpdSummary();
            },
          ),
          
            GoRoute(
            path: 'editProfile',
            name: 'editProfile',
            builder: (BuildContext context, GoRouterState state) {
              return const EditProfile();
            },
          ),

          
        
         
       
         
       
          
        
          
         
          
        
          
        ],
      ),
    ],
  );
}
