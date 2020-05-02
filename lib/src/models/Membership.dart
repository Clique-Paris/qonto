class Membership {
  final String id;
  final String firstName;
  final String lastName;

  Membership({
    this.id,
    this.firstName,
    this.lastName,
  }) {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(firstName, 'firstName');
    ArgumentError.checkNotNull(lastName, 'lastName');
  }

  static Membership fromJSON(Map<String, dynamic> json) {
    return Membership(
        id: json['id'],
        firstName: json['first_name'],
        lastName: json['last_name']);
  }

  /// Function returns the String representation of the Mmebership object
  ///
  /// @returns The string repsentation of the Membership object
  @override
  String toString() {
    var result = '';
    result += 'Id: ${id}\n';
    result += 'First name: ${firstName}\n';
    result += 'Last name: ${lastName}';
    return result;
  }
}
