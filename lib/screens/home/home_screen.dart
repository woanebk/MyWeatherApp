import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_weather_app/data/api/weather_api_service.dart';
import 'package:my_weather_app/data/models/current_weather_model.dart';
import 'package:my_weather_app/screens/home/widgets/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_weather_app/screens/widgets/widgets.dart';
import 'package:my_weather_app/utils/location_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherApiService _weatherApiService = WeatherApiService();

  // Controls:
  bool _isLoading = false;

  // Data:
  CurrentWeatherModel? _myPositionWeather;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          _buildBackground(),
          Container(
            alignment: Alignment.center,
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top + 40),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LocationInput(
                          city: _myPositionWeather?.location?.name,
                          country: _myPositionWeather?.location?.country,
                        ),
                        Column(
                          children: [
                            Container(
                                margin: EdgeInsets.only(bottom: 50),
                                child: Column(
                                  children: [
                                    Text(
                                      '20°C',
                                      style: TextStyle(
                                          fontSize: 70,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'Partly Clpouds',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                )),
                            WeatherInfoCard()
                          ],
                        )
                      ],
                    )),
                Flexible(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 40, left: 32, right: 32, bottom: 16),
                      child: Row(
                        children: [],
                      ),
                    ))
              ],
            ),
          ),
          Visibility(visible: _isLoading, child: LoadingOverlay())
        ],
      ),
    );
  }

  Widget _buildBackground() => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade800, // Darker shade of blue
              Colors.black, // Black color
            ],
          ),
        ),
        child: Transform.translate(
            offset: const Offset(0, -100),
            child: Lottie.asset('assets/animations/main_idle.json',
                height: 200, width: 200)),
      );

  void _fetchCurrentWeather() async {
    try {
      setState(() {
        _isLoading = true;
      });
      Position position = await LocationService.determinrPostion();
      var res = await _weatherApiService.getCurrentWeather(
          search: '${position.latitude},${position.longitude}');
      if (res != null) {
        setState(() {
          _myPositionWeather = res;
        });
      }
    } catch (e) {
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
