import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_weather_app/data/api/weather_api_service.dart';
import 'package:my_weather_app/data/models/hour_model.dart';
import 'package:my_weather_app/data/models/weather_model.dart';
import 'package:my_weather_app/screens/home/widgets/widgets.dart';
import 'package:my_weather_app/screens/search/search_screen.dart';
import 'package:my_weather_app/screens/widgets/widgets.dart';
import 'package:my_weather_app/utils/lottie_animations.dart';

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
  WeatherModel? _myPositionWeather;
  List<HourModel> _weatherForecast = [];

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
                          onTap: () async {
                            var res = await Navigator.of(context)
                                .push(MaterialPageRoute(
                              builder: (context) => const SearchScreen(),
                            ));
                            if (res != null) {
                              _fetchWeather(search: res);
                              _fetchForecast(search: res);
                            }
                          },
                        ),
                        Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(bottom: 50),
                                child: Column(
                                  children: [
                                    Visibility(
                                        visible: _myPositionWeather
                                                ?.current?.tempC !=
                                            null,
                                        child: Text(
                                          '${_myPositionWeather?.current?.tempC ?? ''}°C',
                                          style: const TextStyle(
                                              fontSize: 70,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        )),
                                    Text(
                                      _myPositionWeather
                                              ?.current?.condition?.text ??
                                          '',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                )),
                            WeatherInfoCard(
                              weather: _myPositionWeather,
                            )
                          ],
                        )
                      ],
                    )),
                Flexible(flex: 1, child: _buildForecastBlock())
              ],
            ),
          ),
          Visibility(visible: _isLoading, child: const LoadingOverlay())
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
            child: Lottie.asset(LottieAnimations.mainIdle,
                height: 200, width: 200)),
      );

  Widget _buildForecastBlock() {
    if (_weatherForecast.isEmpty) return Container();
    return Container(
      padding: const EdgeInsets.only(top: 40, left: 32, right: 32, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Today forecast',
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _weatherForecast.map((e) {
              var index = _weatherForecast.indexOf(e);
              if (index == 4 || index == 10 || index == 16 || index == 22) {
                return Column(
                  children: [
                    Image.network('https:${e.condition?.icon ?? ''}'),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      (e.time ?? '').split(' ').last,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '${e.tempC} °C',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                );
              }
              return Container();
            }).toList(),
          )
        ],
      ),
    );
  }

  void _fetchWeather({required String search}) async {
    try {
      setState(() {
        _isLoading = true;
      });

      var res = await _weatherApiService.getCurrentWeather(search: search);
      if (res != null) {
        setState(() {
          _myPositionWeather = res;
        });
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return ErrorOverlay(
            text: e.toString(),
          );
        },
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _fetchForecast({required String search}) async {
    try {
      setState(() {
        _isLoading = true;
      });

      var res = await _weatherApiService.getForecast(search: search);
      if (res?.forecast?.forecastday != null &&
          res!.forecast!.forecastday!.isNotEmpty) {
        setState(() {
          _weatherForecast = res.forecast!.forecastday!.first.hour ?? [];
        });
      } else {
        throw 'No forecast available';
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return ErrorOverlay(
            text: e.toString(),
          );
        },
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
