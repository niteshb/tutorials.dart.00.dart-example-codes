void main() {
  Future.value({'throw': true})
      .then(funcThatThrows)
      // Future completes with an error:
      .then((_) => print("Won't reach here"))
      // Future completes with the same error:
      .whenComplete(funcWhenComplete)
      // Future completes with the same error:
      .then((_) => print("Won't reach here"))
      // Error is handled here:
      .catchError(handleError);
}

int funcThatThrows(Map msg) {
  print('funcThatThrows:: I am in');
  if (msg['throw']) {
    print('funcThatThrows:: I will throw an Exception');
    throw Exception({'source': 'funcThatThrows', 'throw': false});
  }
  return 5;
}

int funcThatThrowsSimple() {
  print('funcThatThrows:: I will throw an Exception');
  throw Exception({'source': 'funcThatThrows', 'throw': false});
  //return 5;
}

void funcWhenComplete() {
  print('funcWhenComplete:: Reaches here');
}

handleError(_) {
  print('handleError:: I am in');
}
