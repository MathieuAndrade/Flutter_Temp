import 'package:flutter/material.dart';
import 'package:temperature_app/preference.dart';
import 'package:temperature_app/utils/api.dart';
import 'button_primary.dart';

// ignore: must_be_immutable
class HouseMode extends StatelessWidget {

  final snackBarError = SnackBar(
      content: Text('Une erreur est survenue !')
  );

  final snackBarOk = SnackBar(
      content: Text('C\'est bon tout est ok :)!')
  );

  int longPress = 0;

  void _longPress(context, value) {
      longPress = longPress + value;
      if(longPress == 2) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => PreferenceWidget()));
      }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 30,
                right: 15,
              ),
              child: ButtonPrimary(text: 'Sortie',
                  onClick: () {
                    print('Sortie');
                    changeHouseState('out')
                        .then((status) {
                          if(status != 200) {
                            Scaffold.of(context).showSnackBar(snackBarError);
                          } else {
                            Scaffold.of(context).showSnackBar(snackBarOk);
                          }
                        });
                    },
                  onLongPress: () {_longPress(context, 1);}
              )
          ),
        ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 15,
                right: 30,
              ),
              child: ButtonTheme(
                  height: 40,
                  child: ButtonPrimary(text: 'A la maison',
                      onClick: () {
                        print('a la maison');
                        changeHouseState('inHouse')
                            .then((status) {
                              if(status != 200) {
                                Scaffold.of(context).showSnackBar(snackBarError);
                              } else {
                                Scaffold.of(context).showSnackBar(snackBarOk);
                              }
                            });
                        },
                      onLongPress: () {_longPress(context, 1);}
                  )
              )
          ),
        ),
      ],
    );
  }
}
