class Arithmetic {
  int add(int x, int y) {
    return x + y;
  }

  int subtract(int x, int y) {
    return x - y;
  }

  int multiply(int x, int y) {
    return x * y;
  }

  int divide(int x, int y) {
    return x ~/ y;
  }

  int mod(int x, int y) {
    return x % y;
  }
}

void main() {
  Arithmetic arithmetic = Arithmetic();
  print(arithmetic.add(10, 5));
  print(arithmetic.subtract(10, 5));
  print(arithmetic.multiply(10, 5));
  print(arithmetic.divide(10, 5));
  print(arithmetic.mod(10, 5));
}
