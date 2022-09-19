import 'package:food_recipes/strings.dart';
import 'package:http/http.dart' as http;

class API_Manager {
  void getdata() async {
    var client = http.Client();
    var response = await client.get(Uri.parse(Strings.food_url));
    if (response.statusCode == 200) {
      var jsonString = response.body;
    }
  }
}
