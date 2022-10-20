import 'dart:async';

final stars80 = '*' * 80;

void main(List<String> arguments) {
  final myFuture = Future.delayed(
    Duration(seconds: 2),
    () => callInFuture(12),
  );
  // assert(myFuture is Future<int>);
  // 'then' returns another Future object so can be chained
  final f1 = myFuture.then(callback1).then(callback2);
  final f2 = myFuture.then(callback3).then(callback4);
  // f1 & f2 are Futures from terminal "then"s
  // type of future created by then depends on return values from their callbacks
  print('main:: f1.runtimeType: ${f1.runtimeType}'); // Future<void>
  print(
      'main:: f2.runtimeType: ${f2.runtimeType}'); // Future<Map<dynamic, dynamic>>
  // assert(f1 is Future<void>);
  // assert(f2 is Future<Map<dynamic, dynamic>>);
  print('main:: done');
}

int callInFuture(int i) {
  print('callInFuture:: sending $i');
  return i;
}

String callback1(int fromCallInFuture) {
  String fromCallback1 = 'love from callback1';
  print('callback1:: got "$fromCallInFuture", sending "$fromCallback1"');
  return fromCallback1;
}

void callback2(String fromCallback1) {
  print('callback2:: got "$fromCallback1", sending nothing');
}

double callback3(int fromCallInFuture) {
  double fromCallback3 = 3.14;
  print('callback3:: got "$fromCallInFuture", sending "$fromCallback3"');
  return fromCallback3;
}

Map callback4(double fromCallback3) {
  Map<int, double> map = {1: 2.3, 4: 5.6};
  print('callback4:: got "$fromCallback3", sending $map');
  // assert(map is Map<int, double>);
  return map; // returns as Map<dynamic, dynamic>
}

// _____________________________________________________________________________
// OUTPUT:
/*______________________________________________________________________________
main:: f1.runtimeType: Future<void>
main:: f2.runtimeType: Future<Map<dynamic, dynamic>>
main:: done
callInFuture:: sending 12
callback1:: got "12", sending "love from callback1"
callback2:: got "love from callback1", sending nothing
callback3:: got "12", sending "3.14"
callback4:: got "3.14", sending {1: 2.3, 4: 5.6}
*///____________________________________________________________________________
