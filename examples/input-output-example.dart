import 'dart:io'; // input/output

// 1. Return type // sometimes its a void, or some other type like int, sting, list or map
// 2. Function name
// 3. arguments // can be empty or more
void printStuInfo(List<Map<String, dynamic>> stuList) {
  // print(stuList.length);
  // dynamic
  for (int i = 0; i < stuList.length; i++) {
    print(stuList);
    print(stuList[i]);
    print("My name: ${stuList[i]['name']}");
  }
}

void main() {
  List<Map<String, dynamic>> stuList = [];
  // manually desideing the length
  for (int i = 0; i < 2; i++) {
    print("Enter your name:");
    String? myName = stdin.readLineSync();
    print("My name is ${myName}");
    print("Enter your Age:");
    String? myAge = stdin.readLineSync();
    int? myAgeInInt = int.tryParse(myAge!);
    print("My age is ${myAge}");
    Map<String, dynamic> stuDetails = {};
    stuDetails['name'] = myName;
    stuDetails['age'] = myAge;
    // print(stuDetails);
    stuList.add(stuDetails);
  }
  // print(stuList);
  printStuInfo(stuList);

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

  // Loop and get n number of values
  // Push inside a list of maps
  //  [
  //      {
  //         "name": "Raju",
  //         "age": 22,
  //         "marks": [23,45,67],
  //     },
  //     {
  //         "name": "Ramu",
  //         "age": 24,
  //         "marks": [23,45,67],
  //     },
  // ]
  // get the total marks
  // calculate avg
  // calculate grade
}
