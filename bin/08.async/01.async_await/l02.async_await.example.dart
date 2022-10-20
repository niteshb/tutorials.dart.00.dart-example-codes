Future<void> printOrderMessage() async {
  print('Awaiting user order...');
  String order = await fetchUserOrder();
  print('Your order is: $order');
}

Future<String> fetchUserOrder() {
  // Imagine that this function is more complex and slow.
  return Future.delayed(
      const Duration(milliseconds: 4010), () => 'Large Latte');
}

void main() {
  countSeconds(4);
  printOrderMessage();
  print('main:: end of main');
}

// You can ignore this function - it's here to visualize delay time in this example.
void countSeconds(int s) {
  for (var i = 1; i <= s; i++) {
    Future.delayed(Duration(seconds: i), () => print(i));
  }
}
/*
countSeconds creates four futures and ends. Nothing is printed because there are 
delays of 1,2,3,4 seconds for those futures which will happen with those delays.

printOrderMessage() runs and prints "Awaiting user order..." immediately.
Then await fetchUserOrder() makes it lose execution thread (result will come after 4 seconds)

Now execution thread has 4 futures and fetchUserOrder() to check on, which it 
keeps checking in a loop.
Results start coming, first with print(1), print(2), print(3), print(4) and
finally from fetchUserOrder()

output for milliseconds: 3998
Awaiting user order...
1
2
3
Your order is: Large Latte
4

output for milliseconds: >= 3999
Awaiting user order...
1
2
3
4
Your order is: Large Latte

'await' only pauses execution of the function where it is. It doesn't block the 
overall execution thread

*/
