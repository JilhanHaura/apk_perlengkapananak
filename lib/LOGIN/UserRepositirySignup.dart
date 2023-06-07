import 'dart:convert';
import 'package:http/http.dart' as http;

class UserRepositorySignup {
  String baseUrl = 'https://jilhan.000webhostapp.com/signup_account.php';

  Future<bool> registerUser(
      String username, String password, String email, String status) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      body: {
        'action': 'register',
        'username': username,
        'password': password,
        'email': email,
        'status': status,
      },
    );

    if (response.statusCode == 200) {
      return response.body == 'true';
    } else {
      throw Exception('Failed to register user.');
    }
  }

  Future<bool> checkEmailDuplicate(String email) async {
    final response = await http.get(
      Uri.parse(
          "https://jilhan.000webhostapp.com/cekEmail_Account.php?email=$email"),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['is_duplicate'];
    }

    return false;
  }

  bool isGmailEmail(String email) {
    return email.endsWith('@gmail.com');
  }
}
