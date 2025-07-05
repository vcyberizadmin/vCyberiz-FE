import 'dart:io';

import 'package:auto_injector/auto_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_recaptcha_v3/g_recaptcha_v3.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/DI/injector.dart';

import 'core/utils/constants/constants.dart';
import 'core/utils/styles/app_colors.dart';
import 'data/dio_base_service.dart';
import 'providers/provider_list.dart';
import 'routes/app_routes.dart';

final AutoInjector autoInjector = AutoInjector();
Future<void> main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  autoInjectInitializer();
//*---(hiding Re captcha badge)
  GRecaptchaV3.hideBadge();
  await dotenv.load(fileName: Constants.envPath); //load .env file
  HttpOverrides.global = MyHttpOverrides();
  // ... make network requests using Dio
  await DioBaseService.init(); //initialize Dio service
  await DioBaseSearchService.init(); //initialize Dio service
  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    const ScreenBreakpoints(
      desktop: 1026,
      tablet: 550,
      watch: 200,
    ),
  );
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Constants.height = MediaQuery.of(context).size.height;
    Constants.width = MediaQuery.of(context).size.width;
    Constants.videoBreakPoint = MediaQuery.of(context).size.width > 1950
        ? 1950
        : MediaQuery.of(context).size.width;
    return MultiBlocProvider(
      providers: providerList,
      child: MaterialApp.router(
        // child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'vCyberiz',
        theme: ThemeData(
          scrollbarTheme: const ScrollbarThemeData(
            thumbColor: WidgetStatePropertyAll<Color>(
              AppColors.transparent,
            ),
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary,
          ),
          useMaterial3: true,
        ),
        routerConfig: basicRoutes,
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
