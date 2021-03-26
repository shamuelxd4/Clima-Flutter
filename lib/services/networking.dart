import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  Networking(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      //String data = response.body;
      return jsonDecode(response.body.toString());
      //weather->id, main->temp, name

    } else {
      print(response.statusCode);
    }
  }
}
