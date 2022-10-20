// Dart offers some handy operators for dealing with values that might be null.
// One is the ??= assignment operator, which assigns a value to a variable only
// if that variable is currently null
//
// Another null-aware operator is ??, which returns the expression on its left
// unless that expression’s value is null, in which case it evaluates and
//returns the expression on its right

void main() {
  int? a; // = null
  // to avoid warning at a ??= 5
  if (1 == 1) {
    a ??= 3;
    print('a: $a'); // <-- Prints 3.
  }

  a ??= 5;
  print('a: $a again'); // <-- Still prints 3.
}
