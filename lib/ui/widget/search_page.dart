import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: new Text(
          'Contatos',
          style:
              new TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            color: Colors.black,
            onPressed: () {
              showSearch(
                context: context,
                delegate: DataSearch(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final users = [
    'Adelina Rodovalho',
    'Aleixo Açores',
    'Cláudio Fitas',
    'Denise Moreno',
    'Diamantino Vilaça',
    'Elisabete Portugal',
    'Filena Beltrão',
    'Flora Faro',
    'Honório Brandán',
    'Miguel Antas',
    'Nuno Mendonça',
    'Quirina Garcés',
    'Sarita Ribeiro',
    'Teodorico Bentes',
    'Viridiano Bandeira',
  ];

  final recentUsers = [
    'Elisabete Portugal',
    'Filena Beltrão',
    'Flora Faro',
    'Honório Brandán',
    'Miguel Antas',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Ações para o app bar

    return [
      new IconButton(
          icon: new Icon(Icons.clear),
          onPressed: () {
            query = '';
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Ícone a esquerda do app bar

    return new IconButton(
        icon: new AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // Mostra algum resultado baseado na seleção

    return new Center(
      child: new Container(
        height: 100.0,
        width: 100.0,
        child: new Card(
          color: Colors.red,
          child: new Center(
            child: new Text(query),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Mostra quando alguém procura algo

    final suggestionList = query.isEmpty
        ? recentUsers
        : users.where((p) => p.startsWith(query)).toList();

    return new ListView.builder(
      itemBuilder: (context, index) => new ListTile(
            onTap: () {
              showResults(context);
            },
            leading: new Icon(Icons.person),
            title: new RichText(
              text: new TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style: new TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                children: [
                  new TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: new TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
      itemCount: suggestionList.length,
    );
  }
}
