// https://dart.dev/guides/libraries/futures-error-handling#async-try-catch-finally-using-whencomplete
// Async try-catch-finally using whenComplete()
// If then().catchError() mirrors a try-catch, whenComplete() is the equivalent
// of ‘finally’. The callback registered within whenComplete() is called when
// whenComplete()’s receiver completes, whether it does so with a value or with
// an error

// We want to call server.close regardless of whether server.post() produces a
// valid response, or an error. We ensure this happens by placing it inside
// whenComplete().

void main() {
  final server = Server({'url': 'https://serverurl'});

  Future.value(server.post('https://serverurl/post/user',
          fields: const {'name': 'Dash1', 'profession': 'mascot'}))
      .catchError(handlePostError)
      .then(handleResponse, onError: handleThenError)
      .whenComplete(server.close);
}

String handleResponse(Response res) {
  print('handleResponse:: Post Success');
  return res.status;
}

String handleThenError(Object err) {
  print('handleThenError:: ');
  print('      $err');
  return 'then() Failed';
}

String handleError(Object err) {
  print('      $err');
  return 'Fail';
}

Future<Response> handlePostError1(Object err) {
  print('      $err');
  return Future.value(Response('Fail', ''));
}

Response handlePostError(Object err) {
  print('      $err');
  return Response('Fail', '');
}

class Response {
  String status;
  String data;
  Response(this.status, this.data);
}

class Server {
  String state = 'not-connected';
  Server(Map connectionInfo) {
    // connect to server
    state = 'connected';
    print('Connected with Server');
  }

  Response post(String url, {required Map fields}) {
    if (fields['name'] != 'Dash') {
      throw Exception('Bad input data');
    }
    return Response('OK', '');
  }

  close() {
    state = 'terminated';
    print('Connection with Server terminated');
  }
}
