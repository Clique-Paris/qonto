# Qonto Online Banking Dart SDK

[![Clique-Paris](https://circleci.com/gh/Clique-Paris/qonto.svg?style=svg)](https://app.circleci.com/pipelines/github/Clique-Paris/qonto)

Dart implementation of [Qonto's REST API v2](https://api-doc.qonto.eu/2.0).

## A simple usage example:

**Important:** To execute the example code, you need to have following environment variables: `QONTO_ID` your Qonto API id, `QONTO_SECRET` your Qonto API secret and `QONTO_TEST_ATTACHMENT` an attachment id got from transaction details. For more information please check [Qonto API's Authentification guide](https://api-doc.qonto.eu/2.0/welcome/authentication)

```dart
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
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/Clique-Paris/qonto/issues
