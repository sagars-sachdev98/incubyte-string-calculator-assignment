class StringCalculator {
  int add(String numbers) {
    final trimmed = numbers.trim();
    if (trimmed.trim().isEmpty) {
      return 0;
    }

    final parts = trimmed.split(',');

    // for now assume it's a single number input
    return parts.map((part) => int.parse(part)).fold(
          0,
          (sum, value) => sum + value,
        );
  }
}
