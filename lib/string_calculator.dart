class StringCalculator {
  int add(String numbers) {
    final trimmed = numbers.trim();
    if (trimmed.trim().isEmpty) {
      return 0;
    }

    // split by comma or newline
    final parts = trimmed.split(RegExp(r'[,\n]'));

    return parts
        .where((part) => part.trim().isNotEmpty)
        .map((part) => int.parse(part.trim()))
        .fold(
          0,
          (sum, value) => sum + value,
        );
  }
}
