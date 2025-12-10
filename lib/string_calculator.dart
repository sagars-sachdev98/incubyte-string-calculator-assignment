class StringCalculator {
  int add(String numbers) {
    if (numbers.trim().isEmpty) {
      return 0;
    }

    // for now assume it's a single number input
    return int.parse(numbers.trim());
  }
}
