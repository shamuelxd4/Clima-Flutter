import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  Networking(this.url);

  final String url;

  Future getData() async {
    // var uri = Uri.https('api.openweathermap.org','api.openweathermap.org/data/2.5/weather', {'q': '{http}'});
    var uri = Uri.parse(url);

    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      //String data = response.body;
      return jsonDecode(response.body.toString());
      //weather->id, main->temp, name

    } else {
      print(response.statusCode);
    }
  }
}
