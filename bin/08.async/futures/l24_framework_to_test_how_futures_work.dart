// ignore_for_file: non_constant_identifier_names
import 'package:dart_examples_classified/vayavya/console/embellish.dart';

class VyException implements Exception {
  final dynamic data;
  VyException(this.data);
  @override
  String toString() => 'VyException: $data';
}

void main() async {
  List<Function> testFunctionList = [
    f1_Vf,
    f1_Vt,
    f1_E__tc,
    f1_E__toc,
    f1_E_toc__f2_tc___tt,
    f1_E_toc__f2_toc___tt,
    f1_E_toc__f2_toc___ttt
  ];
  for (int i = 0; i < testFunctionList.length; i++) {
    pprint();
    stars();
    await testFunctionList[i]();
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
  Future<Map> f2 = f1.then(ff1.Then);
  f2.then(ff2.Then).catchError(ff2.CatchError);
}

void f1_Vt() {
  Map f1v = {
    'data': 5,
    'throw': [true]
  };
  print('* f1_Vt');
  stars();
  Future<Map> f1 = Future.value(f1v);
  Future<Map> f2 = f1.then(ff1.Then);
  f2.then(ff2.Then).catchError(ff2.CatchError);
}

void f1_E__tc() {
  Map f1e = {
    'data': 6,
    'throw': [false]
  };
  print('* f1_E__tc');
  stars();
  Future<Map> f1 = Future.error(f1e);
  Future<Map> f2 = f1.then(ff1.Then).catchError(ff1.CatchError);
  f2.then(ff2.Then).catchError(ff2.CatchError);
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
      .then(ff1.Then, onError: ff1.OnError)
      .catchError(ff1.CatchError);
  f2.then(ff2.Then).catchError(ff2.CatchError);
}

void f1_E_toc__f2_tc___tt() {
  Map f1e = {
    'data': 6,
    'throw': [true, true]
  };
  print('* f1_E_toc__f2_tc___tt');
  stars();
  Future<Map> f1 = Future.error(f1e);
  Future<Map> f2 = f1 //
      .then(ff1.Then, onError: ff1.OnError)
      .catchError(ff1.CatchError);
  f2.then(ff2.Then).catchError(ff2.CatchError);
}

void f1_E_toc__f2_toc___tt() {
  Map f1e = {
    'data': 6,
    'throw': [true, true]
  };
  print('* f1_E_toc__f2_toc___tt');
  stars();
  Future<Map> f1 = Future.error(f1e);
  Future<Map> f2 = f1 //
      .then(ff1.Then, onError: ff1.OnError)
      .catchError(ff1.CatchError);
  f2.then(ff2.Then, onError: ff2.OnError).catchError(ff2.CatchError);
}

void f1_E_toc__f2_toc___ttt() {
  Map f1e = {
    'data': 6,
    'throw': [true, true, true]
  };
  print('* f1_E_toc__f2_toc___ttt');
  stars();
  Future<Map> f1 = Future.error(f1e);
  Future<Map> f2 = f1 //
      .then(ff1.Then, onError: ff1.OnError)
      .catchError(ff1.CatchError);
  f2.then(ff2.Then, onError: ff2.OnError).catchError(ff2.CatchError);
}

// Here are the then, onError & catchError callback functions encapsulated
// in objects of FuncSet Class
final ff1 = FuncSet<double>('f1', 12.3, 45.6, 78.9);
final ff2 = FuncSet<String>('f2', 'f2.then() returns', 'f2.onError() returns',
    'f2.catchError() returns');

// This class encapsulates then, onError & catchError callback functions for a
// particular future.
// The functions are created according to a pattern so that they print
// information about them pretty verbosily
// Data can be passed around to make then throw Exceptions
class FuncSet<T> {
  String funcId;
  T thenRet, onErrorRet, catchErrorRet;
  late final Map Function(Map) Then;
  late final Map Function(Object) OnError;
  late final Map Function(Object) CatchError;

  FuncSet(this.funcId, this.thenRet, this.onErrorRet, this.catchErrorRet) {
    Then = funcThenFactory<T>('$funcId.then', thenRet);
    OnError = funcErrorHandlerFactory<T>('$funcId.onError', onErrorRet);
    CatchError =
        funcErrorHandlerFactory<T>('$funcId.catchError', catchErrorRet);
  }
}

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
Map Function(Object err) funcErrorHandlerFactory<T>(String funcName, T retval) {
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
    return {'data': retval, 'throw': iThrows.sublist(1)};
  }

  return funcErrorHandler;
}

Map Function(Map) funcThenFactory<T>(String funcName, T retval) {
  Map funcThen(Map map) {
    print('$funcName:: $map');
    List<bool> iThrows = map['throw'];
    iThrows = iThrows.isEmpty ? [false] : iThrows;
    bool iThrow = iThrows[0];
    if (iThrow) {
      print('$funcName: I have been commanded to throw an error');
      throw VyException({'source': funcName, 'throw': iThrows.sublist(1)});
    }
    return {'data': retval, 'throw': iThrows.sublist(1)};
  }

  return funcThen;
}
