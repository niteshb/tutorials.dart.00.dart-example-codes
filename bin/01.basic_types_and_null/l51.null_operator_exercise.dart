String joinWithCommas1(int a, [int? b, int? c, int? d, int? e]) {
  String r = '$a';
  return r;
}

void main(List<String> args) {
  joinWithCommas(1); // '1'
  joinWithCommas(1, 2, 3); // '1,2,3'
  joinWithCommas(1, 1, 1, 1, 1); // '1,1,1,1,1'
}

String joinWithCommas(int a, [int? b, int? c, int? d, int? e]) {
  return '$a${x(b)}${x(c)}${x(d)}${x(e)}';
}

String x(int? a) => a == null ? "" : ",$a";
