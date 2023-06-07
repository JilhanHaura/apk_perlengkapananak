import 'package:http/http.dart' as http;

class UserRepository {
  static const String baseUrl =
      'https://jilhan.000webhostapp.com/login_account.php';

  Future<bool> authenticateUser(String username, String password) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      body: {
        'action': 'authenticate',
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return response.body == 'true';
    } else {
      throw Exception('Failed to authenticate user.');
    }
  }

  Future<String?> getUserStatus(String username) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      body: {
        'action': 'get_status',
        'username': username,
      },
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to get user status.');
    }
  }
}
