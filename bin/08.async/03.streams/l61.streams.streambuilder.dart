import 'dart:async';
import 'l60.streams.streambuilder.class_stream_counter.dart';

void main(List<String> args) async {
  Stream<int> ns = StreamCounter(start: 5, stop: 8).stream;
  StreamSubscription<int> subs = ns.listen(print);
  subs.cancel();
}
