import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:teledoc_admin/pages/startPage.dart';

class payment_status extends StatefulWidget {
  const payment_status({Key key}) : super(key: key);

  @override
  _payment_statusState createState() => _payment_statusState();
}

class _payment_statusState extends State<payment_status> {
  Future<void> getToken(Map pat_data) async {
    Map<String, dynamic> post_data = {
      "clinic_id": "12345",
      "patient_id": "${pat_data['patient_Id']}",
      "doctor_id": "5437"
    };
    http.Response token_data = await http.post(
        'http://54.87.169.52:5000/token_admin',
        body: jsonEncode(post_data),
        headers: {
          "content-type": "application/json",
          "Access-Control-Allow-Origin":
              "*", // Required for CORS support to work
          "Access-Control-Allow-Credentials":
              "true", // Required for cookies, authorization headers with HTTPS
          "Access-Control-Allow-Headers":
              "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
          "Access-Control-Allow-Methods": "POST, OPTIONS"
        });
    var token = jsonDecode(token_data.body);
    print(token);
    //return token['channelName'];
  }

  @override
  Widget build(BuildContext context) {
    Map pat_data = ModalRoute.of(context).settings.arguments;
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'payment status',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Card(
            child: Container(
              height: hight * 0.3,
              width: width * 1,
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    '${pat_data[7]}rs',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'collect cash from ${pat_data[9]}rs',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
          ),
          RaisedButton(
            padding: EdgeInsets.all(13),
            color: Colors.green,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            onPressed: () async {
              getToken(pat_data).then((value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => notify(),
                    fullscreenDialog: true,
                    //settings: RouteSettings(arguments: getToken(pat_data))
                  )));
            },
            child: Text(
              'Done',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
