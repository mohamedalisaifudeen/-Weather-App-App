import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'front.dart';
import 'weather.dart';
void main(){
  runApp(Data());
}


class Data extends StatefulWidget {

  const Data({super.key});

  @override
  State<Data> createState() => _DataState();

}

class _DataState extends State<Data> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


  void getLocation()async{
    String dta=await Weather().getWeather();
    // Within the `FirstRoute` widget:
    navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (context) => First(data: dta)),
    );


  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();

  }

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      navigatorKey: navigatorKey,
      home: Scaffold(
        body:Container(
          color:Colors.black54,
          child: Center(
            child: SpinKitWanderingCubes(
              color: Colors.grey,
              size: 50.0,
            ),
          ),
        )
      ),
    );
  }
}

