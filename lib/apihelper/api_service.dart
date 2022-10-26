import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:weather_app/model/apimodal.dart';
class ApiClient{
Future<WeatherModal>? getcurrentweather(String location)async{
  var endpoint= await Uri.parse(
      "https://api.openweathermap.org/data/2.5/forecast?q=$location&appid=0127f5a735ed6cabd11a10c20d68c011&units=metric");
   var response= await http.get(endpoint);
   Map<String,dynamic> body=await jsonDecode(response.body);

   print('${WeatherModal.fromJson(body).countryname}');


   return WeatherModal.fromJson(body);

}
}