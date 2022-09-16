import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final  transaction;
  const TransactionItem({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var date = new DateTime.fromMicrosecondsSinceEpoch(int.parse(transaction['timeStamp']));
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF3D538F),
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 132, 187, 232),
                borderRadius: BorderRadius.circular(10)),
            child: SizedBox(
              width: 35,
              height: 35,
              child: Center(
                child: Text(
                  transaction['transactionIndex'].toString(),
                  style: const TextStyle(
                    color: Color(0xFF3D538F),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Image.network(
              //   this.image,
              // ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child:   Container(
                  width: 120,
                  child: Text(
                    "From:"+transaction['from'].toString(),
                    
                  
                    style: TextStyle(color: Colors.green, fontSize: 15,overflow: TextOverflow.ellipsis),
                  ),
                ),
                ),
                Text(
                 date.toString(),
                  style:
                      const TextStyle(color: Color(0xFF3D538F), fontSize: 14),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child:  Container(
                  width: 120,
                  child: Text(
                    "To:"+transaction['to'].toString(),
                    
                  
                    style: TextStyle(color: Colors.green, fontSize: 15,overflow: TextOverflow.ellipsis),
                  ),
                ),
              ),
              Text(
               ' transaction.description',
                style: const TextStyle(color: Color(0xFF3D538F), fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
