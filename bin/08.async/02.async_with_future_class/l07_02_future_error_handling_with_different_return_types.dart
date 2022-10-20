void main() {
  final f = Future.value({'throw': true})
      .then(funcThatThrows)
      .then(
        successCallbackInt,
        onError: onError, // handling errors before then()
      )
      .catchError(handleErrorDouble); // handling errors from within then()
  // Based on return of successCallbackVoid/successCallbackInt
  print('$f'); // Instance of 'Future<double>'
  print('Done with main');
}

int funcThatThrows(Map msg) {
  print('funcThatThrows:: I am in');
  if (msg['throw']) {
    print('funcThatThrows:: I will throw an Exception');
    throw Exception({'source': 'funcThatThrows', 'throw': false});
  }
  return 5;
}

// void is important here for putting as "onValue" argument in Future.then()
// Dart designers: you are really messed up. Seriously? void?
// removing "_" is compile error: Expected an identifier.
// EVEN WHEN PREVIOUS FUNC RETURNS int THIS KEEPS ON WORKING? TYPE SAFETY??
double successCallbackVoid(void _) {
  //print('successCallback:: I got an argument "$_"'); // uncommenting this is compile error, so nothing is coming as argument
  print('successCallback:: I can also throw an Exception');
  throw Exception({'source': 'successCallback', 'throw': false});
}

double successCallbackInt(int i) {
  print('successCallback:: I got an argument "$i"');
  if (i > 10) {
    print('successCallback:: I can also throw an Exception');
    throw Exception({'source': 'successCallback', 'throw': false});
  }
  return 20.22;
}

// this has to be "Object". "Exception" won't work
// Dart can send all kind of first arguments seemingly, so much for type-safety
// Even Python doesn't cooks your mind like this
// You will have runtime error if you don't have it this way

// Wrong return type causes the following Runtime Error
//    Invalid argument(s) (onError): The error handler of Future.then must return a value of the returned future's type

//Function(int, int) onError(Object err) { // Runtime Exception
//void onError(Object err) { // Runtime Exception
double onError(Object err) {
  // handling original error
  print('onError:: Got an error from previous function');
  print('      $err');
  // throwing an Exception of my own
  // if I don't throw any Exception, 'err' is rethrown
  if (shouldThrow(err)) {
    print('onError:: I will also throw an Exception');
    throw Exception({'source': 'onError', 'throw': false}); // Oops, new error.
  }
  //return (int _, int __) {};
  return 15.5;
}

// handleErrorDouble: works perfectly, as expected
// all the rest: compile warning
// handleErrorNum: no runtime error
// handleErrorVoid, handleErrorInt, handleErrorFunction: runtime error
// Queries:
// Why compile warning and not compile error for handleErrorVoid, handleErrorInt, handleErrorFunction?
// Why compile warning for handleErrorNum?
// If handleErrorVoid is not allowed then why is onError allowed? That also returns void
//      Seemingly, this is because catchError is called irrespective of onError call
void handleErrorVoid(Object err) {
  print('handleErrorVoid:: Got an error from previous function');
  print('      $err');
}

int handleErrorInt(Object err) {
  print('handleErrorInt:: Got an error from previous function');
  print('      $err');
  return 41;
}

double handleErrorDouble(Object err) {
  print('handleErrorDouble:: Got an error from previous function');
  print('      $err');
  return 0.42;
}

num handleErrorNum(Object err) {
  print('handleErrorNum:: Got an error from previous function');
  print('      $err');
  return 0.43;
}

void Function() handleErrorFunction(Object err) {
  print('handleErrorFunction:: Got an error from previous function');
  print('      $err');
  return () {};
}

bool shouldThrow(Object err) {
  RegExp exp = RegExp("throw: (true|false)");
  String errStr = '$err';
  RegExpMatch? mo = exp.firstMatch(errStr);
  String? throwStr = mo?.group(1);
  throwStr = throwStr ?? 'true';
  bool throw_ = (throwStr == 'true') ? true : false;
  return throw_;
}
