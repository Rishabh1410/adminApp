import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> _data = SharedPreferences.getInstance();

bool isloggedin = false;

Future<void> init(String key, String value) async {
  final SharedPreferences data = await _data;
  data.setString(key, value).then((a) => print("done"));
  isloggedin = true;
}

getData(String key) async {
  final SharedPreferences data = await _data;
  return data.getString('$key');
}

del_data(String key) async {
  final SharedPreferences data = await _data;
  data.setString(key, null);
  print(await data.getString('$key'));
  isloggedin = false;
}
