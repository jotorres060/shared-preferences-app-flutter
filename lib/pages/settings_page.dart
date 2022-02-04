import 'package:flutter/material.dart';
import 'package:preferences_app/providers/theme_provider.dart';

import 'package:provider/provider.dart';

import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:preferences_app/widgets/widgets.dart';

class SettingsPage extends StatefulWidget {

  static const String routeName = 'Settings';

  const SettingsPage({ Key? key }) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();

}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
      ),
      drawer: const SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Ajustes', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300)),
              const Divider(),
              SwitchListTile.adaptive(
                value: Preferences.isDarkmode,
                title: const Text('Darkmode'),
                onChanged: (value) {
                  Preferences.isDarkmode = value;
                  final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
                  value ? themeProvider.setDarkMode() : themeProvider.setLightMode();
                  setState(() {});
                }
              ),
              const Divider(),
              RadioListTile<int>(
                value: 1,
                groupValue: Preferences.gender,
                title: const Text('Femenino'),
                onChanged: (value) {
                  Preferences.gender = value ?? 1;
                  setState(() {});
                }
              ),
              const Divider(),
              RadioListTile<int>(
                value: 2,
                groupValue: Preferences.gender,
                title: const Text('Masculino'),
                onChanged: (value) {
                  Preferences.gender = value ?? 2;
                  setState(() {});
                }
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue: Preferences.name,
                  onChanged: (value) {
                    Preferences.name = value;
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre de usuario'
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
