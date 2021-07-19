import 'package:flutter_test/flutter_test.dart';
import 'package:the_meal_app/exceptions/network_exception.dart';

void main() {
  test('Should NetworkException is a Exception', () {
    expect(NetworkException(), isException);
  });

  test('Should return is a default toString()', () {
    expect(NetworkException().toString(), equals('NetworkException'));
  });

  test('Should return a custom message', () {
    expect(NetworkException(message: 'Custom message').toString(),
        equals('Custom message'));
  });
}
