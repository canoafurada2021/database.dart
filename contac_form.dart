[...]
 child: text('Create'),
onPressed () {
  final string name= _nameController.text;
  final int? accountnumber = int.tryParse(_accountNumberControler.text):
  final Contact newContact = Contact(0,name,accountNumber);
  Navigator.pop(context, nemContext);
