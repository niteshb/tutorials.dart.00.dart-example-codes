void main(List<String> args) {
  // func1 calls
  func1(1);
  func1(1, 2);
  func1(1, 2, 3);
  // func2 calls
  func2(1, d: 4);
  func2(1, b: 2, d: 4);
  func2(1, c: 3, d: 4);
  func2(1, b: 2, c: 3, d: 4);
  func2(1, c: 3, d: 4, b: 2);
}

// optional positional parameters
// have to come in this order

void func1(int a, [int b = 1, int? c]) {}
// optional named parameters
void func2(int a, {int b = 1, int? c, required int d}) {}
