// ignore_for_file: non_constant_identifier_names, file_names
import 'package:dart_examples_classified/vayavya/console/embellish.dart';

class VyException implements Exception {
  final dynamic data;
  VyException(this.data);
  @override
  String toString() => 'Exception: $data';
}

void main() async {
  List<Function> l = [f1_Vf, f1_Vt, f1_E__tc, f1_E__toc];
  for (int i = 0; i < l.length; i++) {
    pprint();
    stars();
    await l[i]();
  }
  stars();
}

void f1_Vf() {
  Map f1v = {
    'data': 5,
    'throw': [false]
  };
  print('* f1_Vf');
  stars();
  Future<Map> f1 = Future.value(f1v);
  Future<Map> f2 = f1.then(f1Then);
  f2.then(f2Then).catchError(f2CatchError);
}

void f1_Vt() {
  Map f1v = {
    'data': 5,
    'throw': [true]
  };
  print('* f1_Vt');
  stars();
  Future<Map> f1 = Future.value(f1v);
  Future<Map> f2 = f1.then(f1Then);
  f2.then(f2Then).catchError(f2CatchError);
}

void f1_E__tc() {
  Map f1e = {
    'data': 6,
    'throw': [false]
  };
  print('* f1_E__tc');
  stars();
  Future<Map> f1 = Future.error(f1e);
  Future<Map> f2 = f1 //
      .then(f1Then) //
      .catchError(f1CatchError);
  f2.then(f2Then).catchError(f2CatchError);
}

void f1_E__toc() {
  Map f1e = {
    'data': 6,
    'throw': [false]
  };
  print('* f1_E__toc');
  stars();
  Future<Map> f1 = Future.error(f1e);
  Future<Map> f2 = f1 //
      .then(f1Then, onError: ff1['onError'])
      .catchError(f1CatchError);
  f2.then(f2Then).catchError(f2CatchError);
}

// Here are the functions
final ff1 = setGenerator<double>('f1', 12.3, 45.6, 78.9);
final ff2 = setGenerator<String>('f2', 'f2.then() returns',
    'f2.onError() returns', 'f2.catchError() returns');

Map<String, Function> setGenerator<T>(
    String funcId, dynamic thenRet, dynamic onErrorRet, dynamic catchErrorRet) {
  return {
    'then': funcThenFactory<T>('$funcId.then', 12.3),
    'onError': funcErrorHandlerFactory<T>('$funcId.onError', 45.6),
    'catchError': funcErrorHandlerFactory<T>('$funcId.catchError', 78.9),
  };
}

final f1Then = funcThenFactory<double>('f1Then', 12.3);
final f1OnError = funcErrorHandlerFactory<double>('f1OnError', 45.6);
final f1CatchError = funcErrorHandlerFactory<double>('f1CatchError', 78.9);

final f2Then = funcThenFactory<String>('f2Then', 'from f2Then');
final f2OnError =
    funcErrorHandlerFactory<String>('f2OnError', 'from f2OnError');
final f2CatchError =
    funcErrorHandlerFactory<String>('f2CatchError', 'from f2CatchError');

// Parse List<bool>.toString() to List<bool>
List<bool> ParseListBool(String str) {
  RegExp exp = RegExp(r"throw: \[(((true|false), )*(true|false)?)\]");
  RegExpMatch? mo = exp.firstMatch(str);
  String? throwsStr = mo?.group(1);
  if (throwsStr == null) {
    throw VyException(
        "CRITICAL ERROR: DEBUG THIS. throwsStr shouldn't be null");
  }
  List throwStr = throwsStr.split(', ');
  List<bool> iThrows =
      throwStr.map((e) => (e == 'true') ? true : false).toList();
  return iThrows;
}

// Function Generators
Map Function(Object err) funcErrorHandlerFactory<T>(
    String funcName, dynamic retval) {
  Map funcErrorHandler(Object err) {
    // {data: 5, throw: [true, false, true]}
    List<bool> iThrows;

    print('$funcName:: $err');
    if (err is VyException) {
      iThrows = err.data['throw'];
    } else if (err is Map) {
      iThrows = err['throw'];
    } else {
      iThrows = ParseListBool('$err');
    }
    iThrows = iThrows.isEmpty ? [false] : iThrows;
    bool iThrow = iThrows[0];
    if (iThrow) {
      print('$funcName:: I have been commanded to throw an error');
      throw VyException({'source': funcName, 'throw': iThrows.sublist(1)});
    }
    return {'data': retval as T, 'throw': iThrows.sublist(1)};
  }

  return funcErrorHandler;
}

Map Function(Map) funcThenFactory<T>(String funcName, dynamic retval) {
  Map funcThen(Map map) {
    print('$funcName:: $map');
    List<bool> iThrows = map['throw'];
    iThrows = iThrows.isEmpty ? [false] : iThrows;
    bool iThrow = iThrows[0];
    if (iThrow) {
      print('$funcName: I have been commanded to throw an error');
      throw VyException({'source': funcName, 'throw': iThrows.sublist(1)});
    }
    return {'data': retval as T, 'throw': iThrows.sublist(1)};
  }

  return funcThen;
}
