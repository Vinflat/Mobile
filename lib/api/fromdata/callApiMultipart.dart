import 'package:auth_ui/api/api_url.dart';
import 'package:http/http.dart' as http;

Future<dynamic> callApiMultipart(String uri, String method,
    {Map<String, String>? header,
    Map<String, dynamic>? queryParams,
    Map<String, String>? bodyParams}) async {
  try {
    late http.MultipartRequest request;
    var url = ApiUrl.scheme + "://" + ApiUrl.host + "/" + uri;
    switch (method) {
      case "get":
        request = http.MultipartRequest(method.toLowerCase(), Uri.parse(url));
        break;
      default:
        request = http.MultipartRequest(
          method.toUpperCase(),
          Uri.parse(url),
        );
        request.fields.addAll(bodyParams!);
        break;
    }
    var respone = await request.send();

    final statusCode = respone.statusCode;
    final String body = respone.reasonPhrase ?? "";

    if (respone.statusCode < 200 || respone.statusCode >= 300) {
      throw Exception("Error request: $statusCode");
    }
    return body;
  } on Exception catch (ex) {
    throw Exception(ex.toString());
  }
}
