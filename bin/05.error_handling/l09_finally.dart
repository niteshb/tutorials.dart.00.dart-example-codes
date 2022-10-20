/*
Async try-catch-finally using whenComplete()
If then().catchError() mirrors a try-catch, whenComplete() is the equivalent of 
‘finally’. The callback registered within whenComplete() is called when 
whenComplete()’s receiver completes, whether it does so with a value or with an 
error
*/
void main() {
  final server = Server({'url': 'https://serverurl'});
  try {
    final response = server.post('https://serverurl/post/user',
        fields: const {'name': 'Dash1', 'profession': 'mascot'});
    handleResponse(response);
  } catch (err) {
    handleError(err);
  } finally {
    server.close();
  }
}

String handleResponse(Response res) {
  print('Post Success');
  return res.status;
}

String handleError(Object err) {
  print('      $err');
  return 'Fail';
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

// We want to call server.close regardless of whether server.post() produces a 
// valid response, or an error. We ensure this happens by placing it inside 
// whenComplete().

