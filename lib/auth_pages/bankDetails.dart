import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:teledoc_admin/auth_pages/login.dart';

class Bank_details extends StatefulWidget {
  Bank_details({Key key}) : super(key: key);

  @override
  _Bank_detailsState createState() => _Bank_detailsState();
}

class _Bank_detailsState extends State<Bank_details> {
  Map create_map(Map<String, dynamic> profile) {
    Map<String, dynamic> bank = {
      'bank_name': bank_controller.text,
      'acc_no': accountNum_controller.text,
      'ifsc_code': ifsc_controller.text,
      'acc_name': accName_controller.text
    };
    Map<String, dynamic> data = {};
    data.addAll(profile);
    data.addAll(bank);
    print(data);
    return data;
  }

  TextEditingController bank_controller,
      accountNum_controller,
      ifsc_controller,
      accName_controller;

  void initState() {
    super.initState();
    bank_controller = TextEditingController();
    accountNum_controller = TextEditingController();
    ifsc_controller = TextEditingController();
    accName_controller = TextEditingController();
  }

  Future<void> create_post(Map<String, dynamic> data) async {
    http.Response response = await http.post(
        'http://54.87.169.52:5000/create_profile',
        body: jsonEncode(data),
        headers: {"content-type": "application/json"});
    if (response.statusCode == 201) {
      print(json.decode(response.body));
    } else {
      throw Exception('failed to upload data');
    }
  }

  void dispose() {
    bank_controller.dispose();
    accountNum_controller.dispose();
    ifsc_controller.dispose();
    accName_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> profile = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Bank detail',
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: bank_controller,
                decoration: InputDecoration(
                    // border: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(30)),
                    labelText: "bank name"),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: accountNum_controller,
                decoration: InputDecoration(
                    // border: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(30)),
                    labelText: "account num"),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                //initialValue: '+91',
                controller: ifsc_controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    // border: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(30)),
                    labelText: "IFSC code"),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: accName_controller,
                decoration: InputDecoration(
                    //fillColor: Colors.green,
                    // border: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(30)),
                    labelText: "account holder name"),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'By continuing, I confirm that i have read & agree to the',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onLongPress: () {},
                    child: Text(
                      'Terms & conditions',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  Text(
                    ' and ',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                  GestureDetector(
                    onLongPress: () {},
                    child: Text(
                      'Privacy policy',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                elevation: 0,
                child: Text(
                  'Register',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 16),
                ),
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                color: Colors.green,
                onPressed: () {
                  print(profile);
                  create_post(create_map(profile));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => login_page()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
