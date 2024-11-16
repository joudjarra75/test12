import 'dart:io';

// Global variables
String name = '';
int age = 0;
int height = 0;
int currentWeight = 0;
int usualWeight = 0;
String gender = '';
int activityLevel = 0;
String goal = '';
List<String> listOfUsername = ["yaman", "hashem"];
List<String> listOfpassword = ["1", "2"];

void main(List<String> arguments) {
  try {
    loginvalue();
    printuserinfo();
  } catch (e) {
    print("An unexpected error occurred: $e");
  }
}

void login() {
  try {
    print("------------------------------");
    print("Enter your username to login:");
    String newUsername = stdin.readLineSync()!;
    print("Enter your password to login:");
    String newPassword = stdin.readLineSync()!;
    print("-----------------------------");

    for (int cnt = 0; cnt < listOfUsername.length; cnt++) {
      if (listOfUsername[cnt] == newUsername &&
          listOfpassword[cnt] == newPassword) {
        print("     *Login successfully*\n\n");
        allfun();
        return;
      }
    }

    print("Invalid username or password. Please try again.");
    loginvalue();
  } catch (e) {
    print("error during login $e ");
  }
}

void loginvalue() {
  try {
    print("-----------------------------------------------------------------");
    print("""before we start enter \'login\' if you have username and password.
to sign up write \'sign up\' 
to join as a guest write \'guest\' """);
    print("-----------------------------------------------------------------");
    String loginValue = stdin.readLineSync()!;
    if (loginValue == "login") {
      login();
    } else if (loginValue == "sign up") {
      registration();
    } else if (loginValue == "guest") {
      print("\n(joining as a guest ... done) ");
      allfun();
    } else {
      print("wrong value ");
      loginvalue();
    }
  } catch (e) {
    print("error during login value seection $e");
  }
}

void registration() {
  try {
    print("--------------------------------");
    print("Enter your new username to sign up  ");
    String registrationUsername = stdin.readLineSync()!;
    print("Enter your new password to sign up ");
    String registrationPassword = stdin.readLineSync()!;

    listOfUsername.add(registrationUsername);
    listOfpassword.add(registrationPassword);
    login();
  } catch (e) {
    print("error during registration $e");
  }
}

void informationIntro() {
  try {
    stdout.write("\nWelcome to our online clinic for a better life!\n");
    stdout.write("By using our clinic, you can know:\n");
    stdout.write("""\n
----------------------------
-BMI test
-Ideal body weight
-Nutritional requirements
-Diet plans
----------------------------
\n""");
    print(
        "____________________________________________________________________________________________________________");
    while (true) {
      try {
        stdout.write("\nPlease insert your name: ");
        name = stdin.readLineSync()!;
        break;
      } catch (e) {
        print("un invalid name please try again");
      }
    }

    while (true) {
      try {
        stdout.write("\nPlease enter your age (between 4 and 100): ");
        age = int.parse(stdin.readLineSync()!);
        if (age >= 4 && age <= 100) break;
        print("Invalid age. Please enter a value between 4 and 100.");
      } catch (e) {
        print("Error: Please enter a valid age.");
      }
    }
    while (true) {
      try {
        stdout.write(
            "\nPlease enter your height in centimeters (between 80 and 230): ");
        height = int.parse(stdin.readLineSync()!);
        if (height >= 80 && height <= 230) break;
        print("Invalid height. Please enter a value between 80 and 230 cm.");
      } catch (e) {
        print("Error: Please enter a valid height.");
      }
    }

    while (true) {
      try {
        stdout.write(
            "\nPlease enter your current weight in kilograms (between 20 and 200): ");
        currentWeight = int.parse(stdin.readLineSync()!);
        if (currentWeight >= 20 && currentWeight <= 200) break;
        print("Invalid weight. Please enter a value between 20 and 200 kg.");
      } catch (e) {
        print("Error: Please enter a valid weight.");
      }
    }

    while (true) {
      try {
        stdout.write(
            "\nPlease enter your usual weight in kilograms (between 20 and 200): ");
        usualWeight = int.parse(stdin.readLineSync()!);
        if (usualWeight >= 20 && usualWeight <= 200) break;
        print("Invalid weight. Please enter a value between 20 and 200 kg.");
      } catch (e) {
        print("Error: Please enter a valid weight.");
      }
    }

    while (true) {
      try {
        stdout.write("\nPlease enter your gender (male/female): ");
        gender = stdin.readLineSync()!.toLowerCase();
        if (gender == "male" || gender == "female") break;
        print("Invalid input. Please enter 'male' or 'female'.");
      } catch (e) {
        print("Error: Please enter a valid gender.");
      }
    }
  } catch (e) {
    print("Error during information input: $e");
  }
  print(
      "____________________________________________________________________________________________________________");
}

void diseases() {
  print(
      "\nMention if you have any diseases such as diabetes or high blood pressure.\n*Note*: If none, enter 'no'.");
  String choiceDiseases = stdin.readLineSync()!.toLowerCase();

  if (choiceDiseases == "diabetes" || choiceDiseases == "high blood pressure") {
    print("\nPlease be cautious and follow a balanced plan with a doctor.");
  } else if (choiceDiseases == "no") {
    print("\nGreat! No health issues reported.");
  } else {
    print("\nInvalid input. Please re-enter your response.");
    diseases();
  }
  print(
      "____________________________________________________________________________________________________________");
  print("");
}

void exercise() {
  print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
  print("""\nChoose your activity level:

1 - Little to no exercise
2 - Light exercise (1-3 days/week)
3 - Moderate exercise (3-5 days/week)
4 - Heavy exercise (6-7 days/week)
5 - Very heavy exercise (twice/day, extra heavy workouts)""");

  stdout.write("Enter your choice (1-5):\n ");
  activityLevel = int.parse(stdin.readLineSync()!);

  switch (activityLevel) {
    case 1:
      print("You have selected 'Little to no exercise'.");
      break;
    case 2:
      print("You have selected 'Light exercise'.");
      break;
    case 3:
      print("You have selected 'Moderate exercise'.");
      break;
    case 4:
      print("You have selected 'Heavy exercise'.");
      break;
    case 5:
      print("You have selected 'Very heavy exercise'.");
      break;
    default:
      print("Invalid choice. Please choose a number between 1 and 5.");
      exercise();
  }
  print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
}

void loseOrGain() {
  stdout.write(
      "\nWould you like to lose weight or gain weight or nothing ? (Enter 'lose' or 'gain' or 'nothing'): ");
  goal = stdin.readLineSync()!.toLowerCase();

  if (goal == "lose") {
    print("You have chosen to lose weight.");
  } else if (goal == "gain") {
    print("You have chosen to gain weight.");
  } else if (goal == "nothing") {
    print("you have chosen nothing.");
  } else {
    print("Invalid input. Please enter 'lose' or 'gain'.");
    loseOrGain();
  }
}

void bmiTest() {
  double heightInMeters = height / 100;
  double bmi = currentWeight / (heightInMeters * heightInMeters);
  print("\n$name your BMI is: ${bmi.toStringAsFixed(2)}");
  print("");
  print("""
BMI Categories:
----------------------------------
- Underweight: BMI < 18.5
- Normal weight: BMI 18.5 - 24.9
- Overweight: BMI 25 - 29.9
- Obese: BMI >= 30
----------------------------------
""");

  if (bmi < 18.5) {
    print("You are underweight.");
  } else if (bmi >= 18.5 && bmi < 24.9) {
    print("You have a normal weight.");
  } else if (bmi >= 25 && bmi < 29.9) {
    print("You are overweight.");
  } else {
    print("You are obese.");
  }
}

void idealBodyWeight() {
  try {
    double heightInches = height / 2.54;

    double idealWeight = gender == "male"
        ? 50 + 2.3 * (heightInches - 60)
        : 45.5 + 2.3 * (heightInches - 60);

    print(
        "\n$name, your ideal body weight is: ${idealWeight.toStringAsFixed(2)} kg.");

    double weightPercentage = (currentWeight / idealWeight) * 100;

    if (currentWeight > idealWeight) {
      double adjustedWeight = gender == "male"
          ? idealWeight + (0.4 * (currentWeight - idealWeight))
          : idealWeight + (0.4 * (currentWeight - idealWeight));

      print(
          "$name, your adjusted body weight is: ${adjustedWeight.toStringAsFixed(2)} kg.");
    } else {
      print(
          "$name, your current weight is already close to or below your ideal weight.");
    }
  } catch (e) {
    print("Error in calculating ideal or adjusted body weight: $e");
  }
}

void nutritionalRequirements() {
  double bmr;
  if (gender == "male") {
    bmr = (10 * currentWeight) + (6.25 * height) - (5 * age) + 5;
  } else {
    bmr = (10 * currentWeight) + (6.25 * height) - (5 * age) - 161;
  }

  double dailyCalories;
  switch (activityLevel) {
    case 1:
      dailyCalories = bmr * 1.2;
      break;
    case 2:
      dailyCalories = bmr * 1.375;
      break;
    case 3:
      dailyCalories = bmr * 1.55;
      break;
    case 4:
      dailyCalories = bmr * 1.725;
      break;
    case 5:
      dailyCalories = bmr * 1.9;
      break;
    default:
      print("Invalid activity level.");
      return;
  }

  if (goal == "lose") {
    dailyCalories -= 1000; //1000 calorie deficit for weight loss
    print(
        "\n$name to lose weight, your recommended daily calorie intake is: ${dailyCalories.toStringAsFixed(2)} calories.");
  } else if (goal == "gain") {
    dailyCalories += 500; // 500 calorie surplus for weight gain
    print(
        "\n$name to gain weight, your recommended daily calorie intake is: ${dailyCalories.toStringAsFixed(2)} calories.");
  } else {
    print(
        "\n$name your daily calorie requirement is: ${dailyCalories.toStringAsFixed(2)} calories.");
  }
}

void mealPlan() {
  // Example meal plans for weight loss and gain
  List<String> weightLossBreakfasts = [
    "Oatmeal with berries",
    "Greek yogurt with honey and almonds",
    "Avocado toast on whole grain bread",
    "Smoothie with spinach, banana, and protein powder",
    "Boiled eggs with whole-grain toast",
    "Cottage cheese with apple slices",
    "Chia seed pudding with fresh fruit"
  ];

  List<String> weightGainBreakfasts = [
    "Whole grain toast with peanut butter and banana",
    "Scrambled eggs with cheese and whole wheat toast",
    "Oatmeal with nuts, seeds, and honey",
    "Protein smoothie with oats, milk, and berries",
    "Greek yogurt with granola and dried fruit",
    "Pancakes with maple syrup and berries",
    "Bagel with cream cheese and smoked salmon"
  ];

  List<String> weightLossLunches = [
    "Grilled chicken salad with vinaigrette",
    "Quinoa salad with mixed greens and avocado",
    "Vegetable stir-fry with tofu",
    "Turkey wrap with hummus and veggies",
    "Cauliflower rice bowl with veggies",
    "Tuna salad on whole-grain bread",
    "Soup with lean meat and vegetables"
  ];

  List<String> weightGainLunches = [
    "Chicken and rice bowl with avocado",
    "Whole grain pasta with meatballs and tomato sauce",
    "Baked salmon with roasted potatoes",
    "Turkey sandwich with cheese and veggies",
    "Bean and cheese burrito",
    "Quinoa bowl with nuts and lean protein",
    "Cheese and vegetable quesadilla"
  ];

  List<String> weightLossDinners = [
    "Grilled fish with steamed veggies",
    "Stuffed bell peppers with ground turkey",
    "Vegetable soup with a side of salad",
    "Chicken stir-fry with vegetables",
    "Spaghetti squash with marinara sauce",
    "Lentil stew with vegetables",
    "Salmon with asparagus and sweet potato"
  ];

  List<String> weightGainDinners = [
    "Steak with mashed potatoes",
    "Chicken alfredo pasta",
    "Baked potato with sour cream and cheese",
    "Lamb stew with rice",
    "Pizza with lean protein toppings",
    "Grilled cheese sandwich with tomato soup",
    "Cheesy vegetable lasagna"
  ];

  if (goal == "lose") {
    print("\nMeal Plan for Weight Loss:");
    print("\nBreakfasts:");
    weightLossBreakfasts.forEach((meal) => print("- $meal"));
    print("\nLunches:");
    weightLossLunches.forEach((meal) => print("- $meal"));
    print("\nDinners:");
    weightLossDinners.forEach((meal) => print("- $meal"));
  } else if (goal == "gain") {
    print("\nMeal Plan for Weight Gain:");
    print("\nBreakfasts:");
    weightGainBreakfasts.forEach((meal) => print("- $meal"));
    print("\nLunches:");
    weightGainLunches.forEach((meal) => print("- $meal"));
    print("\nDinners:");
    weightGainDinners.forEach((meal) => print("- $meal"));
  } else if (goal == "nothing") {}
}

void allfun() {
  informationIntro();
  loseOrGain();
  diseases();
  exercise();
  bmiTest();
  idealBodyWeight();
  nutritionalRequirements();
  mealPlan();
}

void allFunWithoutMealPlan() {
  bmiTest();
  idealBodyWeight();
  nutritionalRequirements();
}

void printuserinfo() {
  print(
      "\n*if you wont to print your information write 'yes' else 'exit' and the system well exit*\n");
  String yesorno = stdin.readLineSync()!;
  print("");
  print("");
  if (yesorno == "yes") {
    print("your information is :");
    print("-----------------------------");
    print("- name   :$name");
    print("- age    :$age");
    print("- hight  :$height");
    print("- weight :$currentWeight");
    print("- gender :$gender");
    print("-----------------------------");
    print("'enter \"exit\" to end the program'\n");
    String exsit = stdin.readLineSync()!;
    print("");
    if (exsit == "exit") {
      print("\nprogram exit....");
    }
  } else if (yesorno == "exit") {
    print("\nprogram exit...");
  } else {
    print("wrong value ");
    printuserinfo();
  }
}
