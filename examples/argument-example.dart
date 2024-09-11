// MAP and LIST

// Call it with arguments
// Make sure the return type
// Catch it

Map<String, dynamic> getMySibling(int myAge, String myName, double myWeight,
    List<String> myHobbies, Map<String, dynamic> mySiblings) {
  return (mySiblings);
}

void main() {
  Map<String, dynamic> myHobbies = getMySibling(18, 'Raju', 56.340, [
    'Cricket',
    'Tennis',
    'Chess'
  ], {
    "sistername": 'Agrima',
    "brother": 'Aarush',
    "pincode": 23456,
    "city": ['Texes', 'CA'],
  }); // calling a function called printMyAge with 5 arguments.

  print(myHobbies);
}
