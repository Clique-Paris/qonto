import 'package:qonto/src/models/OperationType.dart';
import 'package:qonto/src/models/Side.dart';
import 'package:qonto/src/models/Status.dart';

class Transaction {
  final String transactionId;
  final double amount;
  final int amountCents;
  final List<String> attachmentIds;
  final double localAmount;
  final int localAmountCents;
  final Side side;
  final OperationType operationType;
  // TODO: Change with ISO-4217 currency types
  final String currency;
  final String localCurrency;
  final String label;
  final DateTime emittedAt;
  final DateTime settledAt;
  final DateTime updatedAt;
  final Status status;
  final String note;
  final String reference;
  final double vatAmount;
  final double vatRate;
  final int vatAmountCents;
  final String initiatorId;
  final List<String> labelIds;
  final bool attachmentLost;
  final bool attachmentRequired;

  Transaction(
      {this.transactionId,
      this.amount,
      this.amountCents,
      this.attachmentIds,
      this.localAmount,
      this.localAmountCents,
      this.side,
      this.operationType,
      this.currency,
      this.localCurrency,
      this.label,
      this.emittedAt,
      this.settledAt,
      this.updatedAt,
      this.status,
      this.note,
      this.reference,
      this.vatAmount,
      this.vatRate,
      this.vatAmountCents,
      this.initiatorId,
      this.labelIds,
      this.attachmentLost,
      this.attachmentRequired}) {
    ArgumentError.checkNotNull(transactionId, 'transaction_id');
    ArgumentError.checkNotNull(amount, 'amount');
    ArgumentError.checkNotNull(amountCents, 'amount_cents');
    ArgumentError.checkNotNull(localAmountCents, 'local_amount_cents');
    ArgumentError.checkNotNull(side, 'side');
    ArgumentError.checkNotNull(currency, 'currency');
    ArgumentError.checkNotNull(label, 'label');
    ArgumentError.checkNotNull(emittedAt, 'emitted_at');
    ArgumentError.checkNotNull(updatedAt, 'updated_at');
    ArgumentError.checkNotNull(status, 'status');
  }

  /// Function creates a Transaction object from JSON
  ///
  /// @param json The JSON value got from API result
  /// @param param2 Parameter description
  /// @returns Returns the Transaction object constructed from API's JSON return.
  /// @throws ArgumentError related to the Transaction constructor if there's any missing required parameters
  static Transaction fromJSON(Map<String, dynamic> json) {
    return Transaction(
        transactionId: json['transaction_id'],
        amount: json['amount'],
        amountCents: json['amount_cents'],
        attachmentIds: <String>[...json['attachment_ids']],
        localAmount: json['local_amound'],
        localAmountCents: json['local_amount_cents'],
        side: resolveSide(json['side']),
        operationType: json['operaion_type'] != null
            ? resolveOperationType(json['opeation_type'])
            : null,
        currency: json['currency'],
        localCurrency: json['local_currency'],
        label: json['label'],
        settledAt: DateTime.parse(json['settled_at']),
        emittedAt: DateTime.parse(json['emitted_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        status: resolveStatus(json['status']),
        note: json['note'],
        reference: json['reference'],
        vatAmount: json['vat_amount'],
        vatAmountCents: json['vat_amount_cents'],
        vatRate: json['vat_rate'] != null ? json['vat_rate'].toDouble() : null,
        initiatorId: json['initiator_id'],
        labelIds: <String>[...json['label_ids']],
        attachmentLost: json['attachment_lost'],
        attachmentRequired: json['attachment_required']);
  }

  /// Function returns the String representation of a Transaction instance
  ///
  /// @returns Returns the String representation of a Transaction object.
  @override
  String toString() {
    var result = '';
    result += 'Transaction id: ${transactionId}\n';
    result += 'Amount: ${amount}\n';
    result += 'Amount cents: ${amountCents}\n';
    result += 'Attachment ids: ${attachmentIds}\n';
    result += 'Local amount: ${localAmount}\n';
    result += 'Local amount cents: ${localAmountCents}\n';
    result += 'Side: ${side}\n';
    result += 'Operation type: ${operationType}\n';
    result += 'Currency: ${currency}\n';
    result += 'Local currency: ${localCurrency}\n';
    result += 'Label: ${label}\n';
    result += 'Emitted at: ${emittedAt.toIso8601String()}\n';
    result += 'Settled at: ${settledAt.toIso8601String()}\n';
    result += 'Updated at: ${updatedAt.toIso8601String()}\n';
    result += 'Status: ${status}\n';
    result += 'Note: ${note}\n';
    result += 'Reference: ${reference}\n';
    result += 'Vat amount: ${vatAmount}\n';
    result += 'Vat rate: ${vatRate}\n';
    result += 'Vat amount cents: ${vatAmountCents}\n';
    result += 'Initiator id: ${initiatorId}\n';
    result += 'Label ids: ${labelIds}\n';
    result += 'Attachment lost ${attachmentLost}\n';
    result += 'Attachment required ${attachmentRequired}';
    return result;
  }
}
