import 'dart:io';

// list to store user profiles
List<Map<String, dynamic>> userProfiles = [
  {
    'firstName': 'yaman',
    'lastName': 'omar',
    'lastOrder': 'Espresso',
    'sdkPoints': 10
  },
  {
    'firstName': 'hashem',
    'lastName': 'm',
    'lastOrder': 'Cappuccino',
    'sdkPoints': 20
  }
];

Map<String, double> coffeePrices = {
  'Espresso': 2.00,
  'Café Latte': 2.50,
  'Cappuccino': 3.00,
  'Macchiato': 2.50,
  'Americano': 2.50,
  'Mocha': 3.50,
  'Iced Americano': 2.50,
  'Iced Café Latte': 2.00
};

Map<String, int> coffeeCalories = {
  'Espresso': 120,
  'Café Latte': 100,
  'Cappuccino': 130,
  'Macchiato': 155,
  'Americano': 50,
  'Mocha': 190,
  'Iced Americano': 144,
  'Iced Café Latte': 170
};

void main(List<String> arguments) {
  print("Welcome to SDK Coffee Shop!");
  print('-----------------------------------');

  // main loop for user interaction
  bool isRunning = true;
  while (isRunning) {
    String choice = askQuestion("""
What would you like to do?
1. Order Coffee
2. View Menu
3. Check SDK Points
4. Exit
Enter your choice (1-4):
""");

    switch (choice) {
      case '1':
        handleOrder();
        break;
      case '2':
        displayMenu();
        break;
      case '3':
        checkSdkPoints();
        break;
      case '4':
        print("Thank you for visiting SDK Coffee Shop. Goodbye!");
        isRunning = false;
        break;
      default:
        print("Invalid option. Please try again.");
    }
    print('-----------------------------------');
  }
}

// function to ask customer a question and get their response
String askQuestion(String question) {
  print(question);
  return stdin.readLineSync()!;
}

// function to display the coffee menu
void displayMenu() {
  print("\n--- Coffee Menu ---");
  coffeePrices.forEach((coffee, price) {
    int calories = coffeeCalories[coffee] ?? 0;
    print("$coffee - \$$price - $calories cal");
  });
}

// function to handle the coffee order process
void handleOrder() {
  List<String> coffeeOptions = [
    'Espresso',
    'Café Latte',
    'Cappuccino',
    'Macchiato',
    'Americano',
    'Mocha',
    'Iced Café Latte',
    'Iced Americano'
  ];

  print("Let's find the best coffee for you!");

  // collect customer preferences
  String strength = askQuestion(
      "How strong do you like your coffee? (strong, medium, light)");
  String milk = askQuestion("Do you like milk in your coffee? (yes/no)");
  String sweetness = askQuestion("Do you like your coffee sweet? (yes/no)");
  String temperature =
      askQuestion("Do you prefer hot or cold coffee? (hot/cold)");
  String cupSize = askQuestion("Choose your cup size: (small, medium, large)");

  // validate cup size
  selectCupSize(cupSize);

  // recommend a coffee based on preferences
  String recommendedCoffee =
      recommendCoffee(strength, milk, sweetness, temperature, coffeeOptions);

  if (recommendedCoffee != '') {
    double price = coffeePrices[recommendedCoffee] ?? 0.0;
    int calories = coffeeCalories[recommendedCoffee] ?? 0;
    print(
        'We recommend the $recommendedCoffee. It will cost \$$price, with $calories calories.');

    // adding order to user profile and SDK points
    String firstName = askQuestion("Enter your first name:");
    String lastName = askQuestion("Enter your last name:");

    updateUserProfile(firstName, lastName, recommendedCoffee);
  } else {
    print('Sorry, we could not find a match for your preferences.');
  }
}

// function to recommend coffee based on customer preferences
String recommendCoffee(String strength, String milk, String sweetness,
    String temperature, List<String> options) {
  for (String coffee in options) {
    if (coffee == 'Espresso' &&
        strength == 'strong' &&
        milk == 'no' &&
        sweetness == 'no' &&
        temperature == 'hot') {
      return 'Espresso';
    } else if (coffee == 'Café Latte' &&
        strength == 'medium' &&
        milk == 'yes' &&
        sweetness == 'no' &&
        temperature == 'hot') {
      return 'Café Latte';
    } else if (coffee == 'Cappuccino' &&
        strength == 'medium' &&
        milk == 'yes' &&
        sweetness == 'yes' &&
        temperature == 'hot') {
      return 'Cappuccino';
    } else if (coffee == 'Macchiato' &&
        strength == 'strong' &&
        milk == 'yes' &&
        sweetness == 'no' &&
        temperature == 'hot') {
      return 'Macchiato';
    } else if (coffee == 'Americano' &&
        strength == 'medium' &&
        milk == 'no' &&
        sweetness == 'no' &&
        temperature == 'hot') {
      return 'Americano';
    } else if (coffee == 'Mocha' &&
        strength == 'medium' &&
        milk == 'yes' &&
        sweetness == 'yes' &&
        temperature == 'hot') {
      return 'Mocha';
    } else if (coffee == 'Iced Café Latte' &&
        milk == 'yes' &&
        temperature == 'cold') {
      return 'Iced Café Latte';
    } else if (coffee == 'Iced Americano' &&
        milk == 'no' &&
        temperature == 'cold') {
      return 'Iced Americano';
    }
  }
  return '';
}

// function to select cup size
void selectCupSize(String size) {
  switch (size.toLowerCase()) {
    case 'small':
      print('You chose a small cup (250ml).');
      break;
    case 'medium':
      print('You chose a medium cup (350ml).');
      break;
    case 'large':
      print('You chose a large cup (450ml).');
      break;
    default:
      print('Invalid cup size.');
  }
}

// function to update user profile and SDK points
void updateUserProfile(String firstName, String lastName, String lastOrder) {
  bool userFound = false;
  for (var profile in userProfiles) {
    if (profile['firstName'] == firstName && profile['lastName'] == lastName) {
      profile['lastOrder'] = lastOrder;
      profile['sdkPoints'] += 10;
      print(
          "Order updated! You've earned 10 SDK points. Total SDK points: ${profile['sdkPoints']}.");
      userFound = true;
      break;
    }
  }
  if (!userFound) {
    userProfiles.add({
      'firstName': firstName,
      'lastName': lastName,
      'lastOrder': lastOrder,
      'sdkPoints': 10
    });
    print("Profile created! You've earned 10 SDK points.");
  }
}

// function to check SDK points
void checkSdkPoints() {
  String firstName = askQuestion("Enter your first name:");
  String lastName = askQuestion("Enter your last name:");
  for (var profile in userProfiles) {
    if (profile['firstName'] == firstName && profile['lastName'] == lastName) {
      print("You have ${profile['sdkPoints']} SDK points.");
      return;
    }
  }
  print("Profile not found.");
}
