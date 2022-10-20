/*
In this exercise, your code takes an Iterable of User, and you need to return an 
Iterable that contains strings containing each user’s name and age.

Each string in the Iterable must follow this format: '{name} is {age}'—for 
example 'Alice is 21'.

Iterable<String> getNameAndAges(Iterable<User> users) {
  TO.DO('Implement this method');
}
*/

Iterable<String> getNameAndAges(Iterable<User> users) {
  return users.map(
    (user) => '${user.name} is ${user.age}',
  );
}

class User {
  String name;
  int age;

  User(
    this.name,
    this.age,
  );
}

void main(List<String> args) {
  Iterable<User> users = [
    User('nitesh', 40),
    User('swati', 38),
    User('adrija', 12),
    User('rahini', 3)
  ];
  Iterable<String> istr = getNameAndAges(users);
  istr.forEach(print);
}
