import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:teledoc_admin/auth_pages/bankDetails.dart';

class Admin_Registration extends StatefulWidget {
  Admin_Registration({Key key}) : super(key: key);

  @override
  _Admin_RegistrationState createState() => _Admin_RegistrationState();
}

class _Admin_RegistrationState extends State<Admin_Registration> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Map create_map() {
    Map<String, dynamic> data = {
      'first_name': fstName_controller.text,
      'last_name': lstName_controller.text,
      'phone_number': phone_num_controller.text,
      'home_address': address_controller.text,
      'password': password_controller.text,
    };
    print(data);
    return data;
  }

  TextEditingController fstName_controller,
      lstName_controller,
      address_controller,
      phone_num_controller,
      password_controller;

  void initState() {
    super.initState();
    fstName_controller = TextEditingController();
    lstName_controller = TextEditingController();
    address_controller = TextEditingController();
    phone_num_controller = TextEditingController();
    password_controller = TextEditingController();
  }

  void dispose() {
    fstName_controller.dispose();
    lstName_controller.dispose();
    address_controller.dispose();
    phone_num_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Form(
              autovalidateMode: AutovalidateMode.always,
              //autovalidate: true,
              key: formkey,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    'Create Profile',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: fstName_controller,
                    decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //     borderRadius: BorderRadius.circular(30)),
                        labelText: "first name"),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: lstName_controller,
                    decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //     borderRadius: BorderRadius.circular(30)),
                        labelText: "last name"),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    //initialValue: '+91',
                    controller: phone_num_controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //     borderRadius: BorderRadius.circular(30)),
                        labelText: "phone number"),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: address_controller,
                    decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //     borderRadius: BorderRadius.circular(30)),
                        labelText: "home address"),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: password_controller,
                    decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //     borderRadius: BorderRadius.circular(30)),
                        labelText: "password"),
                  ),
                  SizedBox(
                    height: 25,
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
                          'Terms & conditions',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  RaisedButton(
                    child: Text(
                      'Proceed',
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
                    elevation: 0,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Bank_details(),
                              settings:
                                  RouteSettings(arguments: create_map())));
                    },
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
