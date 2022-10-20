import 'dart:async';

void main() {
  final myFuture = Future.value(12); // async call with this value
  // do this when you have value from cache
  // this is a simple way to not-create-a-call but still get return value for fnWithArgument
  // FUTURE still runs async
  myFuture.then(fnWithArgument);
  // alternatively, a simpler way to run 'fnWithArgument' async
  Future.value(42).then(fnWithArgument);
  print('Done with main');
}

void fnWithArgument(int argument) {
  print('fnWithArgument:: got $argument');
}

/***********************************
OUTPUT:
************************************
Done with main
fnWithArgument:: got 12
fnWithArgument:: got 42
************************************/
