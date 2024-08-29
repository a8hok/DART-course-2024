void main() {
  String grade = 'A';

  switch (grade) {
    case 'A':
      print("Outstanding");
      break;
    case 'B':
      print("Good");
      break;
    case 'C':
      print("Average");
      break;
    case 'D':
    case 'E':
    case 'F':
      print("Poor");
      break;
    default:
      print("Poor");
  }
}
