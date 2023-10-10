import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WeatherInfoCard extends StatelessWidget {
  const WeatherInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _buildItem(String title, String value, String animation) {
      return Container(
        child: Column(
          children: [
            Lottie.asset(animation, width: 60, height: 60),
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              value,
              style: TextStyle(
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
          _buildItem('Humidity', '12%', 'assets/animations/humid.json'),
          _buildItem('Wind mph', '12%', 'assets/animations/white_wind.json'),
          _buildItem('Cloud', '12%', 'assets/animations/cloud.json'),
          _buildItem('UV', '12%', 'assets/animations/uv.json')
        ],
      ),
    );
  }
}
