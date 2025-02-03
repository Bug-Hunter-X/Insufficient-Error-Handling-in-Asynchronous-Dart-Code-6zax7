```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData;
    } else if (response.statusCode == 404) {
      throw Exception('Data not found (404)');
    } else if (response.statusCode == 500) {
      throw Exception('Server error (500)');
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } on FormatException catch (e) {
    print('Invalid JSON format: $e');
    return null; // Or throw a custom exception
  } on SocketException catch (e) {
    print('Network error: $e');
    return null; // Or handle appropriately
  } catch (e) {
    print('An unexpected error occurred: $e');
    rethrow; 
  }
}
```