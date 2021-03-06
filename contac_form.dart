import 'package:bytebankapp/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:bytebankapp/database/app_database.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController =
  TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[900],
          title: const Text('New Contact'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                ),
                style: const TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  controller: _accountNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Account Number',
                  ),
                  style: const TextStyle(
                    fontSize: 24.0,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      child: const Text("Create"),
                      onPressed: () {
                        final String name = _nameController.text;
                        final int? accountNumber =
                        int.tryParse(_accountNumberController.text);
                        final Contact newContact = Contact(0, name, accountNumber);
                         save(newContact).then((id) => Navigator.pop(context));
                      },
                    )),
              )
            ],
          ),
        ));
  }
}
