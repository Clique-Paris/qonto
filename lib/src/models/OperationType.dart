enum OperationType {
  transfer,
  card,
  directDebit,
  income,
  qontoFee,
  cheque
}

/// Function resolves the given String to an OperationType value
///
/// @param input The String input that we want to resolve
/// @returns Returns the OperationType value corresponding with the given String.
/// @throws Format exception if the given String does not match with any OperationType values
OperationType resolveOperationType (String input) {
  switch (input.toLowerCase()) {
    case 'transfer':
      return OperationType.transfer;
    case 'card':
      return OperationType.card;
    case 'direct_debit':
      return OperationType.directDebit;
    case 'income':
      return OperationType.income;
    case 'qonto_fee':
      return OperationType.qontoFee;
    case 'cheque':
      return OperationType.cheque;
    default:
      throw FormatException('$input does not match with any OperationType');
  }
}