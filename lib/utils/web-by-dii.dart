import 'package:http/http.dart' as http;

const BASE_URL_FILE = 'https://media.actu221.net/';

const BASE_URL_API = 'https://apiactu221.actu221.net/api/v1/';

class WebByDii {
  static get({required String url}) async {
    String v = BASE_URL_API + url;
    Uri url1 = Uri.parse(v);
    return http.get(url1).then((success) => success);
  }
}
