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

      test(
        'supports custom delimiter header',
        () {
          final result = calculator.add('//;\n1;2');

          expect(result, 3);
        },
      );

      test(
        'throws when input contains a negative number',
        () {
          expect(
            () => calculator.add('1,-2,3'),
            throwsA(isA<Exception>()),
          );
        },
      );

      test(
        'include all negative numbers in the exception message',
        () {
          try {
            calculator.add('1,-2,3,-5');
            fail('Expected Exception for negative numbers');
          } on Exception catch (e) {
            // toString() for Exception will contain our message
            expect(
              e.toString(),
              'Exception: negative numbers not allowed -2,-5',
            );
          }
        },
      );
    },
  );
}
