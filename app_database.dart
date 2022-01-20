//creating database and data table on version number one


import 'package:path/path.dart';
import 'pckage:sqflite/sqflite.dart'

Future<Database> createDatabase(){
 return getDatabasesPath().then((dbPath){
  final String path = join(dbPath. 'bytebank.db');
   return openDatabase(path, onCreate: (db,version) {
db.execute('CREATE TABLE contacts('
     'id INTEGER PRIMARY KEY, '
      'account_number INTEGER)');
}, version: 1);
});
}
 //importe a class contact
Future <int>  save(contact contact){
 return  createDatabase().then((db){
  final Map<String, dynamic> contactMap = Map();
            // contactMap['id'] = contact.id; removido pois Sqlite incrementa id's do tipo inteiro
   contactMap['name'] = contact.name;
   contactMap['account_number'] = contact.accountNumber;
  rturn db.insert('contacts', contactMap); //uso de future para execução assíncrona
  });
 }
 //db.query pega todos os dados de uma tabela
Future <List<Contact>> findAll(){ //retornando then  contato e then do querry
 return  createDatabase().then((db){
return  db.query('contacts').then((maps){
  final List<Contact> contacts = List [];
  for(Map <String, dynamic> map in maps){
   final Contact contac = Contact( //uma instancia de um contato
    map['id'], //sempre o  mesmo nome inserido na tabela Datatbase
    map['name'],
    map['account_number'], 
    );
 contacts.add(contact); //lista preenchida com todos os dados buscados na tabela de contatos
  }
  return contacts;
  });
  });
}
   }
