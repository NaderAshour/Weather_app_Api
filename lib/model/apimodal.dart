import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherModal{
  String? countryname;
  double? temp;
  double? maxtemp;
  double? mintemp;
  String ?icon;
 // String? days_icon;
  List<String>?days_icon=[];
  List<String>?days_temp=[];
  List<String>?daysfromnow=[];
  //String? nextday;

  WeatherModal({
    this.days_icon,
    this.days_temp,
    this.countryname,this.temp,this.maxtemp,this.mintemp,this.icon
   ,this.daysfromnow
  });
  WeatherModal.fromJson(Map<String,dynamic>apimap){
    countryname=apimap['city']['name'];
    temp=apimap['list'][0]['main']['temp'];
    maxtemp=apimap['list'][0]['main']['temp_max'];
    mintemp=apimap['list'][0]['main']['temp_min'];
    icon=apimap['list'][0]['weather'][0]['icon'];

    for( int i=0;i<=39;i++){
      if(!daysfromnow!.contains(apimap['list'][i]['dt_txt'].toString().split(' ').removeAt(0).split('-').removeAt(2))){
        daysfromnow!.add(apimap['list'][i]['dt_txt'].toString().split(' ').removeAt(0).split('-').removeAt(2).toString());
      }
     if(!days_icon!.contains(apimap['list'][i]['weather'][0]['icon'].toString())){
       days_icon!.add(apimap['list'][i]['weather'][0]['icon'].toString());
       print('here is days icon');
     }
     if(!days_temp!.contains(apimap['list'][i]['main']['temp'].toString())){
       days_temp!.add(apimap['list'][i]['main']['temp'].toString());
       print('here is days icon');
     }
    }
    print(daysfromnow);
    print(days_icon.toString());
    print(days_temp!.toString());

    print('5');
  }
  



}