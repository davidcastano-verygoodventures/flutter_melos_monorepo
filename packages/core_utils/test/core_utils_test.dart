import 'package:core_utils/core_utils.dart';
import 'package:test/test.dart';

void main() {
  group('Calculator', () {
    final calculator = Calculator();

    test('add logic', () {
      expect(calculator.add(1, 2), 3);
    });
  });
}
