// void printSomething()) {
//   print('Hello world'); // directly hard coded or static
// }

// void printSomething(a)) {
//  print(a); // Passed argument value will be printed
// }

String printSomething(String a) {
  return a; // return and get the value and print it
}

void main() {
// printSomething();
// printSomething('Hello World!');
  String getValue = printSomething('Hello World!'); // 3 arguments function call
  print(getValue);
}
