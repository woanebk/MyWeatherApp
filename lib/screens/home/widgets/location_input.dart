import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_weather_app/screens/widgets/widgets.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, this.city, this.country, this.onTap});
  final String? city;
  final String? country;
  final void Function()? onTap;

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Hero(
        tag: 'search',
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            JumpingLocationIcon(),
            const SizedBox(width: 4),
            (widget.country != null && widget.city != null)
                ? Row(
                    children: [
                      Text(
                        widget.city!,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const Text(
                        ',',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        ' ${widget.country}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  )
                : Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Row(
                      children: [
                        Text(
                          'Enter location',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: 20,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
