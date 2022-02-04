import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:preferences_app/pages/home_page.dart';
import 'package:preferences_app/pages/settings_page.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/share_preferences/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode))
      ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {

  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (_) => const HomePage(),
        SettingsPage.routeName: (_) => const SettingsPage()
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }

}
