import 'package:flutter/material.dart';
import 'package:my_weather_app/data/api/weather_api_service.dart';
import 'package:my_weather_app/data/models/autocorrect_model.dart';
import 'package:my_weather_app/screens/home/widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final WeatherApiService _weatherApiService = WeatherApiService();

  List<AutocorrectModel> _suggestions = [];

  final _searchController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            _buildBackground(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 90, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Where are you looking for ?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  _buildSearchBar(),
                  _buildListSuggestions()
                ],
              ),
            ),
          ],
        ),
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
      );

  Widget _buildSearchBar() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
        child: TextField(
          controller: _searchController,
          onChanged: (value) {
            _fetchSuggestions(value);
          },
          onSubmitted: (value) {
            Navigator.of(context).pop(value);
          },
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            filled: true,
            fillColor: Colors.white.withOpacity(0.2),
            hintText: 'Search for a location',
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 16.0,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(28.0),
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
      );

  Widget _buildListSuggestions() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: _suggestions.take(7).map((e) {
          var index = _suggestions.indexOf(e);
          return InkWell(
            onTap: () {
              Navigator.of(context).pop(e.name ?? '');
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(28.0),
              ),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 8, left: (index + 1) * 18),
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 12,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_city_outlined,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: Text(
                    '${e.name ?? ''}, ${e.country ?? ''}',
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ))
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  void _fetchSuggestions(String text) async {
    try {
      var res = await _weatherApiService.searchPlaces(search: text);
      if (res != null) {
        setState(() {
          _suggestions = res;
        });
      }
    } catch (e) {
      // Do nothing
    } finally {}
  }
}
