import 'dart:io';

class StudentGrade {
  List<String> calculateTotal(List<Map<String, dynamic>> studentList) {
    dynamic total = 0;
    List<String> grades = [];
    for (int i = 0; i < studentList.length; i++) {
      // print(studentList);
      // print(studentList[i]);
      // print(studentList.length);
      // print(studentList[i]['score'].length);
      // print(studentList[i]['score']);
      // print(studentList[i]['name']);
      for (int j = 0; j < studentList[i]['score'].length; j++) {
        //   print(studentList[i]['score'][j]);
        total = total + studentList[i]['score'][j];
      }
      double avg = total / 4;
      String grade = calculateGrade(avg);
      String name = studentList[i]['name'];
      String nameWithGrade = name + grade;
      grades.add(nameWithGrade);
      total = 0;
    }
    return grades;
  }

  String calculateGrade(double avg) {
    if (avg > 85 && avg <= 100) {
      return ('Grade: A');
    } else if (avg > 60 && avg <= 85) {
      return ('Grade: B');
    } else if (avg > 50 && avg <= 60) {
      return ('Grade: C');
    } else if (avg == 50) {
      return ('Grade: D');
    } else {
      return ('Grade: F');
    }
  }
}

// List<String> name = ['bob','Aarush','Agrima'];
// List<int> name = [5,2,7];
// List<Map<String,String>> names = [{
//     'name1' : 'bob',
//     'name2' : 'Aarush',

// }];

void main() {
  List<Map<String, dynamic>> stuList = [];

  print('How many students do you want to enter?');
  String? studentLength = stdin.readLineSync();
  dynamic studentLengthInt = int.tryParse(studentLength!);

  if (studentLengthInt != null) {
    for (int i = 0; i < studentLengthInt; i++) {
      print('What is your name?');
      String? name = stdin.readLineSync();
      print('What is your Math score?');
      String? math = stdin.readLineSync();
      int? mathInt = int.tryParse(math!);
      print('What is your Science score?');
      String? science = stdin.readLineSync();
      int? scienceInt = int.tryParse(science!);
      print('What is your English score?');
      String? english = stdin.readLineSync();
      int? englishInt = int.tryParse(english!);
      print('What is your History score?');
      String? history = stdin.readLineSync();
      int? historyInt = int.tryParse(history!);

      Map<String, dynamic> studentDetails = {};
      studentDetails["name"] = name;
      studentDetails["score"] = <int>[];

      (studentDetails["score"] as List<int>).addAll(
          [mathInt ?? 0, scienceInt ?? 0, englishInt ?? 0, historyInt ?? 0]);
      stuList.add(studentDetails);
    }

    // in order to access properties(variable or functions/ methods) inside a class we must create Object
    StudentGrade stuObj = new StudentGrade();

    List<String> grades = stuObj.calculateTotal(stuList);
    for (int i = 0; i < grades.length; i++) {
      print(grades[i]);
    }
  } else {
    print('Enter valid count');
  }
}
