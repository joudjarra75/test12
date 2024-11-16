import 'dart:ffi';
import 'dart:io';

// **** ATM Machine **** //
// Variable ...... (Opation ) ...... //
double Balance = 1000;
int Deposit = 0;
int Withdraw = 0;
int Password = 4102004;
int Choice = 0;
int Problem = 0;
int PhoneNumber = 0;
int Code = 0;
int Password2 = 123456;

//****  Showlist : function to know all the things that can be done   **** //
void Showlist() {
  print(" ***  WELCOME  ***");
  print("  __________________________");
  print(" | 1.  Balance              |");
  print(" | 2.  Withdraw             |");
  print(" | 3.  Deposit              |");
  print(" | 4.  Do you have problem ?|");
  print(" | 5.  Exsit                |");
  print(" |__________________________|");
}

// ***  Procedure: function to know the process that the user wants  ***//
void Procedure() {
  stdout.write("Please , Enter your password : ");
  Password = int.parse(stdin.readLineSync()!);
  do {
    if (Password == 4102004) {
      print(" Please , Enter your choice :  ");
      Choice = int.parse(stdin.readLineSync()!);

      switch (Choice) {
        case 1:
          print("Your balance is : $Balance");
          break;
        case 2:
          print(" **Note** : Your balance is  $Balance");
          print("Please , Enter your amount  : ");
          Withdraw = int.parse(stdin.readLineSync()!);
          if (Withdraw > Balance) {
            print("Sorry, You can't withdraw this amount ");
          } else {
            Balance -= Withdraw;
            print("Now , Your balance is  : $Balance");
          }
          break;
        case 3:
          print("Your current balance is : $Balance");
          print("Please , Enter your deposit money :  ");
          Deposit = int.parse(stdin.readLineSync()!);
          if (Deposit < 1000) {
            Balance += Deposit;
          } else {
            print("Sorry , You can not deposit the amount ");
          }
          print(" Now , Your new balance is : $Balance ");
          break;
        case 4:
          ListofProblem();
          break;
        case 5:
          print("Thank You ...");
      }
    } else {
      String option = 's';
      print(
          "Password is incorrect , Do you want to try again ? Enter 'Y' for Yes or 'N' for No ");
      option = stdin.readLineSync()!;
      if (option == 'Y' || option == 'y') {
        print("Please , Inter your password again ..");
        Password = int.parse(stdin.readLineSync()!);
      } else {
        Choice = 5;
      }
    }
  } while (Choice < 5);
}

void ListofProblem() {
  print("***Problem***");
  print(
      " 1.  Do not send a text message to my phone after performing any banking transaction ");
  print(
      " 2.  I have two accounts , and when I enter the password for the other account , no banking transaction can be performed");
  print(" 3.  Do not deposit an amount of one thousand dinars or more  ");
  print(" 4. Problem solved");
  Solveproblem();
}

void Solveproblem() {
  print("Please , Determine the type of problem ..");
  Problem = int.parse(stdin.readLineSync()!);

  switch (Problem) {
    case 1:
      print(
          "You must go to bank to confirm your number if it has been changed ");
      break;
    case 2:
      stdout.write(" Please, Enter your phone number : ");
      PhoneNumber = int.parse(stdin.readLineSync()!);
      print("If a code was sent to your phone , Please enter it :");
      Code = int.parse(stdin.readLineSync()!);
      print("Now , please inter your password2 again :");
      Password2 = int.parse(stdin.readLineSync()!);
      if (Password2 == 123456) {
        stdout
            .write("Now , Try again to perform the operation you want again..");
      } else {
        print("Sorry , You should contact the bank as soon as possible !");
      }
      break;
    case 3:
      print(
          " It's the bank's policy that it is not possible to deposit an amount of one thousand dinnars or more ");

    case 4:
      print(" Problem solved");
  }
}

void main() {
  Showlist();
  Procedure();
}
