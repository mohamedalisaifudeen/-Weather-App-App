import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:ffi';

class Network{
  late String url;
  Network({required String this.url});

  Future<String> getData ()async{
    http.Response response= await http.get(Uri.parse(url));
    String data=response.body;
    return data;


  }
}