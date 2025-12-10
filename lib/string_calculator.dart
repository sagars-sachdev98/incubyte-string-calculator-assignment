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

    final values = parts
        .where((part) => part.trim().isNotEmpty)
        .map((part) => int.parse(part.trim()))
        .toList();

    final negatives = values.where((value) => value < 0).toList();

    if (negatives.isNotEmpty) {
      throw Exception('negative numbers not allowed ${negatives.join(',')}');
    }

    return values.fold(
      0,
      (sum, value) => sum + value,
    );
  }
}
