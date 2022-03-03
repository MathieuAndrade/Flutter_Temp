import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:temperature_app/widgets/custom_switch.dart';
import 'package:temperature_app/utils/api.dart';

class CurrentTemp extends StatefulWidget {
  final int currentTemp;
  final bool checked;
  CurrentTemp({Key key, this.currentTemp, this.checked}) : super(key: key);
  @override
  _CurrentTempState createState() => _CurrentTempState(currentTemp, checked);
}

class _CurrentTempState extends State<CurrentTemp> {
  int currentTemp = 20;
  bool checked = false;
  _CurrentTempState(this.currentTemp, this.checked);

  final snackBarError = SnackBar(
      content: Text('Une erreur est survenue !')
  );

  final snackBarOk = SnackBar(
      content: Text('C\'est bon tout est ok :)!')
  );

  @override
  void setState(fn) {
    super.setState(fn);
    getCurrentTemp()
        .then((temp) {
          currentTemp = temp;
        });
  }

  onChecked(value) {
    changeDeviceState(value)
        .then((status){
          if(status != 200) {
            Scaffold.of(context).showSnackBar(snackBarError);
          } else {
            Scaffold.of(context).showSnackBar(snackBarOk);
          }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 50,
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 6,
                    ),
                    child: Text('Temperature actuelle',
                        style: TextStyle(color: Colors.grey)),
                  ),
                  Text('$currentTemp°C',
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal,
                      )),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 6,
                    ),
                    child: Text('Allumer/Eteindre',
                        style: TextStyle(color: Colors.grey)),
                  ),
                  CSwitch(notifyParent: onChecked, enableCoolStuff: checked)
                ],
              ),
            ]));
  }
}
