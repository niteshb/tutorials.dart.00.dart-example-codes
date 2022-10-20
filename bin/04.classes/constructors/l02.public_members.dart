class Class22 {
  double ddata; // members are public by default
  // unnamed constructor ceases to exist as default if there is a named
  Class22.named1(this.ddata); // named constructor
  Class22.named2([this.ddata = 5.0]); // another named constructor
  Class22.named3({this.ddata = 5.0});
  Class22.named4({required this.ddata});
  /*
  // Non-nullable instance field 'ddata' must be initialized. Try adding an initializer expression, or add a field initializer in this constructor, or mark it 'late'.
  Class22.named5() {
    ddata = 5.0;
  }
  */
}
