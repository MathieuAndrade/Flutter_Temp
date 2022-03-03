import 'package:flutter/material.dart';

class GoalTemp extends StatefulWidget {
  final Function(int) onChange;
  final int goalTemp;
  GoalTemp({Key key, this.onChange, this.goalTemp}) : super(key: key);
  @override
  _GoalTempState createState() => _GoalTempState(onChange, goalTemp);
}

class _GoalTempState extends State<GoalTemp> {
  final Function(int) onChange;
  int goalTemp;
  _GoalTempState(this.onChange, this.goalTemp);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          child: Padding(
              padding: EdgeInsets.only(
                top: 50,
                bottom: 50,
              ),
              child: Container(
                  width: 200.0,
                  height: 200.0,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(23, 108, 234, 0.30),
                        blurRadius: 15,
                        offset: Offset(0,10),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('Temperature choisie', style: TextStyle(color: Colors.grey)),
                      Text(''),
                      Text('$goalTemp°C', style: TextStyle(
                        fontSize: 36,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal,
                      )),
                    ],
                  )
              )
          ),
        ),
        Container(
          child: Padding(
              padding: EdgeInsets.only(
                bottom: 50,
              ),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                        width: 50.0,
                        height: 50.0,
                        margin: EdgeInsets.only(left: 20.0, right: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.06),
                              blurRadius: 15,
                              offset: Offset(0, 10),
                            )
                          ],
                        ),
                        child: IconButton(
                          icon: Icon(Icons.add),
                          color: Colors.black,
                          onPressed: () {
                            setState(() {
                              goalTemp = goalTemp +1;
                              widget.onChange(goalTemp);
                            });
                          },
                        )
                    ),
                    Container(
                        width: 50.0,
                        height: 50.0,
                        margin: EdgeInsets.only(left: 20.0, right: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.06),
                              blurRadius: 15,
                              offset: Offset(0, 10),
                            )
                          ],
                        ),
                        child: IconButton(
                          alignment: Alignment.topCenter,
                          icon: Icon(Icons.minimize),
                          color: Colors.black,
                          onPressed: () {
                            setState(() {
                              goalTemp = goalTemp -1;
                              widget.onChange(goalTemp);
                            });
                          },
                        )
                    )
                  ]
              )
          ),
        )
      ],
    );
  }
}
