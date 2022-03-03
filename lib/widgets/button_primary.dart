import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  final VoidCallback onLongPress;
  ButtonPrimary({Key key, @required this.text, this.onClick, this.onLongPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(23, 108, 234, 0.26),
              blurRadius: 15,
              offset: Offset(0,6),
            )
          ],
      ),
      child: ButtonTheme(
          height: 43,
          child: FlatButton(
            textColor: Colors.white,
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            onPressed: onClick,
            onLongPress: onLongPress,
            child: Text(text, style: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
            )),
          )),
    );
  }
}
