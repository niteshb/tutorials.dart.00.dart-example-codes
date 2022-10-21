import 'dart:async';

class StreamCounter {
  // data/state members
  int _counter = 1;
  late final StreamController<int> _controller;
  String streamType;

  // constructor
  StreamCounter({
    int start = 1,
    int stop = 10,
    int milliseconds = 200,
    bool throwErrors = false,
    int errorOnMultiplesOf = 5,
    // Options: 'unicast', 'broadcast', 'broadcast with buffer till first subscriber'
    this.streamType = 'unicast',
  }) {
    if (start > stop) {
      int temp = stop;
      stop = start;
      start = temp;
    }
    _counter = start;
    switch (streamType) {
      case ('unicast'):
        _controller = StreamController<int>();
        break;
      case ('broadcast'):
        _controller = StreamController<int>.broadcast();
        break;
      case ('broadcast with buffer till first subscriber'):
        // underlying stream is unicast
        // it is then wrapped in asBroadcastStream
        // this causes buffering till first subscriber
        _controller = StreamController<int>();
        break;
      default:
        throw Exception();
    }
    Timer.periodic(Duration(milliseconds: milliseconds), (timer) {
      if (throwErrors && _counter % errorOnMultiplesOf == 0) {
        _controller.sink.addError(
            Exception('$_counter is a multiple of $errorOnMultiplesOf'));
        print('  stream gets error for $_counter');
      } else {
        _controller.sink.add(_counter);
        print('  stream gets $_counter');
      }

      _counter++;
      if (_counter == stop) {
        timer.cancel();
        _controller.close();
        print('stream controller closed');
      }
    });
  }

  // getter for controllers stream
  Stream<int> get stream =>
      (streamType == 'unicast' || streamType == 'broadcast')
          ? _controller.stream
          : _controller.stream.asBroadcastStream();
}

// startDelay is delay in seconds that will be introduced before subscription happens
// Subscription will get cancelled after 'life' seconds post subscription
// To not unsubscribe, let 'life' be negative
void subscribe<T>(
  Stream<T> stream,
  String id, {
  int startDelay = 0,
  int life = -1,
  bool cancelOnError = true,
}) {
  Future.delayed(Duration(seconds: startDelay), () {
    print('$id subscribes');
    StreamSubscription<T> subscription = stream.listen(
      (data) => print('    $id got data: $data'),
      onError: (err) {
        print('$id handles error: $err');
      },
      onDone: () {
        print('$id notices stream closure');
      },
      // cancelOnError is true by default and cancels the subscription when an error occurs
      cancelOnError: cancelOnError,
    );
    if (life >= 0) {
      Future.delayed(Duration(seconds: life), () {
        subscription.cancel();
        print('$id cancels its subscription');
      });
    }
  });
}
