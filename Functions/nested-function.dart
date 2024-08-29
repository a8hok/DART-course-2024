void greet(String person) {
  print("Hello, $person!");

  // Nested function
  String welcomeMessage() {
    return "Welcome to Dart Programming!";
  }

  // Return from function
  print(welcomeMessage());
}

void main() {
  greet("Raju");
}
