import 'package:flutter/services.dart';

import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;

class EthereumUtils {
  late Web3Client web3client;
  var balance;
  late http.Client httpClient;
  final contractAddress = "0xeddf6eb0901FC1C7fEAe000728Be55bC5e39602b";
  var walletAddress = '0xcD4BD0573890251DecC260b58704c38eEBed8214';

  void initial() async {
    httpClient = http.Client();
    String infuraApi =
        "https://rinkeby.infura.io/v3/91164ea6f3934a94979612d7a7503297";
    web3client = Web3Client(infuraApi, httpClient);

// var credentials = web3client.credentialsFromPrivateKey('0c1c00f5b5475493e8c5ca7363d239b92ba12c5c1675ee1e3e681f4bde4eea7e');
// var pKey = EthPrivateKey.fromHex('0c1c00f5b5475493e8c5ca7363d239b92ba12c5c1675ee1e3e681f4bde4eea7e');
    var address = EthereumAddress.fromHex(walletAddress);
// You can now call rpc methods. This one will query the amount of Ether you own
    var data = await web3client.getBalance(address);
    
  
    print(balance);
  }

  // Future getBalance() async {
  //   final contract = await getDeployedContract();
  //   final etherFunction = contract.function("getbalance");
  //   final result = await web3client.call(contract: contract, function: etherFunction, params: []);
  //   print(result);
  //   List<dynamic> res = result;
  //   return res[0];
  // }

  // Future<String> sendBalance(int amount) async {
  //   var bigAmount = BigInt.from(amount);
  //   EthPrivateKey privateKeyCred = EthPrivateKey.fromHex('0xcD4BD0573890251DecC260b58704c38eEBed8214');

  //   DeployedContract contract = await getDeployedContract();
  //   final etherFunction = contract.function("sendbalance");
  //   final result = await web3client.sendTransaction(
  //       privateKeyCred,
  //       Transaction.callContract(
  //         contract: contract,
  //         function: etherFunction,
  //         parameters: [bigAmount],
  //         maxGas: 1,
  //       ),chainId: 4,
  //       fetchChainIdFromNetworkId: false);
  //   return result;
  // }

  // Future<String> withDrawBalance(int amount) async {
  //   var bigAmount = BigInt.from(amount);
  //   EthPrivateKey privateKeyCred = EthPrivateKey.fromHex('0xcD4BD0573890251DecC260b58704c38eEBed8214');
  //   DeployedContract contract = await getDeployedContract();
  //   final etherFunction = contract.function("withDrawBalance");
  //   final result = await web3client.sendTransaction(
  //       privateKeyCred,
  //       Transaction.callContract(
  //         contract: contract,
  //         function: etherFunction,
  //         parameters: [bigAmount],
  //         maxGas: 100000,
  //       ),chainId: 4,
  //       fetchChainIdFromNetworkId: false);
  //   return result;

  // }

  // Future<DeployedContract> getDeployedContract() async {
  //   String abi = await rootBundle.loadString("assets/abi.json");
  //   final contract = DeployedContract(ContractAbi.fromJson(abi, "BasicDapp"), EthereumAddress.fromHex(contractAddress!));
  //   return contract;
  // }
}
