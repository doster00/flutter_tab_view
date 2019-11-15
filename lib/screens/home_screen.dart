import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tab_view/model/user.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  var users = new List<User>();

  _getUsersFromApi() {
    http.Client()
        .get(
            'http://www.mocky.io/v2/5dcf06e03000005b00931d8d') // mudar essa linha pela url da api
        .then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    _getUsersFromApi();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuários"),
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.amber,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.call)),
            Tab(icon: Icon(Icons.chat)),
            Tab(icon: Icon(Icons.notifications)),
          ],
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        bottomOpacity: 1,
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Container(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.album),
                          title: Text(users[index].name),
                          subtitle: Text(users[index].email),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                users[index].aboutMe,
                                textAlign: TextAlign.left,
                                // caso queira que seja exibido os ... basta descomentar as linhas abaixo, dessa forma o card mantem a sua proporção
                                // overflow: TextOverflow.ellipsis,
                                // maxLines: 1,
                                // softWrap: false,
                              ),
                            )
                          ],
                        ),
                        ButtonTheme.bar(
                          child: ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                child: const Text('Editar'),
                                onPressed: () {},
                              ),
                              FlatButton(
                                child: const Text('Excluir',
                                    style: TextStyle(color: Colors.redAccent)),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                // return ListTile(title: Text(users[index].name));
              },
            ),
          ),
          Text("Tab 2"),
          Text("Tab 3"),
        ],
      ),
    );
  }
}
