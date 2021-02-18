import 'package:flutter/material.dart';

class splash extends StatelessWidget {
  const splash({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;

    return GestureDetector(
      // onTap:(){},
      child: Container(
        height: hight,
        width: width,
        color: Color.fromRGBO(110, 120, 247, 1),
      ),
    );
  }
}
