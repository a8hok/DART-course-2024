// String getMySomething(var a, var b) {
// //   print(a);
// //   print(b);
//   return 'Hello';
// }

void main() {
  // List => List => [] => collection of elements
  // Dictionary => Map => {} => key value pair

  var collectionOfAges = [12, 14, 16, 20, 24];
//   print(collectionOfAges[2]);
//   print(collectionOfAges[3]);
//   print(collectionOfAges.length);
  collectionOfAges.add(40);
  print(collectionOfAges);
  collectionOfAges.remove(16); // remove by value
  print(collectionOfAges);
  collectionOfAges.removeAt(0); // remove by index
  print(collectionOfAges);
  collectionOfAges[2] = 50;
  print(collectionOfAges);
  collectionOfAges.addAll([23, 45, 56]);
  print(collectionOfAges);

  var diffTypeList = ['hello', 1, 2];
  print(diffTypeList);
  diffTypeList.add(100.20);
  print(diffTypeList);
  diffTypeList.add(true);
  print(diffTypeList);
  diffTypeList.add([1, 2, 3]);
  print(diffTypeList);
  diffTypeList.add({'name': 'Raju', 'age': 12});
  print(diffTypeList);

  // i++ = i=i+1;

  // 0 < 4 // true
  // 1 < 4 // true
  // 2< 4 // true
  //3 < 4 // true
// 4 < 4 // false
  // i+=3
//   for(int i = 0; i<collectionOfAges.length; i++) {
//     print(collectionOfAges[i]);
//   }

//   var somethingValue = getMySomething('Hello', 12);

//   print('somethingValue $somethingValue');
}
