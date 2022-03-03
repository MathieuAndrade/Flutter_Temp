import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:preferences/preferences.dart';

class PreferenceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        brightness: Brightness.light, // status bar brightness
        elevation: 0.0,
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
        title: Text("Paramètres",
          style: TextStyle(color: Theme.of(context).accentColor),),
      ),
      body: PreferencePage([
        PreferenceTitle('Infos de connexion internes'),
        TextFieldPreference('Adresse IP', 'device_ip', defaultVal: '192.168.1.50'),
        TextFieldPreference('Port interne', 'device_intern_port', defaultVal: '8080'),
        PreferenceTitle('Infos de connexion externes'),
        TextFieldPreference('Adresse DNS', 'dns_address', defaultVal: 'cameraferolles.ddns.net'),
        TextFieldPreference('Port externe', 'device_extern_port', defaultVal: '9005'),
      ]),
    );
  }
}