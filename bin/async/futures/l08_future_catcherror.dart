Future<String> one = Future.value('from one');
// returning Future.error is so different than throwing Excpetion
// Just look at return type: "Future<String>"
// Won't accept any other Future subtype e.g. Future<int> but will accept just Future
// This shows that Future.error actually sets 'value' and 'error' is just an internal flag
Future<String> two(_) => Future.error('error from two');
Future<String> three(_) => Future.value('from three');
Future<String> four(_) => Future.value('from four');
Future<int> five(_) => Future.value(_.length);

void main() {
  one // Future completes with "from one".
      .then(two) // Future completes with two()'s error.
      .then(three) // Future completes with two()'s error.
      .then(four) // Future completes with two()'s error.
      .then(five) // Future completes with two()'s error.
      .catchError(catchError)
      .then(finalCallback);
}

int catchError(e) {
  print('Got error: $e'); // Finally, callback fires.
  return 42; // Future completes with 42.
}

void finalCallback(int value) {
  print('The value is $value');
}
