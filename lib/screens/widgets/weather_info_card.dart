import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_weather_app/data/models/weather_model.dart';
import 'package:my_weather_app/utils/lottie_animations.dart';

class WeatherInfoCard extends StatelessWidget {
  const WeatherInfoCard({super.key, this.weather});
  final WeatherModel? weather;

  @override
  Widget build(BuildContext context) {
    Widget _buildItem(String title, String value, String animation) {
      return Container(
        child: Column(
          children: [
            Lottie.asset(animation, width: 60, height: 60),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              value,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildItem(
              'Humidity',
              '${weather?.current?.humidity?.toStringAsFixed(0) ?? '...'}%',
              LottieAnimations.humid),
          _buildItem(
              'Wind speed',
              '${weather?.current?.humidity?.toStringAsFixed(0) ?? '...'} mph',
              LottieAnimations.whiteWind),
          _buildItem(
              'Cloud',
              '${weather?.current?.cloud?.toStringAsFixed(0) ?? '...'}%',
              LottieAnimations.cloud),
          _buildItem(
              'UV',
              '${weather?.current?.uv?.toStringAsFixed(0) ?? '...'}%',
              LottieAnimations.uv)
        ],
      ),
    );
  }
}
