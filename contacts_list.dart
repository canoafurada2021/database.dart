import 'package:bytebankapp/Screens/contact_form.dart';
import 'package:bytebankapp/database/app_database.dart';
import 'package:flutter/material.dart';
import 'package:bytebankapp/models/contact.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Contacts'), backgroundColor: Colors.green[900]),

    body: FutureBuilder<List<Contact>>(
    initialData: List.empty(),
    future: findAll(),
    builder: (context, snapshot) {
    switch (snapshot.connectionState) {
    case ConnectionState.none:
    break;
    case ConnectionState.waiting:
    return Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: const <Widget>[
    CircularProgressIndicator(),
    Text('Loading')
    ],
    ),
    );

    case ConnectionState.active:
    break;
    case ConnectionState.done:
    final List<Contact> contacts = snapshot.data as List<Contact>;
    return ListView.builder(
    itemBuilder: (context, index) {
    final Contact contact = contacts[index];
    return _ContactItem(contact);
    },
    itemCount: contacts.length,
    );
    }

    return const Text("Unknown error");
    },
    ),
    //
    floatingActionButton: FloatingActionButton(
    onPressed: () {
    Navigator.of(context).push(
    MaterialPageRoute(
    builder: (context) => const ContactForm(),
            ),
          );
    },
    child: const Icon(
    Icons.add),
    )
  } //arrumar indentação


}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  const _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: const TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          maxLines: 2,
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
