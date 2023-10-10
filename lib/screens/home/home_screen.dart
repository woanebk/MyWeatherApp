import 'package:flutter/material.dart';
import 'package:my_weather_app/data/api/weather_api_service.dart';
import 'package:my_weather_app/screens/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherApiService _weatherApiService = WeatherApiService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          _buildBackground(),
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              children: [JumpingLocationIcon()],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBackground() => Container(
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
      );

  void _fetchCurrentWeather() async {
    try {
      var res =
          await _weatherApiService.getCurrentWeather(search: 'Ho Chi Minh');
      print(res);
    } catch (e) {
    } finally {}
  }
}
