import 'package:lab3/exercise2/user.dart';
import 'package:lab3/exercise2/user_repository.dart';

void main() async {
  UserRepository repository = UserRepository();

  List<User> users = await repository.fetchUsers();

  for (User user in users) {
    print("${user.name} - ${user.email}");
  }
}