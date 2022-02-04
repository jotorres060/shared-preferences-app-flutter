import 'package:flutter/material.dart';

import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:preferences_app/widgets/widgets.dart';

class HomePage extends StatelessWidget {

  static const String routeName = 'Home';

  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
      ),
      drawer: const SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Darkmode: ${ Preferences.isDarkmode }'),
          const Divider(),
          Text('Género: ${ Preferences.gender }'),
          const Divider(),
          Text('Nombre de usuario: ${ Preferences.name }'),
          const Divider()
        ],
      ),
    );
  }

}
