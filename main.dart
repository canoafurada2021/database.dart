void main() { //transofrmando o void em bloco e inserindo as funçoes criadas no database
  runApp(BytebankApp());
  save(Contact(0, 'Bruna  ,1000)).then((id){
  findAll().then ((contacts) => debugPrint(contacts.toString()))); //fazendo a busca dentro do database
  });
  }
    [...]
    //no console deverão aparecer as informações como [Contact{name: bruna, accountNumber: 1000}]
