import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class APIHelper{
  APIHelper._();    //private named constructor
  static final APIHelper apiHelper = APIHelper._();

  Future<weatherModel?> fetchweather(String locationame)async{
    String baseurl = "http://api.weatherapi.com/v1/forecast.json?key=23b1374546d944998b244532232205&q=$locationame&aqi=no";
    http.Response res = await http.get(Uri.parse(baseurl));
    if(res.statusCode == 200){
      String data = res.body;
      Map<String,dynamic>  decoddata = jsonDecode(data);
      weatherModel weatherdata = weatherModel.fromMap(data: decoddata);
      return weatherdata;
    }
  }
}


