void main(List<String> args) {}

void func1() {
  throw Exception('Something bad happened.');
}

// You can throw any non-null object
void func2() {
  throw 'Waaaaaaah!';
}
