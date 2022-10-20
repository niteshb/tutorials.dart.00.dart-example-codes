class Color {
  int red;
  int green;
  int blue;

  Color(this.red, this.green, this.blue);

  // Create a named constructor called "black" here and redirect it
  // to call the existing constructor
  Color.black() : this(0, 0, 0);
}
