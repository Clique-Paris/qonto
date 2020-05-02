class BankAccount {
  final String slug;
  final String iban;
  final String bic;
  final String currency;
  final double balance;
  final int balanceCents;
  final double authorizedBalance;
  final int authorizedBalanceCents;

  BankAccount({
    this.slug,
    this.iban,
    this.bic,
    this.currency,
    this.balance,
    this.balanceCents,
    this.authorizedBalance,
    this.authorizedBalanceCents,
  }) {
    ArgumentError.checkNotNull(slug, 'slug');
    ArgumentError.checkNotNull(iban, 'iban');
    ArgumentError.checkNotNull(bic, 'bic');
    ArgumentError.checkNotNull(currency, 'currency');
    ArgumentError.checkNotNull(balance, 'balance');
    ArgumentError.checkNotNull(balanceCents, 'balanceCents');
    ArgumentError.checkNotNull(authorizedBalance, 'authorizedBalance');
    ArgumentError.checkNotNull(authorizedBalanceCents, 'authorizedBalanceCents');
  }

  /// Function constructs a BankAccount object from the JSON returned from API
  ///
  /// @param json The JSON object that we got from API
  /// @returns Returns the BankAccount object constructed from API's json object.
  /// @throws Throws an ArgumentError if there's a missing attribute on BankAccount constructor
  static BankAccount fromJSON(Map<String, dynamic> json) {
    return BankAccount(
      slug: json['slug'],
      iban: json['iban'],
      bic: json['bic'],
      currency: json['currency'],
      balance: json['balance'],
      balanceCents: json['balance_cents'],
      authorizedBalance: json['authorized_balance'],
      authorizedBalanceCents: json['authorized_balance_cents']
    );
  }

  /// Function returns the String representation of a BankAccount instance
  /// 
  /// @returns The string representation of a BankAccount object
  @override
  String toString() {
    var result = '';
    result += 'Slug: ${slug}\n';
    result += 'Iban: ${iban}\n';
    result += 'Bic: ${bic}\n';
    result += 'Currency ${currency}\n';
    result += 'Balance ${balance}\n';
    result += 'Balance cents: ${balanceCents}\n';
    result += 'Authorized balance: ${authorizedBalance}\n';
    result += 'Authorized balance cents: ${authorizedBalanceCents}';
    return result;
  }

}