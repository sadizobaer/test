
import 'package:http/http.dart' as http;

class ApiRepository {

  Future getAlbums() async {
    Map<String, String> header = new Map();
    header["Accept"] = "application/json";
    header["Content-Type"] = "application/json";

    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/albums');

    final response = await http.get(uri,
        headers: header
    );

    return response;
  }

  Future getPhotos() async {
    Map<String, String> header = new Map();
    header["Accept"] = "application/json";
    header["Content-Type"] = "application/json";

    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');

    final response = await http.get(uri,
        headers: header
    );

    return response;
  }

}
