import 'dart:async';

final stars80 = '*' * 80;

void main(List<String> arguments) {
  final myFuture = Future.delayed(
    Duration(seconds: 5),
    () => 12,
  );
  myFuture.then(callback);
  myFuture.then(callbackAnother);
  // Why onError needs to return same as callee?
  myFuture.catchError(errorHandler);
  myFuture.catchError(errorHandlerAnother);
  print('Done with main');
}

void callback(int returnedBycallInFuture) {
  print('Callback got $returnedBycallInFuture');
}

void callbackAnother(int returnedBycallInFuture) {
  print('Another callback got $returnedBycallInFuture');
}

int errorHandler(Object err) {
  print('Error happened');
  print('$err');
  return -1;
}

int errorHandlerAnother(Object err) {
  print(stars80);
  print('Error happened::Catching it again');
  print('$err');
  return -1;
}


// _____________________________________________________________________________
// OUTPUT:
/*______________________________________________________________________________
Done with main
Callback got 12
Another callback got 12
*///____________________________________________________________________________
