import 'package:incubyte_string_calculator_assignment/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group(
    'StringCalculator.add',
    () {
      test(
        'returns 0 for empty string input',
        () {
          final calculator = StringCalculator();

          final result = calculator.add('');

          expect(result, 0);
        },
      );

      test(
        'returns the number itself if single number input',
        () {
          final calculator = StringCalculator();

          final result = calculator.add('1');

          expect(result, 1);
        },
      );
    },
  );
}
