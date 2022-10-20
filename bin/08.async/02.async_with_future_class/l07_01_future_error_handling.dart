void main() {
  final f = Future(funcThatThrows)
      .then(
        successCallback,
        onError: onError, // handling errors before then()
      )
      .catchError(handleError1); // handling errors from within then()
  print('$f');
  print('Done with main');
}

void funcThatThrows() {
  print('funcThatThrows:: I will throw an Exception');
  throw Exception('funcThatThrows:: ERROR');
}

// void is important here for putting as "onValue" argument in Future.then()
// Dart designers: you are really messed up. Seriously? void?
// removing "_" is compile error: Expected an identifier.
void successCallback(void _) {
  //print('successCallback:: I got an argument "$_"'); // uncommenting this is compile error, so nothing is coming as argument
  print('successCallback:: I can also throw an Exception');
  throw Exception('successCallback:: ERROR');
}

// this has to be "Object". "Exception" won't work
// Dart can send all kind of first arguments seemingly, so much for type-safety
// Even Python doesn't cooks your mind like this
// You will have runtime error if you don't have it this way
void onError(Object e) {
  // handling original error
  print('onError:: Got an error from previous function');
  print('      $e');
  // throwing an error of my own
  print('onError:: I will also throw an Exception');
  throw Exception('onError:: ERROR'); // Oops, new error.
}

// all the three following handlers work for catchError
// In all cases Future f is of type Future<void>
//   that is expected as successCallback returns void
// return type doesn't matter when successCallback returns void
// so much for type-safety
// If you change return type of successCallback to int
// then only handleError2 works
void handleError1(Object err) {
  print('handleError1:: Got an error from previous function');
  print('      $err');
}

int handleError2(Object err) {
  print('handleError2:: Got an error from previous function');
  print('      $err');
  return 1;
}

void Function() handleError3(Object err) {
  print('handleError3:: Got an error from previous function');
  print('      $err');
  return () {};
}
