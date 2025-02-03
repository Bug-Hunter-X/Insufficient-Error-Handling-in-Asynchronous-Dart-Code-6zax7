```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Correctly handle the response here, avoid potential errors
      final jsonData = jsonDecode(response.body);
      // Process jsonData
    } else {
      // Handle non-200 status codes appropriately
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions comprehensively
    print('Error fetching data: $e');
    // Consider rethrowing or other actions based on your app's logic
    rethrow; // Rethrow to allow higher-level handling if needed
  }
}
```