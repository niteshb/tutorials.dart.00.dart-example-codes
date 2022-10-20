import 'dart:async';

final stars80 = '*' * 80;

void main(List<String> arguments) {
  final myFuture =
      Future.error(Exception('planned in future')); // async throw an error
  //myFuture.then(() {}, onError: errorHandler);
  myFuture.catchError(errorHandler);
  myFuture.catchError(errorHandlerAnother);
  print('main:: done');
}

void errorHandler(Object err) {
  print('errorHandler:: catching an error');
  print('    $err');
}

void errorHandlerAnother(Object err) {
  print('errorHandlerAnother:: catching it again');
  print('    $err');
}
/*______________________________________________________________________________
OUTPUT:

main:: done
errorHandler:: catching an error
    Exception: planned in future
errorHandlerAnother:: catching it again
    Exception: planned in future
________________________________________________________________________________*/
