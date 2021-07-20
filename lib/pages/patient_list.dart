import 'package:flutter/material.dart';
import 'package:teledoc_admin/main.dart';
import 'package:teledoc_admin/pages/firstpage.dart';
import 'package:teledoc_admin/pages/payment_status.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:teledoc_admin/shared_pref/shared_pref.dart';
import 'package:teledoc_admin/auth_pages/login.dart';

class Pat_list extends StatefulWidget {
  Pat_list({Key key}) : super(key: key);

  @override
  _Pat_listState createState() => _Pat_listState();
}

class _Pat_listState extends State<Pat_list> {
  ScrollController scroller = ScrollController();

  Future<dynamic> get_list() async {
    Map data = {"clinic_id": "1234"};
    http.Response response = await http.post(
        'http://54.162.56.164:5000/patient_clinic_details',
        body: jsonEncode(data),
        headers: {"content-type": "application/json"});
    // if (response.statusCode == 201) {
    //   print(jsonDecode(response.body));
    //   return jsonDecode(response.body);
    // } else {
    //   throw Exception('failed to upload data');
    // }
    var list = jsonDecode(response.body);
    print(list['result']);
    return list['result'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Patient List',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        ),
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      //app drawer started
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              child: Stack(children: [
                Image(
                  image: AssetImage("assets/images/doc.jpg"),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 160, 10, 1),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundImage: AssetImage('assets/images/doc.jpg'),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'name',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                )
              ]),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.money_off,
                color: Colors.yellowAccent,
              ),
              title: Text(
                'earnings',
                style: TextStyle(fontSize: 15),
              ),
              trailing: Text(
                '4000rs',
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.person,
                color: Colors.greenAccent,
              ),
              title: Text(
                'make appointment',
                style: TextStyle(fontSize: 15),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.settings,
                color: Colors.grey,
              ),
              title: Text(
                'setting',
                style: TextStyle(fontSize: 15),
              ),
            ),
            ListTile(
              onTap: () {
                pref.remove('phone_num');
                //del_data('phone_num');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => first_page()));
              },
              leading: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              title: Text(
                'Logout',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),

      //app drawer end
      body: FutureBuilder(
        future: get_list(),
        //initialData: Text('loading....'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Text('loading...');
          }

          return ListView.builder(
              padding: EdgeInsets.only(top: 4),
              controller: scroller,
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ListTile(
                      tileColor: Colors.white,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => payment_status(),
                                settings: RouteSettings(arguments: {
                                  "doctor_Id": "${snapshot.data[index][0]}",
                                  "patient_Id": "${snapshot.data[index][1]}"
                                })));
                      },
                      title: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text('${snapshot.data[index][7]}'),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                            'Expected Arrival today ${snapshot.data[index][6]}'),
                      ),
                      trailing: Column(
                        children: [],
                      )),
                );
              });
        },
      ),
    );
  }
}
