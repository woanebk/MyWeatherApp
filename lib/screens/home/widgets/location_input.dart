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
              : Text(
                  'Enter location',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                )
        ],
      ),
    );
  }
}
