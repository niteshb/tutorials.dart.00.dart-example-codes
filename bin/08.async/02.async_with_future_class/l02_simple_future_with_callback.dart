import 'dart:async';

void main(List<String> arguments) {
  final myFuture = Future(callInFuture);
  myFuture.then(callback);
  print('Done with main');
}

int callInFuture() {
  print('Creating the future');
  return 12;
}

void callback(int returnedBycallInFuture) {
  print('Callback got $returnedBycallInFuture');
}
/***********************************
OUTPUT:
************************************
Done with main
Creating the future
************************************/
