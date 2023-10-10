// import 'api_constants.dart';
//
// class ApiService {
//   Future<List<dynamic>?> getCurrentWeather() async {
//     try {
//       var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
//       var response = await http.get(url);
//       if (response.statusCode == 200) {
//         // List<dynamic> _model = userModelFromJson(response.body);
//         return _model;
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//   }
