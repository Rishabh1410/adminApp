import 'package:flutter/material.dart';
import 'package:teledoc_admin/auth_pages/login.dart';
import 'package:teledoc_admin/auth_pages/reg.dart';

class first_page extends StatelessWidget {
  const first_page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 1,
      alignment: Alignment.topCenter,
      color: Color.fromRGBO(102, 102, 102, 1),
      child: Stack(alignment: Alignment.center, children: [
        Text(
          'Teledoc',
          style: TextStyle(color: Colors.white, fontSize: 50),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RaisedButton(
              padding: EdgeInsets.all(13),
              color: Colors.green,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => login_page(),
                        fullscreenDialog: true));
              },
              child: Text(
                'SIGN IN',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: RaisedButton(
                padding: EdgeInsets.all(13),
                color: Color.fromRGBO(255, 255, 255, 0),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Admin_Registration(),
                          fullscreenDialog: true));
                },
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
