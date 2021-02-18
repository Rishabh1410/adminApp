import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:teledoc_admin/pages/patient_list.dart';
import 'package:teledoc_admin/auth_pages/reg.dart';
import 'package:teledoc_admin/main.dart';

bool isloggedin;

class login_page extends StatefulWidget {
  login_page({Key key}) : super(key: key);

  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  TextEditingController phone_num = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future<String> authentication(dynamic phone_num) async {
    Map<String, dynamic> post_data = {'phone_number': '$phone_num'};
    http.Response check = await http.post(
        'http://54.87.169.52:5000/getAdminDetails',
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
    var auth_data = jsonDecode(check.body);
    print(auth_data[0][4].toString());
    return auth_data[0][4].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 1,
          child: Form(
            child: ListView(
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  'Sign in',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 100,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: phone_num,
                  decoration: InputDecoration(
                      // border: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(30)),
                      labelText: "mobile number"),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: pass,
                  decoration: InputDecoration(
                      // border: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(30)),
                      labelText: "password"),
                ),
                SizedBox(
                  height: 40,
                ),
                // FutureBuilder(
                //   future: authentication(doc_Id.text),
                //   builder: (BuildContext context, AsyncSnapshot snapshot) =>
                RaisedButton(
                    padding: EdgeInsets.all(15),
                    color: Colors.green,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    onPressed: () {
                      //init('phone_number', '${phone_num.text}');
                      Future<String> auth = authentication(phone_num.text);
                      auth.then((value) {
                        if (value == pass.text) {
                          print('1');
                          // SharedPreferences pref =
                          //     await SharedPreferences.getInstance();
                          pref.setString('phone_num', '${phone_num.text}');
                          //init('phone_num', phone_num.text);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Pat_list(),
                                  fullscreenDialog: true));
                        } else if (value == null) {
                          print('2');
                          AlertDialog(
                            title: Text('sorry you have no '),
                          );
                        } else {
                          print('3');
                          AlertDialog(
                            title: Text(
                              'wrong Id or Password',
                              style: TextStyle(fontSize: 20),
                            ),
                          );
                        }
                      });
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )),
                //),
                GestureDetector(
                    child: Text(
                      'new user? register',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Admin_Registration(),
                              fullscreenDialog: true));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
