import 'package:abohawabid/screens/location_screen.dart';
import 'package:abohawabid/services/location.dart';
import 'package:abohawabid/services/networking.dart';
import 'package:abohawabid/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longitude;
  double latitude;

  @override
  void initState() {
    super.initState();
    print('init started');
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    longitude = location.longitude;
    latitude = location.latitude;

    print('hello from getLocationData');

    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey&units=metric');

    var weatherData = await networkHelper.getWeatherData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
    }));
    // double temp = decodedData['main']['temp'];
    // int condition = decodedData['weather'][0]['id'];
    // String cityName = decodedData['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
