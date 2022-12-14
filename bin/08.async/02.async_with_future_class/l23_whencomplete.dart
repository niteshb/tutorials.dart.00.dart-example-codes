// https://dart.dev/guides/libraries/futures-error-handling#errors-originating-within-whencomplete
// Errors originating within whenComplete()
// If whenComplete()’s callback throws an error, then whenComplete()’s
// Future completes with that error:

void main() {
  Future(funcThatThrows)
      // Future completes with a value if 'handleError1' doesn't throw
      .catchError(handleError1)
      // Future completes with an error:
      .whenComplete(whenCompleteThatThrows)
      // Error generated by whenComplete is handled:
      .catchError(handleError2);
}

int funcThatThrows() {
  print('funcThatThrows:: I will throw an Exception');
  throw Exception({'source': 'funcThatThrows'});
  //return 5;
}

int handleError1(Object err) {
  print('handleError1:: I am in');
  print('      $err');

  //throw Exception({'source': 'handleError1'});
  return 55;
}

void whenCompleteThatThrows() {
  print('whenComplete:: I am in');
  throw Exception({'source': 'whenComplete'});
}

int handleError2(Object err) {
  print('handleError2:: I am in');
  print('      $err');
  return 66;
}
