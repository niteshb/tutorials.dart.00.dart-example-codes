import 'dart:async';

// note that there is no "then", still the future runs
void main(List<String> arguments) {
  // ignore: unused_local_variable
  final myFuture = Future(callInFuture);
  print('Done with main');
}

int callInFuture() {
  print('Creating the future');
  return 12;
}
/***********************************
OUTPUT:
************************************
Done with main
Creating the future
************************************/
