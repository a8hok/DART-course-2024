void main() {
  // Map
  var studentObj = {
    "name": "Raju",
    "age": 18,
    "marks": [40, 66, 77],
    "address": {"city": "Texes", "Country": 'USA'},
    "isAdult": true,
    "weight": '50.500',
  };

  dynamic weight = studentObj['weight'];
  dynamic marks = studentObj['marks'];
//   print(weight);
//   print(marks);
  studentObj["height"] = 140;
//   print(studentObj);

  var techerInfo = {"teacherName": 'ravi', "subject": 'Math'};

  studentObj.addAll(techerInfo);
//   print(studentObj);
//   print(studentObj.keys);
//   print(studentObj.values);
//   print(studentObj.entries);

//   for(dynamic key in studentObj.keys) {
//     print(studentObj[key]);

//   }

  dynamic allmarks = studentObj['marks'];
  print(allmarks);
  print(allmarks.length);

//   print(studentObj['marks']);
  dynamic total = 0;
  for (var i = 0; i < allmarks.length; i++) {
    print(allmarks[i]);
    total = total + allmarks[i];
  }
  print(total);
  double avg = total / allmarks.length;
  print(avg);

  studentObj['total'] = total;
  studentObj['average'] = avg;

  print(studentObj);
}
