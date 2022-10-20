/*
Use where() to implement two functions:

Part 1: Implement filterOutUnder21().
  Return an Iterable containing all users of age 21 or more.
Part 2: Implement findShortNamed().
  Return an Iterable containing all users with names of length 3 or less.

Iterable<User> filterOutUnder21(Iterable<User> users) {
  TO.DO('Implement this method');
}

Iterable<User> findShortNamed(Iterable<User> users) {
  TO.DO('Implement this method');
}

*/

Iterable<User> filterOutUnder21(Iterable<User> users) {
  return users.where((user) => user.age >= 21);
}

Iterable<User> findShortNamed(Iterable<User> users) {
  return users.where((user) => user.name.length <= 3);
}

class User {
  String name;
  int age;

  User(
    this.name,
    this.age,
  );
}
