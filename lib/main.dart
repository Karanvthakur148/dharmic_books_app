import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/app/app_constants/color_constants.dart';
import 'package:quran_app/app/app_constants/navigator_constants.dart';
import 'package:quran_app/app/config/app_routes.dart';
import 'package:quran_app/app/config/env_config.dart';
import 'package:quran_app/app/config/flavour_config.dart';
import 'package:quran_app/app/config/hive_config.dart';
import 'package:quran_app/app/config/screen_config.dart';
import 'package:quran_app/cubits/login_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await QuranHiveConfig().initConfig();
  await configureFlavour();
  runApp(const MyApp());
}

configureFlavour() async {
  Map<String, dynamic> flavourJson = await QuranEnvConfig().getJson(
      jsonPath: "assets/.json");
  AppFlavourConfig().initConfig(flavourJson);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenResizerConfig().initConfig(
        MultiProvider(
          providers: [
            Provider<LoginCubit>(create: (context) => LoginCubit())
          ],
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return MaterialApp(
                // localizationsDelegates: context.localizationDelegates,
                // supportedLocales: context.supportedLocales,
                // locale: context.locale,
                useInheritedMediaQuery: true,
                navigatorKey: NavKey,
                builder: EasyLoading.init(),
                debugShowCheckedModeBanner: false,
                color: AppColors.primaryColor,
                title: "MBR",
                onGenerateRoute: AppRoutes().generateRoute,
                themeMode: ThemeMode.system,
                theme: ThemeData(
                  useMaterial3: true,

                  // Define the default brightness and colors.
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: Colors.purple,
                    background: Colors.white
                    // ···
                    // brightness: Brightness.dark,
                  ),

                  // Define the default `TextTheme`. Use this to specify the default
                  // text styling for headlines, titles, bodies of text, and more.
                  textTheme: TextTheme(
                    displayLarge: const TextStyle(
                      fontSize: 72,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // theme: GlobalTheme().globalTheme,
                // home: SplashScreen(),
              );
            },
          ),
        ));
  }
}
