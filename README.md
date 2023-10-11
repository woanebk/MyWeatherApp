# my_weather_app

A weather application

## Getting Started

This project was written on Flutter SDK 3.7.11

How to run this project:
1. Ensure that everything is prepared: https://docs.flutter.dev/get-started/install
2. Download Flutter SDK version 3.7.11 stable
3. Clone this project and check out to the "master" branch
4. Open terminal bash and run "flutter pub get"
5. Start Android Studio and run the app with a virtual or physical device. And you're good to go

Note*: I was using a free weather API available at https://www.weatherapi.com/. My trial period will end on October 24, 2023. The app will stop working properly after that set period of time. If you plan to use the app in the future, I advise obtaining an API key from their official website and replacing API_KEY in the.env file in the project's root folder with the desired API key before installing the application.

Features:
- Location input:  It could be the following:
Latitude and Longitude (Decimal degree) e.g: 48.8567,2.3508
city name e.g.: Paris
US zip e.g.: 10001
UK postcode e.g: SW1
Canada postal code e.g: G2J
metar:<metar code> e.g: metar:EGLL
iata:<3 digit airport code> e.g: iata:DXB
auto:ip IP lookup e.g: auto:ip
IP address (IPv4 and IPv6 supported) e.g: 100.0.0.1

- Weather display: the app fetches and displays current weather: humidity, wind speed, cloud, UV, celsius degree, and a description (like "cloudy" or "sunny")
- Error handling for cases where the app cannot get the weather data or places cannot be found,...
- Bonus feature:
  Today's weather forecast: Whenever users search for a place, the app will also get the predicted weather for some specific time on that day.
  Autocomplete search: The app suggests matching cities and towns based on user input.


A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
