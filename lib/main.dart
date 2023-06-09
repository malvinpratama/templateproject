import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_strategy/url_strategy.dart';
import 'src/configs/app_locale.dart';
import 'src/configs/app_routes.dart';
import 'src/modules/app/blocs/app_bloc.dart';
import 'src/modules/app/blocs/app_state.dart';
import 'src/modules/shared/widget/custom_bloc_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setPathUrlStrategy();
  runApp(EasyLocalization(
      path: AppLocale.path,
      supportedLocales: AppLocale.supportedLocaleList,
      startLocale: AppLocale.startLocale,
      fallbackLocale: AppLocale.fallbackLocale,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return CustomBlocProvider<AppBloc, AppState>(
          lazy: false,
          create: (context) => AppBloc(),
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp.router(
              title: 'Flutter Demo',
              theme: ThemeData(
                // This is the theme of your application.
                //
                // Try running your application with "flutter run". You'll see the
                // application has a blue toolbar. Then, without quitting the app, try
                // changing the primarySwatch below to Colors.green and then invoke
                // "hot reload" (press "r" in the console where you ran "flutter run",
                // or simply save your changes to "hot reload" in a Flutter IDE).
                // Notice that the counter didn't reset back to zero; the application
                // is not restarted.
                primarySwatch: Colors.blue,
              ),
              routeInformationProvider:
                  AppRoutes.router.routeInformationProvider,
              routeInformationParser: AppRoutes.router.routeInformationParser,
              routerDelegate: AppRoutes.router.routerDelegate,
            );
          },
        );
      },
    );
  }
}
