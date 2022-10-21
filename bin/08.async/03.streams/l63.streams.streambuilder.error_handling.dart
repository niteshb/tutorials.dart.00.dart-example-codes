import 'dart:async';
import 'l60.streams.streambuilder.class_stream_counter.dart';

void main(List<String> args) async {
  Stream<int> numberStream = StreamCounter(
    start: 3,
    stop: 20,
    milliseconds: 500,
    throwErrors: true,
    errorOnMultiplesOf: 7,
  ).stream;

  numberStream.handleError((err) {
    print('stream handles error: $err');
  });

  subscribe(numberStream, 'subscription', cancelOnError: false);
  print('main:: main is done');
}
