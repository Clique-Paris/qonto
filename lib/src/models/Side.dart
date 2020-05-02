enum Side { debit, credit }

/// Function resolve the Side value from given String
///
/// @param input The String value to resolve
/// @returns The Side value corresponding the given String input.
/// @throws FormatException is the given String does not match with any values
Side resolveSide(String input) {
  switch (input.toLowerCase()) {
    case 'debit':
      return Side.debit;
    case 'credit':
      return Side.credit;
    default:
      throw FormatException('$input does not match with any Side values');
  }
}
