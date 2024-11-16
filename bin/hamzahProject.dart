import 'dart:io';

class Contact {
  int id;
  String name;
  String phone;
  String email;

  Contact(this.id, this.name, this.phone, this.email);
}

void main() {
  List<Contact> contacts = [];

  while (true) {
    print('Contact Management System');
    print('1. Add Contact');
    print('2. Display All Contacts');
    print('3. Search Contact');
    print('4. Update Contact');
    print('5. Delete Contact');
    print('6. Exit');
    stdout.write('Enter your choice: ');

    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        addContact(contacts);
        break;
      case 2:
        displayContacts(contacts);
        break;
      case 3:
        searchContact(contacts);
        break;
      case 4:
        updateContact(contacts);
        break;
      case 5:
        deleteContact(contacts);
        break;
      case 6:
        print('Exiting...');
        return;
      default:
        print('Invalid choice. Please try again.');
    }
  }
}

void addContact(List<Contact> contacts) {
  stdout.write('Enter contact ID: ');
  int id = int.parse(stdin.readLineSync()!);

  stdout.write('Enter name: ');
  String name = stdin.readLineSync()!;

  stdout.write('Enter phone: ');
  String phone = stdin.readLineSync()!;

  stdout.write('Enter email: ');
  String email = stdin.readLineSync()!;

  contacts.add(Contact(id, name, phone, email));
  print('Contact added successfully.');
}

void displayContacts(List<Contact> contacts) {
  if (contacts.isEmpty) {
    print('No contacts available.');
    return;
  }

  print('\nContact List:');
  contacts.forEach((contact) => print(
      'ID: ${contact.id}, Name: ${contact.name}, Phone: ${contact.phone}, Email: ${contact.email}'));
}

void searchContact(List<Contact> contacts) {
  stdout.write('Enter name to search: ');
  String name = stdin.readLineSync()!;

  var results = contacts.where((contact) => contact.name.contains(name));
  if (results.isEmpty) {
    print('Contact not found.');
  } else {
    results.forEach((contact) => print(
        'ID: ${contact.id}, Name: ${contact.name}, Phone: ${contact.phone}, Email: ${contact.email}'));
  }
}

void updateContact(List<Contact> contacts) {
  stdout.write('Enter contact ID to update: ');
  int id = int.parse(stdin.readLineSync()!);

  Contact? contact =
      contacts.firstWhere((contact) => contact.id == id, orElse: () => null!);
  if (contact != null) {
    stdout.write('Enter new name: ');
    contact.name = stdin.readLineSync()!;
    stdout.write('Enter new phone: ');
    contact.phone = stdin.readLineSync()!;
    stdout.write('Enter new email: ');
    contact.email = stdin.readLineSync()!;
    print('Contact updated successfully.');
  } else {
    print('Contact not found.');
  }
}

void deleteContact(List<Contact> contacts) {
  stdout.write('Enter contact ID to delete: ');
  int id = int.parse(stdin.readLineSync()!);

  int DeleteLength = contacts.length;
  contacts.removeWhere((contact) => contact.id == id);

  if (contacts.length < DeleteLength) {
    print('Contact deleted successfully.');
  } else {
    print('.');
  }
}
