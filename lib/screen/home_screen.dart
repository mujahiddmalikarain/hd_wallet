import 'package:e_wallet/provider/transaction.dart';
import 'package:e_wallet/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../models/etherrum_util.dart';
import '../models/transaction.dart';
import '../widgets/menu_box.dart';
import '../widgets/transaction_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  EthereumUtils ethUtils = EthereumUtils();



  @override
  void initState() {
    // TODO: implement initState
     ethUtils.initial();
    print(ethUtils.balance.toString());
  
    var transaction = Provider.of<MyTransaction>(context, listen: false);
    transaction.getTransactions();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     
      var transaction = Provider.of<MyTransaction>(context, listen: true);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade800,
              Colors.white60,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.blueGrey,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            NetworkImage('https://i.pravatar.cc/150?img=11'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Hello,",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Mujhaid",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Stack(
                      children: const [
                        Icon(
                          Icons.notifications_none_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                        Positioned(
                          top: 0.0,
                          right: 0.0,
                          child: Icon(
                            Icons.brightness_1,
                            size: 8.0,
                            color: Colors.redAccent,
                          ),
                        )
                      ],
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              child: Column(
                children:  [
                  Text(
                    "Balance",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(ethUtils.balance.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),)
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  MenuWidget(
                    icon: Icons.send_rounded,
                    text: "Send",
                  ),
                  MenuWidget(
                    icon: Icons.account_balance_wallet,
                    text: "Account balance",
                  ),
                  MenuWidget(
                    icon: Icons.payment,
                    text: "recieves",
                  ),
                  MenuWidget(
                    icon: Icons.more_horiz,
                    text: "more",
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 50),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 25,
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text(
                              "Transactions",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF3D538F),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext ctx) {
                                  return const DetailTransactionScreen();
                                },
                              );
                            },
                            child: const Text(
                              'more',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF3D538F),
                              ),
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
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.receipt_rounded,
              ),
              label: 'Transaction'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.credit_card,
              ),
              label: 'About'),
        ],
        selectedItemColor: const Color(0xFF3D538F),
        unselectedItemColor: const Color(0xFF3D538F),
      ),
    );
  }
}
