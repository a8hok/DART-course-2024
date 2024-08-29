void main() {
  for (int i = 0; i < 5; i++) {
    if (i == 2) {
      continue; // Skip the iteration when i == 2
    }
    if (i == 4) {
      break; // Exit the loop when i == 4
    }
    print("i = $i");
  }
}
