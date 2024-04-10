import 'package:connection_notifier/connection_notifier.dart';
import 'package:devy_boiler_plate/presentation/auth/login_page.dart';
import 'package:devy_boiler_plate/presentation/dashboard/dashboard_page.dart';
import 'package:devy_boiler_plate/presentation/splash_screen/splash_screen_page.dart';
import 'package:devy_boiler_plate/utils/constant/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'coming_soon/coming_soon_page.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    String envFile = ".env";
    await dotenv.load(fileName: envFile);
  }

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ConnectionNotifier(
      connectionNotificationOptions: const ConnectionNotificationOptions(
          disconnectedText: "No Internet, Retrying"),
      child: ListenableBuilder(
        listenable: widget.settingsController,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            // Providing a restorationScopeId allows the Navigator built by the
            // MaterialApp to restore the navigation stack when a user leaves and
            // returns to the app after it has been killed while running in the
            // background.
            restorationScopeId: 'app',

            debugShowCheckedModeBanner: false,
            // Provide the generated AppLocalizations to the MaterialApp. This
            // allows descendant Widgets to display the correct translations
            // depending on the user's locale.
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''), // English, no country code
              Locale('es', ''), // Spanish, no country code
            ],

            // Use AppLocalizations to configure the correct application title
            // depending on the user's locale.
            //
            // The appTitle is defined in .arb files found in the localization
            // directory.
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,

            // Define a light and dark color theme. Then, read the user's
            // preferred ThemeMode (light, dark, or system default) from the
            // SettingsController to display the correct theme.

            theme: ThemeData(
                textTheme:
                    GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
                useMaterial3: true,
                colorScheme: lightColorScheme),
            darkTheme: ThemeData(
                textTheme:
                    GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
                useMaterial3: true,
                colorScheme: darkColorScheme),
            themeMode: widget.settingsController.themeMode,

            // Define a function to handle named routes in order to support
            // Flutter web url navigation and deep linking.
            onGenerateRoute: (RouteSettings routeSettings) {
              return MaterialPageRoute<void>(
                settings: routeSettings,
                builder: (BuildContext context) {
                  switch (routeSettings.name) {
                    case SettingsView.routeName:
                      return SettingsView(
                          controller: widget.settingsController);
                    case ComingSoonPage.routeName:
                      return const ComingSoonPage();
                    case LoginPage.routeName:
                      return const LoginPage();
                    case SplashScreenPage.routeName:
                      return const SplashScreenPage();
                    case DashboardPage.routeName:
                      return const DashboardPage();
                    default:
                      return const SplashScreenPage();
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
