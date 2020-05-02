import 'package:qonto/qonto.dart';
import 'dart:io' show Platform;

void main(List<String> arguments)  {
    
    var envVars = Platform.environment;

    var qonto = Qonto(
      id: envVars['QONTO_ID'],
      secret: envVars['QONTO_SECRET']
    );

    qonto.members.then((result) {
      print('Members list');
      print(result);
    });
    
    qonto.labels.then((result) {
      print('Labels list');
      print(result);
    });

    qonto.organization.then((result) {
      print('Organization details');
      print(result.toString());
      qonto.transactions(result.slug, result.bankAccounts[0].iban).then((res) {
        print(res.toString());
      });
    });

    qonto.attachment(envVars['QONTO_TEST_ATTACHMENT']).then((res) {
      print(res.toString());
    });

}
