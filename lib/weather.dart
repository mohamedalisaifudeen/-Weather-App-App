import 'network.dart';
import 'location.dart';
class Weather{

  Future<String> cityData(cityName)async{
    Network network=await Network(url: "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=a42c657a939540fdad99dc20b38fd0df");
    return network.getData();
  }

  Future<String> getWeather()async{
    Location location=Location();
    await location.getLocation();
    dynamic lat=location.latitude;
    dynamic lon=location.longatude;
    Network network=Network(url: 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=a42c657a939540fdad99dc20b38fd0df');

    return await network.getData();
  }

  String weatherIcon(int condition){
    if(condition<300){
      return "🌧️";
    }else if(condition<400){
      return "🌦️";
    }else if(condition<600){
      return "☔";
    }else if(condition<700){
      return "☔";
    }else if(condition<800){
      return "🌁";
    }else if(condition==800){
      return "☀️";
    }else if(condition<=804){
      return "☁️";
    }else{
      return "🤷‍♀️";
    }
  }

  String getMessage(var temp){
    if(temp>25){
      return "It's 🍦 time in";
    }else if(temp>20){
      return "Time for shorts and 👕 in";
    }else if(temp<10){
      return "You will need 🧥 and 🧤 in";
    }else {
      return "Bring a 🧥 just in case";
    }
  }
}