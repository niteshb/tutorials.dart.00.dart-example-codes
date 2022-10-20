/*
source: https://dart.dev/codelabs/iterables

This exercise provides the class EmailAddress, which has a constructor that 
takes a string. Another provided function is isValidEmailAddress(), which tests 
whether an email address is valid.

Constructor/function:	Type signature:	Description
EmailAddress()
    EmailAddress(String address)
    Creates an EmailAddress for the specified address.
isValidEmailAddress()
    bool isValidEmailAddress(EmailAddress)
    Returns true if the provided EmailAddress is valid.

Write the following code:
Part 1: Implement parseEmailAddresses().
  Write the function parseEmailAddresses(), which takes an Iterable<String> 
  containing email addresses, and returns an Iterable<EmailAddress>.
  Use the method map() to map from a String to EmailAddress.
  Create the EmailAddress objects using the constructor EmailAddress(String).

Part 2: Implement anyInvalidEmailAddress().
  Write the function anyInvalidEmailAddress(), which takes an 
  Iterable<EmailAddress> and returns true if any EmailAddress in the Iterable 
  isn’t valid. Use the method any() together with the provided function 
  isValidEmailAddress().

Part 3: Implement validEmailAddresses().
  Write the function validEmailAddresses(), which takes an 
  Iterable<EmailAddress> and returns another Iterable<EmailAddress> containing 
  only valid addresses. Use the method where() to filter the 
  Iterable<EmailAddress>. Use the provided function isValidEmailAddress() to 
  evaluate whether an EmailAddress is valid.

Original code:
Iterable<EmailAddress> parseEmailAddresses(Iterable<String> strings) {
  TO.DO('Implement this method');
}

bool anyInvalidEmailAddress(Iterable<EmailAddress> emails) {
  TO.DO('Implement this method');
}

Iterable<EmailAddress> validEmailAddresses(Iterable<EmailAddress> emails) {
  TO.DO('Implement this method');
}

*/

// this is just to make code compile. this is not implemented properly here
// it is hidden in the exercise
bool isValidEmailAddress(EmailAddress eddr) {
  return true;
}

Iterable<EmailAddress> parseEmailAddresses(Iterable<String> strings) {
  return strings.map((str) => EmailAddress(str));
}

bool anyInvalidEmailAddress(Iterable<EmailAddress> emails) {
  return emails.any((email) => !isValidEmailAddress(email));
}

Iterable<EmailAddress> validEmailAddresses(Iterable<EmailAddress> emails) {
  return emails.where(isValidEmailAddress);
}

class EmailAddress {
  final String address;

  EmailAddress(this.address);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmailAddress && address == other.address;

  @override
  int get hashCode => address.hashCode;

  @override
  String toString() {
    return 'EmailAddress{address: $address}';
  }
}
