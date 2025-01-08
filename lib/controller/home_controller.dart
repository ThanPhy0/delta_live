import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeController {
  final String apiUrl =
      'https://football-live-stream-api.p.rapidapi.com/all-match'; // Replace with your RapidAPI endpoint
  final String apiHost =
      'football-live-stream-api.p.rapidapi.com'; // Replace with your API Host
  final String apiKey = "0cbe2fe8aemshf77498017449cddp16bc40jsn1c9c45a3de00";

  Future<List<dynamic>> fetchMatches() async {
    final headers = {
      'Content-Type': 'application/json',
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': apiHost,
    };

    try {
      final response = await http.get(Uri.parse(apiUrl), headers: headers);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['result']; // Adjust based on your API response structure
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
