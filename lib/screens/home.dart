
import 'package:flutter/material.dart';
import 'package:weather_app/apihelper/api_service.dart';
import 'package:weather_app/model/apimodal.dart';
String Cname='cairo';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 List<WeatherModal>daystemp=[];

  TextEditingController country=TextEditingController();
  ApiClient client=ApiClient();
  WeatherModal? data;
  Future<void>getdata()async{
   data=await client.getcurrentweather('$Cname');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      backgroundColor: Color(0xff3d63af),
      body:FutureBuilder(
        future:getdata() ,
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 80,),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(

                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter City Name',
                            labelText: 'city'
                          ),
                          controller: country,
                          onSubmitted: (newcity)async{
                            setState(() {
                              Cname=newcity;
                            });

                          },
                        ),
                      ),

          /* Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                        //  SizedBox(width:MediaQuery.of(context).size.width*1/3,),
                         // Text('${data!.countryname}'),
                         /* TextField(
                            controller: country,
                            onChanged: (String newname){
                              country.text=newname;
                            },
                          ),*/
                    //      SizedBox(width:MediaQuery.of(context).size.width*1/3),
                       /*   Container(
                              height: 40,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomRight: Radius.circular(25)),),
                              child: Center(child: Text('Search',
                                style: TextStyle(color: Colors.white,fontWeight:FontWeight.w500),))),*/
                        ],
                      ),*/

                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)

                      ),
                    ),
                  ),
                  SizedBox(height: 60,),
                  Text('${data!.countryname}',style: TextStyle(fontSize: 42,letterSpacing: 1.5,color: Colors.white),),
                  SizedBox(height: 20,),
                  Image.network(
                      'http://openweathermap.org/img/w/${data!.icon}.png',

                  ),

                  //"http://openweathermap.org/img/w/" + string icon from api +".png"
                  SizedBox(height: 20,),
                  Text('${data!.temp}',style: TextStyle(fontSize: 42,color: Colors.white)),
                  SizedBox(height: 8,),
                  Text('H:${data!.maxtemp}  L:${data!.mintemp}',style: TextStyle(color: Colors.white),),
                  SizedBox(height: 20,),

                 /* data.daysfromnow.forEach((element) {

                  }),*/
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child:
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customcontainer(day: data!.daysfromnow![0],stateurl: data!.days_icon![0],degree: data!.days_temp![0]),
                          customcontainer(day: data!.daysfromnow![1],stateurl: data!.days_icon![1],degree: data!.days_temp![9]),
                          customcontainer(day: data!.daysfromnow![2],stateurl: data!.days_icon![2],degree: data!.days_temp![18]),
                          customcontainer(day: data!.daysfromnow![3],stateurl: data!.days_icon![3],degree: data!.days_temp![25]),
                          customcontainer(day: data!.daysfromnow![4],stateurl: data!.days_icon![4],degree: data!.days_temp![38]),
                        ],
                      ),
                    ),
                  ),


                ],
              ),
            );
          }
          return Center(
              child: CircularProgressIndicator()
          );
        },
      ),

      /*
*/
    ),
    );
  }
}
Widget customcontainer({String day='Fri' ,String degree='25',String? stateurl,}){
  return Card(
    shadowColor:Colors.blue,
    color:Color(0xff3d63af).withOpacity(0.8),
    elevation: 10,
    child: Expanded(
      child: Container(
        width: 90,
        height: 140,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text('$day',style: TextStyle(fontSize: 22,letterSpacing: 1.5,color: Colors.white),),
              SizedBox(height: 5,),
              Image.network(
                'http://openweathermap.org/img/w/${stateurl}.png',

              ),
              SizedBox(height: 5,),
              Text('$degree',style: TextStyle(fontSize: 18,color: Colors.white)),
            ],
          ),
        ),

      ),
    ),
  );
}
