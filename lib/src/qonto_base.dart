import 'dart:core';

import 'package:qonto/src/models/Label.dart';
import 'package:qonto/src/models/Membership.dart';
import 'package:qonto/src/models/Organization.dart';
import 'package:qonto/src/models/Transaction.dart';
import 'package:qonto/src/utils/httpAdapter.dart';

import 'models/Attachment.dart';
import 'models/Status.dart';

class Qonto {
  final String id;
  final String secret;

  const Qonto({this.id, this.secret});

  /// function returns the list of the members in the organization
  ///
  /// @returns The list of members
  Future<List<Membership>> get members async {
    var current_page = 1;
    var response;
    var result = <Membership>[];
    do {
      response = (await authorizedRequest(
          'memberships?current_page=${current_page}', id, secret));
      for (var i = 0; i < response['memberships'].toList().length; i++) {
        var membership = response['memberships'].toList()[i];
        result.add(Membership.fromJSON(membership));
      }
      current_page++;
    } while (response['meta']['total_pages'] >= current_page);
    return result;
  }

  /// Function returns the list of labels in the organization
  ///
  /// @returns The list of labels
  Future<List<Label>> get labels async {
    var current_page = 1;
    var response;
    var result = <Label>[];
    do {
      response = (await authorizedRequest(
          'labels?current_page=${current_page}', id, secret));
      for (var i = 0; i < response['labels'].toList().length; i++) {
        var label = response['labels'].toList()[i];
        result.add(Label.fromJSON(label));
      }
      current_page++;
    } while (response['meta']['total_pages'] >= current_page);
    return result;
  }

  /// Function returns the organization details
  ///
  /// @returns List of organization details
  Future<Organization> get organization async {
    var response = (await authorizedRequest(
        'organizations/${id}', id, secret))['organization'];
    return Organization.fromJSON(response);
  }

  /// Function returns transactions related to a bank account
  ///
  /// @param slug The slug of the bank account that we want to show transactions
  /// @param iban The iban of the bank account that we are searching
  /// @param status THe status of the transaction that we are looking
  /// @param updated_at_from The filter's from value on updated_at parameter
  /// @param updated_at_to The filter's to valud on updated_at parameter
  /// @param settled_at_from The from value of settled_at value filter
  /// @param settled_at_to The to value of settled_at value filter
  /// @param sort_by The attribute that we are sorting on
  /// @return List of transactions related to a bank account
  Future<List<Transaction>> transactions(String slug, String iban,
      {Status status,
      String updatedAtFrom,
      String updatedAtTo,
      String settledAtFrom,
      String settledAtTo,
      String sortBy}) async {
    var current_page = 1;
    var response;
    var result = <Transaction>[];
    do {
      var endpoint =
          'transactions?slug=${slug}&iban=${iban}&current_page=${current_page}';
      if (status != null) {
        endpoint += '&status=${statusToString(status)}';
      }
      if (updatedAtFrom != null) {
        endpoint += '&updated_at_from=${updatedAtFrom}';
      }
      if (updatedAtTo != null) {
        endpoint += '&updated_at_to=${updatedAtTo}';
      }
      if (settledAtFrom != null) {
        endpoint += '&settled_at_from=${settledAtFrom}';
      }
      if (settledAtTo != null) {
        endpoint += '&settled_at_to=${settledAtTo}';
      }
      if (sortBy != null) {
        endpoint += '&sort_by=${sortBy}';
      }
      response = (await authorizedRequest(endpoint, id, secret));
      for (var i = 0; i < response['transactions'].length; i++) {
        var transaction = response['transactions'][i];
        result.add(Transaction.fromJSON(transaction));
      }
      current_page++;
    } while (response['meta']['total_pages'] >= current_page);
    return result;
  }

  /// Function returns the attachment details from the given attachment id
  ///
  /// @returns The attachment searched with the given id
  Future<Attachment> attachment(String attachmentId) async {
    var response =
        (await authorizedRequest('attachments/${attachmentId}', id, secret));
    return Attachment.fromJSON(response['attachment']);
  }
}
