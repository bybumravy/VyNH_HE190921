import 'user.dart';

class UserRepository {
  Future<List<User>> fetchUsers() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    List<Map<String, dynamic>> jsonData = [
      {
        'name': 'Vy',
        'email': 'vy@gmail.com',
      },
      {
        'name': 'Chi',
        'email': 'chi@gmail.com',
      },
      {
        'name': 'Phu',
        'email': 'phu@gmail.com',
      },
    ];
    return jsonData
        .map((json) => User.fromJson(json))
        .toList();
  }
}