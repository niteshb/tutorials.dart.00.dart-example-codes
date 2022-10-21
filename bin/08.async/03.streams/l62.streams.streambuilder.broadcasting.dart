import 'dart:async';
import 'l60.streams.streambuilder.class_stream_counter.dart';

/*
Streams are single subscription by default.
They hold on to their values till someone starts listening.

Can make them asBroadcastStream()
Now they can have multiple listeners (or no listeners)
But if no one is listening, data gets tossed out
    This is not true for initial data though. Is this a bug???
*/

void main(List<String> args) {
  print('main:: main starts');

  // broadcast stream counts numbers every 500ms, from [start, stop)
  Stream<int> counterStream = StreamCounter(
    start: 2,
    stop: 30,
    milliseconds: 500,
    //streamType: 'broadcast',
    streamType: 'broadcast with buffer till first subscriber',
  ).stream;
  print('counterStream.isBroadcast: ${counterStream.isBroadcast}');
  // first subscription happens after 2 seconds, lasts for 6 seconds
  // data piled up to this moment is flushed into this subscription
  subscribe<int>(counterStream, 'subs1', startDelay: 2, life: 6);
  // second subscription also happens after 2 seconds, lasts for 3 seconds
  // note that this happens just after subs1 but only subs1 gets buffered up data
  subscribe<int>(counterStream, 'subs2', startDelay: 2, life: 3);
  // third subscription is to see how onDone behaves & what happens to data when no one is listening
  // note that subs1 & subs2 also have onDone, but they unsubscribe before stream closure
  // so their onDone doesn't fire
  bool noSubscriptionOnStreamClosure = false;
  if (!noSubscriptionOnStreamClosure) {
    subscribe<int>(counterStream, 'subs3', startDelay: 11);
  }
  // subscription after stream closure
  // it is able to subscribe but get onDone immediately
  subscribe<int>(counterStream, 'subs4', startDelay: 17);

  // all the above are async calls so the following prints first
  print('main:: main is done');
}
