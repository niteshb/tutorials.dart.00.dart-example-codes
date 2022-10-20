/*
source: https://dart.dev/codelabs/async-await#exercise-practice-using-async-and-await
The following exercise is a failing unit test that contains partially completed 
code snippets. Your task is to complete the exercise by writing code to make the 
tests pass. You don’t need to implement main().

To simulate asynchronous operations, call the following functions, which are provided for you:
Function	Type signature	Description
fetchRole()
    Future<String> fetchRole()
    Gets a short description of the user’s role.
fetchLoginAmount()
    Future<int> fetchLoginAmount()
    Gets the number of times a user has logged in.

Part 1: reportUserRole()
Add code to the reportUserRole() function so that it does the following:
Returns a future that completes with the following string: 
  "User role: <user role>"
Note: You must use the actual value returned by fetchRole(); copying and pasting 
the example return value won’t make the test pass.
Example return value: "User role: tester"
Gets the user role by calling the provided function fetchRole().

Part 2: reportLogins()
Implement an async function reportLogins() so that it does the following:
Returns the string "Total number of logins: <# of logins>".
Note: You must use the actual value returned by fetchLoginAmount(); copying and 
pasting the example return value won’t make the test pass.
Example return value from reportLogins(): "Total number of logins: 57"
Gets the number of logins by calling the provided function fetchLoginAmount().

Original Code:
// Part 1
// You can call the provided async function fetchRole()
// to return the user role.
Future<String> reportUserRole() async {
  TO.DO('Your implementation goes here.');
}

// Part 2
// Implement reportLogins here
// You can call the provided async function fetchLoginAmount()
// to return the number of times that the user has logged in.
reportLogins() {}

*/

// Part 1
// You can call the provided async function fetchRole()
// to return the user role.
Future<String> reportUserRole() async {
  String role = await fetchRole();
  return "User role: $role";
}

// Part 2
// Implement reportLogins here
// You can call the provided async function fetchLoginAmount()
// to return the number of times that the user has logged in.
Future<String> reportLogins() async {
  int logins = await fetchLoginAmount();
  return "Total number of logins: $logins";
}

// NOT PART OF ORIIGNAL CODE
// added for simulation here

// Gets a short description of the user’s role.
Future<String> fetchRole() {
  return Future.delayed(Duration(seconds: 1), () => 'CEO');
}

// Gets the number of times a user has logged in.
Future<int> fetchLoginAmount() {
  return Future.delayed(const Duration(seconds: 1), () => 10);
}

void main(List<String> args) {}
