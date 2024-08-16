import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    late String cityName;
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.black12,
          elevation: 0,
          title: TextButton(
            child: Icon(
                Icons.arrow_back,
              size: 40,
              color: Colors.white,
              grade: 12,
            ),
            onPressed: (){
              Navigator.pop(context);
        },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/city.jpg'),
              fit: BoxFit.cover,
            ),

          ),

          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(
                          Icons.location_city,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 200,
                        child: TextField(
                          onChanged: (val){
                            cityName=val;
                          },
                          style: TextStyle(
                            fontSize: 25,
                            decorationThickness: 0,

                          ),
                          autocorrect: true,
                          decoration: InputDecoration(
                            hintText: "Enter a city",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(15),
                                borderSide: BorderSide(style: BorderStyle.solid,color: Colors.deepOrange)

                            )

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: TextButton(
                      onPressed: (){
                        Navigator.pop(context,cityName);
                      },
                      child: Text(
                          "Get Weather",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )

        ),
      ),
    );
  }
}
