class Person {
  String name = 'John';
  int age = 25;
  void greet() {
    print("Hello, $name!");
  }

  void introduce() {
    print("I am $name and I am $age years old.");
  }
}

void main() {
  // Person person = new Person();
  var person = Person();
  person.greet();
  person.introduce();
}
