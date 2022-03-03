import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class CSwitch extends StatefulWidget {
  final Function(bool) notifyParent;
  bool enableCoolStuff;
  CSwitch({Key key, this.notifyParent, this.enableCoolStuff}) : super(key: key);

  @override
  CSwitchState createState() => CSwitchState(notifyParent, enableCoolStuff);
}

class CSwitchState extends State<CSwitch> {
  bool enableCoolStuff;
  final Function(bool) notifyParent;

  CSwitchState(this.notifyParent, this.enableCoolStuff);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      behavior: HitTestBehavior.translucent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CustomSwitch(checked: enableCoolStuff),
        ],
      ),
    );
  }

  void _toggle() {
    setState(() {
      enableCoolStuff = !enableCoolStuff;
      widget.notifyParent(enableCoolStuff);
    });
  }
}

class CustomSwitch extends StatelessWidget {
  final bool checked;

  CustomSwitch({this.checked});

  @override
  Widget build(BuildContext context) {
    var tween = MultiTrackTween([
      Track("paddingLeft")
          .add(Duration(milliseconds: 400), Tween(begin: 0.0, end: 24.0)),
      Track("color").add(Duration(milliseconds: 400),
          ColorTween(begin: Colors.grey, end: Theme.of(context).primaryColor)),
    ]);

    return ControlledAnimation(
      playback: checked ? Playback.PLAY_FORWARD : Playback.PLAY_REVERSE,
      startPosition: checked ? 1.0 : 0.0,
      duration: tween.duration * 1.2,
      tween: tween,
      curve: Curves.easeInOut,
      builder: _buildCheckbox,
    );
  }

  Widget _buildCheckbox(context, animation) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: animation["color"],
      ),
      width: 50,
      height: 25,
      padding: EdgeInsets.all(3.0),
      child: Stack(
        children: [
          Positioned(
              child: Padding(
                padding: EdgeInsets.only(left: animation["paddingLeft"]),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white),
                    width: 20,
                  ),
              ))
        ],
      ),
    );
  }
}