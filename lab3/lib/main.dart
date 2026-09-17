import 'exercise2/user_repository.dart';

Future<void> main() async {
  print('===== EXERCISE 2 =====');

  final repository = UserRepository();

  final users = await repository.fetchUsers();

  for (final user in users) {
    print(user);
  }
}