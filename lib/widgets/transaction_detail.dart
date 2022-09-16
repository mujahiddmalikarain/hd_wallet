import 'package:e_wallet/provider/transaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/transaction.dart';
import 'transaction_item.dart';
class DetailTransactionScreen extends StatelessWidget {
   
  const DetailTransactionScreen({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
         var transaction = Provider.of<MyTransaction>(context, listen: true);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 10),
          child: Row(
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back_ios),
              ),
              const Text(
                "History Transactions",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF3D538F),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TransactionItem(
                transaction: transaction.transaction[index],
              );
            },
            itemCount: transaction.transaction.length,
          ),
        ),
      ],
    );
  }
}