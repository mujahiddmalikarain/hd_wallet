import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class MyTransaction with ChangeNotifier {
  /// Get all transaction//

  List _transaction = [];

  List get transaction {
    return _transaction;
  }

  bool transactionloading = true;
  Future<void> getTransactions() async {
    transactionloading = true;

    var url = Uri.parse(
        'https://api-rinkeby.etherscan.io/api?module=account&action=txlist&address=0xcD4BD0573890251DecC260b58704c38eEBed8214&startblock=0&endblock=99999999&page=1&offset=10&sort=asc&apikey=4WAY2E3TQI89I6FAEZJ296PVXMU6T3DPRY');

    try {
      final response = await http.post(url);
      print(response.statusCode);
      final responseData = json.decode(response.body);

      if (responseData['status'] == '1') {
        transactionloading = false;
        _transaction = responseData['result'];
        print(_transaction);

        notifyListeners();
      } else {
        transactionloading = false;
        notifyListeners();
      }

      return notifyListeners();
    } catch (error) {
      transactionloading = false;

      notifyListeners();
      // throw error;
      return;
    }
  }
}
