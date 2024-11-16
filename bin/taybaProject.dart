import 'dart:io';

List todo = [];
List note = [];
Map<String, String> reminders = {};
bool isfini = true;
bool istrue = true;
bool ismain = true;

void main() {
  print("-------------------");
  print("\"WRITE EVERYTING....EDIT LATER\"");
  print("-------------------");
  home();
}

void home() {
  bool check = true;
  while (check) {
    try {
      print("                ");
      print("HOME:-");
      print("                ");
      print("to write a TO-DO-LIST planer enter : \"1\"");
      print("to open your note enter :\"2\"");
      print("to use reminder enter: \"3\"");
      String input = stdin.readLineSync()!;
      print("-------------------");

      if (input == "1") {
        todolist();
        check = false;
      } else if (input == "2") {
        notefun();
        check = false;
      } else if (input == "3") {
        reminder();
        check = false;
      }
    } catch (ex) {
      print("this value not valid,try again!");
    }
  }
}

void todolist() {
  print("TO-DO :-");
// bool istrue=true;
  print("enter the note you want to add:  ");
  String add = stdin.readLineSync()!;
  if (add.isEmpty) {
    print("note cant be empty");
    todolist();
  } else {
    todo.add(add);
  }

  while (istrue) {
    print("""do you want to add more?? 
 yes-->1   no-->0 """);
    String tocon = stdin.readLineSync()!;
    if (tocon == "0") {
      istrue = false;
    } else {
      todolist();
    }
  }

//print the list
  print("---------------------");
  print("TO DO LIST:-");
  int cou = 1;
  for (var i in todo) {
    print(" $cou --> $i");
    cou++;
  }
  print("-----------");
  isfini = true;
  while (isfini) {
    stdout.write("enter the nember you finished,,,to exit enter 0 :-   ");
    int fin = int.parse(stdin.readLineSync()!);
    if (fin == 0) {
      isfini = false;
      home();
    } else {
      todo.removeAt(fin - 1);
      int cou = 1;
      print("----------------");
      for (var i in todo) {
        print(" $cou --> $i");
        cou++;
      }
    }
    if (todo.isEmpty) {
      print("WELL DONE..THE END");
      print("");
      isfini = false;
      break;
    }
  }
  home();
}

void notefun() {
  print("********************");
  print("       NOTE         ");
  print("                    ");
  print("to edit  your note enter: 1  ");
  print("to show the note enter:  2 ");
  int noteinp = int.parse(stdin.readLineSync()!);
  if (noteinp == 2) {
    shownote();
  } else if (noteinp == 1) {
    notehome();
  }
}

void notehome() {
  print("");
  print("to delete from note enter:  1");
  print("to add to note enter: 2");
  var x = stdin.readLineSync()!;
  if (x == "1") {
    delnote();
  } else if (x == "2") {
    addnote();
  } else {
    home();
  }
}

void shownote() {
  //bool trueshow=true;
  int n = 1;
  if (note.isEmpty) {
    print("""your note is empty ....do you want to add??
           if yes-->1     no-->0 """);
    String tocon = stdin.readLineSync()!;
    if (tocon == "0") {
      home();
    } else {
      addnote();
    }
  } else {
    print("-----------------");
    print("   YOUR NOTE:-   ");
    for (var i in note) {
      print("$n- $i");
      n++;
    }
  }
}

void addnote() {
  print("add note:-");
  print("enter the note you want to add...");
  String addtonote = stdin.readLineSync()!;
  note.add(addtonote);
  print("           ");
  print("after edit:-");
  shownote();
  bool trueadd = true;
  while (trueadd) {
    print("""do you want to add more?? 
 yes-->1   no-->0 """);
    String tocon = stdin.readLineSync()!;
    if (tocon == "0") {
      print("after edit");
      trueadd = false;
      home();
    } else if (tocon == "1") {
      addnote();
    } else {
      home();
    }
  }
}

void delnote() {
  print("-------------------");
  shownote();
  print("");
  print("enter the number you want to delete:-   ");
  int delnum = int.parse(stdin.readLineSync()!);
  note.removeAt(delnum - 1);
  print("        ");
  print("after edit:-");
  shownote();
}

void reminder() {
  print("       ");
  print("    REMINDER    ");
  print("----------------");
  print("to add enter : 1");
  print("to show your reminder : 2");
  print("to search : 3");
  String remin = stdin.readLineSync()!;
  if (remin == "1") {
    addreminder();
  } else if (remin == "2") {
    showreminder();
  } else if (remin == "3") {
    searchinreminder();
  } else {
    reminder();
  }
}

void addreminder() {
  while (true) {
    print(
        '\nEnter a date(00/00/0000) for your reminder (or type "exit" to quit):');
    String dateTime = stdin.readLineSync()!;

    if (dateTime.toLowerCase() == 'exit') {
      reminder();
    }

    print('Enter your reminder message:');
    String message = (stdin.readLineSync()!).toLowerCase();

    if (message.isNotEmpty) {
      reminders[dateTime] = message;
      addreminder();
    } else {
      print('Reminder message cannot be empty.');
    }
  }
}

void showreminder() {
  if (reminders.isEmpty) {
    print('your reminders is emtpy .');
  } else {
    print('Reminders:');
    reminders.forEach((dateTime, message) {
      print('$dateTime: $message');
    });
  }
  reminder();
}

void searchinreminder() {
  print("");
  if (reminders.isEmpty) {
    print("cant search in empty reminder");
    reminder();
  } else {
    print('Enter a date(00/00/0000) or massege to search :');
    String search = stdin.readLineSync()!;
    if (search.isNotEmpty) {
      print('Search results for "$search":');
      print("-------------");
      bool found = false;
      reminders.forEach((dateTime, message) {
        if (dateTime.contains(search) || message.contains(search)) {
          print('$dateTime: $message');
          print("           ");
          found = true;
          reminder();
        }
      });
      if (!found) {
        print('No reminders found matching your search.');
        reminder();
      }
    } else {
      print('Search date cannot be empty.');
      reminder();
    }
  }
}
