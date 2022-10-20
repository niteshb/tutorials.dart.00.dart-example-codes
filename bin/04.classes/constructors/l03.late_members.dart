// ignore_for_file: unused_local_variable

class Class10 {
  late int idata;

  /*
  // Variables must be declared using the keywords 'const', 'final', 'var' or a type name.
  // Try adding the name of the type of the variable or the keyword 'var'.
  late qdata;
  */
  Class10.named1() {
    idata = 5; // remember, we couldn't do this for 'non-late' member
  }
  Class10.named2() {
    //idata = 5; // you may even NOT initialize late member in your constructor
  }
}

void main() {
  var c10o1 = Class10.named1();
  print(c10o1.idata);
  var c10o2 = Class10.named2();

  // runtime error: LateError (LateInitializationError: Field 'idata' has not been initialized.)
  // don't use before initializing, even for 'late' variables
  // print(c10o2.idata);

  // so initialize it here
  c10o2.idata = 10;
  print(c10o2.idata); // then all is well
}
