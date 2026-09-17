import 'user.dart';

class UserRepository {
  Future<List<User>> fetchUsers() async {
    // Simulate API delay.
    await Future.delayed(
      const Duration(seconds: 1),
    );

    // Simulated JSON response.
    final jsonData = [
      {
        'name': 'Alice',
        'email': 'alice@example.com',
      },
      {
        'name': 'Bob',
        'email': 'bob@example.com',
      },
      {
        'name': 'Charlie',
        'email': 'charlie@example.com',
      },
    ];

    // Convert JSON objects into User objects.
    return jsonData
        .map((json) => User.fromJson(json))
        .toList();
  }
}