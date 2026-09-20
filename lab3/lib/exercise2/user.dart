class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        email = json["email"];

  @override
  String toString() {
    return 'User(name: $name, email: $email)';
  }
}