import 'dart:io'; // input/output

void main() {
  for (int i = 0; i < 2; i++) {
    print("Enter your name:");
    String? myName = stdin.readLineSync();
    print("My name is ${myName}");
    print("Enter your Age:");
    String? myAge = stdin.readLineSync();
    int? myAgeInInt = int.tryParse(myAge!);
    print("My age is ${myAge}");
  }

  // int j = 0;
  // while(j < 2) {
  //     print("Enter your name:");
  //     String? myName = stdin.readLineSync();
  //     print("My name is ${myName}");
  //     print("Enter your Age:");
  //     String? myAge = stdin.readLineSync();
  //     int? myAgeInInt = int.tryParse(myAge!);
  //     print("My age is ${myAge}");
  //     j++;
  // }
}
