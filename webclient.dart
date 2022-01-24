import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print('Request');
   print('url: {$data.requestUrl}');
   print('headers: ${data.headers}');
   print('body: ${data.body}');

   return data;
  }

  @override //terminar o código
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print('response');
    print('Status code: ${data.statusCode}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }

}

void findAll() async {
  final InterceptedClient client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  var url = Uri.parse('http://10.0.11.35:8080/transactions');
  var response = await http.post(url);
  print(response.body);


}
