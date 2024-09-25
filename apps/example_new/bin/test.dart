import 'package:json/json.dart';

@JsonCodable() // Macro annotation.
class User {
  final int? age;
  final String name;
  final String username;
}

void main() {
  // Given some arbitrary JSON:
  var userJson = {'age': 5, 'name': 'Roger', 'username': 'roger1337'};

  // Use the generated members:
  var user = User.fromJson(userJson);
  print(user);
  print(user.toJson());
}
