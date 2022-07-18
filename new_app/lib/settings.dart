import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

enum SingingCharacter { Light, Dark, System }

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  SingingCharacter? _character;
  late AdaptiveThemeMode savedThemeMode;

  @override
  void initState() {
    checkthetheme();
    super.initState();
  }

  Future<void> checkthetheme() async {
    AdaptiveThemeMode savedThemeMode1 = (await AdaptiveTheme.getThemeMode())!;
    setState(() {
      savedThemeMode = savedThemeMode1;
    });
    if (savedThemeMode.isLight) {
      setState(() {
        _character = SingingCharacter.Light;
      });
    } else if (savedThemeMode.isDark) {
      setState(() {
        _character = SingingCharacter.Dark;
      });
    } else {
      setState(() {
        _character = SingingCharacter.System;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      duration: Duration(milliseconds: 300),
      data: Theme.of(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Setting'),
        ),
        body: Column(
          children: <Widget>[
            ListTile(
              title: const Text('Light'),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.Light,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                    AdaptiveTheme.of(context).setLight();
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Dark'),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.Dark,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                    AdaptiveTheme.of(context).setDark();
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('System'),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.System,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                    AdaptiveTheme.of(context).setSystem();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
