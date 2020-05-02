enum Status { pending, reversed, declined, completed }

/// Function handles the resolving a String input to a Status value
///
/// @param input The String input that we want to resolve
/// @param param2 Parameter description
/// @returns Status value corresponding the String input.
/// @throws FormatException if the given String input match with any of the Status values
Status resolveStatus(String input) {
  switch (input.toLowerCase()) {
    case 'pending':
      return Status.pending;
    case 'reversed':
      return Status.reversed;
    case 'declined':
      return Status.declined;
    case 'completed':
      return Status.completed;
    default:
      throw FormatException('$input matchs with any Status values');
  }
}

/// Function returns the String value related to the Status value
///
/// @param status The Status value that we want to return as String
/// @returns String value related to the Status value
/// @throws FormatException if the given status value has no String representation
String statusToString(Status status) {
  switch (status) {
    case Status.completed:
      return 'completed';
    case Status.pending:
      return 'pending';
    case Status.reversed:
      return 'reversed';
    case Status.declined:
      return 'declined';
    default:
      throw FormatException(
          '${status} value does not have a String representation');
  }
}
