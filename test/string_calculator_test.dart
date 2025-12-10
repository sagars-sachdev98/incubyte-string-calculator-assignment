import 'package:incubyte_string_calculator_assignment/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group(
    'StringCalculator.add',
    () {
      late StringCalculator calculator;

      setUp(
        () {
          calculator = StringCalculator();
        },
      );

      test(
        'returns 0 for empty string input',
        () {
          final result = calculator.add('');

          expect(result, 0);
        },
      );

      test(
        'returns the number itself if single number input',
        () {
          final result = calculator.add('1');

          expect(result, 1);
        },
      );

      test(
        'returns sum of two comma separated numbers',
        () {
          final result = calculator.add('1,5');

          expect(result, 6);
        },
      );

      test('returns sum for n number of comma separated numbers', () {
        final result = calculator.add('1,5,3,4');

        expect(result, 13);
      });

      test(
        'supports newlines between numbers along with commas',
        () {
          final result = calculator.add('1\n2,3');

          expect(result, 6);
        },
      );
    },
  );
}
