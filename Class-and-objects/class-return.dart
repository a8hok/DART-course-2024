class Person {
  // properties or vaiable
  String name = 'John';
  int age = 25;

  // methods or functions
  String greet() {
    return ("Hello, $name!");
  }

// Call it with a function name
// Pass the arguments if needed
// Get the arguments passed if needed
// Do Manipulations
// make sure the return type
// Return it
// Catch it with a variable name and proper variable type

  String introduce() {
    return ("I am $name and I am $age years old.");
  }
}

void main() {
  Person personObj = new Person();
// var person = Person();
  String greetStr = personObj.greet();
  print(greetStr);
  String someName = personObj.introduce();
  print(someName);
}
