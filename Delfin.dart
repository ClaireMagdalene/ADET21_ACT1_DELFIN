
import 'dart:io';

typedef PassInt = void Function(int);

main() async {
  var bnk = BankAccount();
  var ans;
  var new;

  while (ans != 4) {
    // get balance
    var file = File("bank.txt");
    var contents;
    String balance;
    // read contents
    contents = await file.readAsString();
    // convert to double
    double.parse(contents);
    balance = contents;

    stdout.writeln("--- Menu ---");
    stdout.writeln("1. Balance");
    stdout.writeln("2. Withdraw");
    stdout.writeln("3. Deposit");
    stdout.writeln("4. Exit");
    stdout.writeln("------------");
    stdout.writeln("Enter Menu No: ");
    ans = stdin.readLineSync();

    if (ans == '1') {
      // Balance
      bnk.get_balance(balance);
    } else if (ans == '2') {
      // Withdraw
      new = bnk.withdraw(balance);
      // Rewrite File
      var bank_update = await File('bank.txt').writeAsString(new);
    } else if (ans == '3') {
      // Deposit
      new = bnk.deposit(balance);
      // Rewrite File
      var bank_update = await File('bank.txt').writeAsString(new);
    } else if (ans == '4') {
      // Exit
      stdout.writeln("Thank You!");
      exit(0);
    } else {
      // Invalid Input
      stdout.writeln("Invalid Input!");
    }
  }

  //var bank_update = await File('bank.txt').writeAsString(balance);
}

class bank_action {
  var value;
  double new = 0;

  void get_balance(var balance) {
    stdout.writeln("Balance is $balance");
  }


  String withdraw(var balance) {
    stdout.writeln("Enter Value to Withdraw:");
    value = stdin.readLineSync();
    new = double.parse(balance) - double.parse(value);
    return new.toString();
  }


  String deposit(var balance) {
    stdout.writeln("Enter Value to Deposit:");
    value = stdin.readLineSync();
    new = double.parse(balance) + double.parse(value);
    return new.toString();
  }
}

class BankAccount implements bank_action {
  var value;
  double new = 0;
  // get balance
  void get_balance(var balance) {
    stdout.writeln("Balance is $balance");
  }

  String withdraw(var balance) {
    stdout.writeln("Enter Value to Withdraw:");
    value = stdin.readLineSync();
    new = double.parse(balance) - double.parse(value);
    // print new
    stdout.writeln("New Balance is $new");
    return new.toString();
  }

  String deposit(var balance) {
    stdout.writeln("Enter Value to Deposit:");
    value = stdin.readLineSync();
    new = double.parse(balance) + double.parse(value);
    // print new
    stdout.writeln("New Balance is $new");
    return new.toString();
  }
}
