void main() {
  Future(funcThatThrows)
      // Future completes with an error:
      .then((int _) => print(''))
      .catchError(handleError)
      .whenComplete(whenComplete); // Future completes with someObject
}

int funcThatThrows() {
  print('funcThatThrows:: I will throw an Exception');
  throw Exception({'source': 'funcThatThrows', 'throw': false});
  //return 5;
}

void whenComplete() {
  print('funcWhenComplete:: Reaches here');
}

handleError(_) {
  print('handleError:: I am in');
}
