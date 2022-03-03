import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:temperature_app/utils/api.dart';
import 'package:temperature_app/widgets/current_temp.dart';
import 'widgets/house_mode.dart';
import 'widgets/goal_temp.dart';
import 'widgets/button_primary.dart';
import 'package:preferences/preferences.dart';

// void main() => runApp(MainWidget());
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefService.init(prefix: 'pref_');
  runApp(MainWidget());
}

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // status bar color
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark
    ));
    return MaterialApp(
      title: 'Temperature app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        primaryColor: new Color(0xFF176CEA),
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int goalTemp = 21;
  int currentTemp = 20;
  bool deviceState = false;
  final snackBarError = SnackBar(
      content: Text('Une erreur est survenue !')
  );

  final snackBarOk = SnackBar(
      content: Text('C\'est bon tout est ok :)!')
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new SafeArea(
          child: new ListView(
            padding: const EdgeInsets.all(10),
            children: <Widget>[
              Container(
                child: HouseMode()
              ),
              Container(
                child: GoalTemp(onChange: (value) {
                  setState(() {
                    goalTemp = value;
                  });
                }, goalTemp: goalTemp,)
              ),
              Container(
                child: CurrentTemp(currentTemp: currentTemp, checked: deviceState),
              ),
              Container(
                  child: Padding(
                      padding: EdgeInsets.only(
                        left: 70,
                        right: 70,
                      ),
                      child:
                        ButtonTheme(
                            height: 40,
                            child: ButtonPrimary(text: 'Régler la température',
                              onClick: () {
                                changeTempState(goalTemp)
                                    .then((status) {
                                      if(status != 200) {
                                        Scaffold.of(context).showSnackBar(snackBarError);
                                      } else {
                                        Scaffold.of(context).showSnackBar(snackBarOk);
                                      }
                                    });
                            })
                      )
                  )
              ),
            ],
          )
      ),
    );
  }
}
