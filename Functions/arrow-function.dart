int add(int a, int b) => a + b;

int subtract(int a, int b) => a - b;

int multiply(int a, int b) => a * b;

int divide(int a, int b) => a ~/ b;

int mod(int a, int b) => a % b;

void main() {
  int a = 10;
  int b = 5;

  print(add(a, b));
  print(subtract(a, b));
  print(multiply(a, b));
  print(divide(a, b));
  print(mod(a, b));
}
