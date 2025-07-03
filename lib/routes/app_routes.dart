// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vcyberiz/screens/about_vcyberiz/new_about_us_screen.dart';
import 'package:vcyberiz/screens/blog_page/blog_page.dart';
import 'package:vcyberiz/screens/career_page/career_page.dart';
import 'package:vcyberiz/screens/contact_us_screen/contact_us.dart';
import 'package:vcyberiz/screens/error/error_screen.dart';
import 'package:vcyberiz/screens/event_page/event_page.dart';
import 'package:vcyberiz/screens/news_articles/news_article.dart';
import 'package:vcyberiz/screens/news_page/news_page.dart';
import 'package:vcyberiz/screens/partners_screen/partners_screen.dart';
import 'package:vcyberiz/screens/career_details_screen/career_details_screen.dart';
import 'package:vcyberiz/screens/resources/resource_screen.dart';
import 'package:vcyberiz/screens/service_details/service_details.dart';

import '../main.dart';
import '../screens/blog_articles/blog_article_screen.dart';
import '../screens/cookie_policy/cookie_policy.dart';
import '../screens/event_details/event_details.dart';
import '../screens/home/home_screen.dart';
import '../screens/privacy_policy/privacy_policy.dart';
import '../screens/service_page/service_section.dart';
import '../screens/solution_section/solutions.dart';
import 'route_constants.dart';

final GoRouter basicRoutes = GoRouter(
  routerNeglect: true,
  debugLogDiagnostics: true,
  navigatorKey: navigationKey,
  routes: <RouteBase>[
    GoRoute(
        path: RouteConstants.initialRoute,
        name: RouteConstants.initialPath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(child: HomeScreen());
        }),
    GoRoute(
        path: RouteConstants.homeScreenRoute,
        name: RouteConstants.homeScreenPath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(child: HomeScreen());
        }),
    GoRoute(
        path: RouteConstants.solutionsRoute,
        name: RouteConstants.solutionsPath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(child: SolutionsSection());
        }),
    GoRoute(
        path: RouteConstants.contactUsScreenRoute,
        name: RouteConstants.contactUsScreenPath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(child: ContactUsScreen());
        }),
    GoRoute(
        path: RouteConstants.eventsScreenRoute,
        name: RouteConstants.eventsScreenPath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(child: EventsScreen());
        }),
    GoRoute(
        path: RouteConstants.partnersScreenRoute,
        name: RouteConstants.partnersScreenPath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(child: PartnersScreen());
        }),
    GoRoute(
        path: RouteConstants.aboutUsRoute,
        name: RouteConstants.aboutUsPath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(child: NewAboutUsScreen());
        }),
    GoRoute(
        path: RouteConstants.careerScreenRoute,
        name: RouteConstants.careerScreenPath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(child: CareerPage());
        }),
    GoRoute(
        path: RouteConstants.careerDetailsScreenRoute,
        name: RouteConstants.careerDetailsScreenPath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(
            child: CareerDetailsScreen(
              documentId: state.uri.queryParameters['id'] ?? '',
            ),
          );
        }),
    GoRoute(
        path: RouteConstants.servicesRoute,
        name: RouteConstants.servicesPath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(child: ServiceSecurityScreen());
        }),
    GoRoute(
        path: RouteConstants.blogsScreenRoute,
        name: RouteConstants.blogsScreenPath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(child: BlogsScreen());
        }),
    GoRoute(
        path: RouteConstants.blogArticleRoute,
        name: RouteConstants.blogArticlePath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(
            child: BlogArticleScreen(
              documentId: state.uri.queryParameters['id'] ?? '',
            ),
          );
        }),
    GoRoute(
        path: RouteConstants.cookiesRoute,
        name: RouteConstants.cookiesPath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(child: CookiePolicy());
        }),
    GoRoute(
        path: RouteConstants.privacyRoute,
        name: RouteConstants.privacyPath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(child: PrivacyPolicyScreen());
        }),
    GoRoute(
        path: RouteConstants.resourceRoute,
        name: RouteConstants.resourcePath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(child: ResourceScreen());
        }),
    GoRoute(
        path: RouteConstants.newsRoute,
        name: RouteConstants.newsPath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(child: NewsScreen());
        }),
    GoRoute(
        path: RouteConstants.newsArticleRoute,
        name: RouteConstants.newsArticlePath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(
            child: NewsArticleScreen(
              documentId: state.uri.queryParameters['id'] ?? '',
            ),
          );
        }),
    GoRoute(
        path: RouteConstants.serviceDetailsRoute,
        name: RouteConstants.serviceDetailsPath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(
            child: ServiceDetailsScreen(
              documentId: state.uri.queryParameters['id'] ?? '',
            ),
          );
        }),
    GoRoute(
        path: RouteConstants.vshieldRoute,
        name: RouteConstants.vshieldPath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(
            child: ServiceDetailsScreen(
              documentId: state.uri.queryParameters['id'] ?? '',
            ),
          );
        }),
    GoRoute(
        path: RouteConstants.varmorRoute,
        name: RouteConstants.varmorPath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(
            child: ServiceDetailsScreen(
              documentId: state.uri.queryParameters['id'] ?? '',
            ),
          );
        }),
    GoRoute(
        path: RouteConstants.vprotectRoute,
        name: RouteConstants.vprotectPath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(
            child: ServiceDetailsScreen(
              documentId: state.uri.queryParameters['id'] ?? '',
            ),
          );
        }),
    GoRoute(
        path: RouteConstants.vrespondRoute,
        name: RouteConstants.vrespondPath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(
            child: ServiceDetailsScreen(
              documentId: state.uri.queryParameters['id'] ?? '',
            ),
          );
        }),
    GoRoute(
        path: RouteConstants.cyberMeturityRoute,
        name: RouteConstants.cyberMeturityPath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(
            child: ServiceDetailsScreen(
              documentId: state.uri.queryParameters['id'] ?? '',
            ),
          );
        }),
    GoRoute(
        path: RouteConstants.penitraionTestingRoute,
        name: RouteConstants.penitraionTestingPath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(
            child: ServiceDetailsScreen(
              documentId: state.uri.queryParameters['id'] ?? '',
            ),
          );
        }),
    GoRoute(
        path: RouteConstants.postureAdvisoryRoute,
        name: RouteConstants.postureAdvisoryPath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(
            child: ServiceDetailsScreen(
              documentId: state.uri.queryParameters['id'] ?? '',
            ),
          );
        }),
    GoRoute(
        path: RouteConstants.managedSecurityRoute,
        name: RouteConstants.managedSecurityPath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(
            child: ServiceDetailsScreen(
              documentId: state.uri.queryParameters['id'] ?? '',
            ),
          );
        }),
    GoRoute(
        path: RouteConstants.securityImplementationRoute,
        name: RouteConstants.securityImplementationPath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(
            child: ServiceDetailsScreen(
              documentId: state.uri.queryParameters['id'] ?? '',
            ),
          );
        }),
    GoRoute(
        path: RouteConstants.eventDetailsRoute,
        name: RouteConstants.eventDetailsPath,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(
            child: EventDetailsScreen(
              documentId: state.uri.queryParameters['id'] ?? '',
            ),
          );
        }),
  ],
  errorBuilder: (context, state) {
    return ErrorScreen(
      error: state.error.toString(),
      dataConnected: true,
    );
  },
);
