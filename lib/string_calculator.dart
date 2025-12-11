class StringCalculator {
  int add(String numbers) {
    // return 0 for empty/whitespace input
    final trimmed = numbers.trim();
    if (trimmed.isEmpty) {
      return 0;
    }

    var separator = ',';

    // support custom delimiter header
    if (numbers.startsWith('//')) {
      final newlineIndex = numbers.indexOf('\n');
      separator = numbers.substring(2, newlineIndex);
      numbers = numbers.substring(newlineIndex + 1);
    }

    // newline as the active delimiter too
    numbers = numbers.replaceAll('\n', separator);

    // split by active delimiter
    final parts = numbers.split(separator);

    final values = parts
        .where((part) => part.trim().isNotEmpty)
        .map((part) => int.parse(part.trim()))
        .toList();

    // collect all negatives to give a helpful error
    final negatives = values.where((value) => value < 0).toList();

    if (negatives.isNotEmpty) {
      throw Exception('negative numbers not allowed ${negatives.join(',')}');
    }

    // sum, ignoring numbers greater than 1000
    return values.where((val) => val <= 1000).fold(
          0,
          (sum, value) => sum + value,
        );
  }
}
