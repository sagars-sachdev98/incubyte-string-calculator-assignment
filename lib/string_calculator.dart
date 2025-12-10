class StringCalculator {
  int add(String numbers) {
    final trimmed = numbers.trim();
    if (trimmed.trim().isEmpty) {
      return 0;
    }

    var separator = ',';

    if (numbers.startsWith('//')) {
      final newlineIndex = numbers.indexOf('\n');
      separator = numbers.substring(2, newlineIndex);
      numbers = numbers.substring(newlineIndex + 1);
    }

    numbers = numbers.replaceAll('\n', separator);

    // split by comma, newline or custom delimiter
    final parts = numbers.split(separator);

    return parts
        .where((part) => part.trim().isNotEmpty)
        .map((part) => int.parse(part.trim()))
        .fold(
          0,
          (sum, value) => sum + value,
        );
  }
}
