/*
bool anyUserUnder18(Iterable<User> users) {
  TO.DO('Implement this method');
}

bool everyUserOver13(Iterable<User> users) {
  TO.DO('Implement this method');
}
*/
bool anyUserUnder18(Iterable<User> users) {
  return users.any((user) => user.age < 18);
}

bool everyUserOver13(Iterable<User> users) {
  return users.every((user) => user.age > 13);
}

class User {
  String name;
  int age;

  User(
    this.name,
    this.age,
  );
}
