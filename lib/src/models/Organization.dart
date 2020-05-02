import 'package:qonto/src/models/BankAccount.dart';

class Organization {
  final String slug;
  final List<BankAccount> bankAccounts;

  Organization({
    this.slug,
    this.bankAccounts
  }) {
    ArgumentError.checkNotNull(slug, 'slug');
    ArgumentError.checkNotNull(bankAccounts, 'bankAccounts');
  }

  /// Function constructs an Organization object from API's JSON response
  ///
  /// @param json The JSON object returned from API
  /// @returns Returns the Organization object constructed from API's json.
  /// @throws Throws ArgumentError object from APIs result
  static Organization fromJSON(Map<String,dynamic> json) {
    return Organization(
      slug: json['slug'],
      bankAccounts: <BankAccount>[...(json['bank_accounts'].toList().map((account) {
        return BankAccount.fromJSON(account);
      }).toList())],
    );
  }

  /// Function returns the String representation of the Organization object
  /// 
  /// @returns The String representation of the Organization object
  @override
  String toString() {
    var result = '';
    result += 'Slug: ${slug}\n';
    result += 'Bank accounts: ${bankAccounts.toString()}';
    return result;
  }

}