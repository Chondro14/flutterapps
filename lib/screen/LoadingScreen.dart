import 'package:appweather/screen/LocationScreen.dart';
import 'package:appweather/services/weather.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

double latitude;
double longitude;
AnimationController controller;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationweaather: weatherData,
      );
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initstate called');
    getLocationData();
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactive called');
  }

  @override
  Widget build(BuildContext context) {
    print('Build widget called');

    return Scaffold(
      body: Center(
        child: SpinKitFadingFour(
          color: Colors.blue[900],
          size: 100.0,
          duration: Duration(milliseconds: 950),
        ),
      ),
    );
  }
}
