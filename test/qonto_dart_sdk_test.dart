import 'package:qonto/qonto.dart';
import 'package:test/test.dart';
import 'dart:io' show Platform;

void main() {
  group('A group of tests', () {
    Qonto qonto;
    Map<String, String> envVars;

    setUp(() {
      envVars = Platform.environment;
      qonto = Qonto(id: envVars['QONTO_ID'], secret: envVars['QONTO_SECRET']);
    });

    test('Test if members works', () async {
      expect((await qonto.members), isNotEmpty);
    });

    test('Test if labels workd', () async {
      expect((await qonto.labels), isNotNull);
    });

    test('Test if organizaion works', () async {
      expect((await qonto.organization), isNotNull);
    });

    test('Test if members works', () async {
      expect((await qonto.members), isNotEmpty);
    });

    test('Test if attachment details works', () async {
      expect((await qonto.attachment(envVars['QONTO_TEST_ATTACHMENT'])),
          isNotNull);
    });

    test('Test if transactions works', () async {
      var org = await qonto.organization;
      expect((await qonto.transactions(org.slug, org.bankAccounts[0].iban)),
          isNotEmpty);
    });
  });
}
