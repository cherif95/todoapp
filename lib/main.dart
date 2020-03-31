import 'package:flutter/material.dart';
import 'package:todoapps/new_item_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Todo> list = List<Todo>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("TODO app"),
      ),
      body: list.isNotEmpty ? buildBody() : buildEmptyBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          goToNewItemView();
        },
        child: Icon(Icons.add),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget buildBody(){
     return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index){
          return buildItem(list[index]);
        }
    );
  }

  Widget buildItem(Todo item){
    return Dismissible(
      key: Key(item.hashCode.toString()),
      onDismissed: (direction) => removeItem(item),
      background: Container(
        color: Colors.red,
        child: Icon(Icons.delete),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 12.0),
      ),
      direction: DismissDirection.startToEnd,
      child: buildListTile(item),
    );
  }

  Widget buildListTile(Todo item){
    return ListTile(
      title: Text(item.title),
      subtitle: Text(item.subtitle),
      trailing: Checkbox(
        value: item.complete,
        onChanged: null,
      ),
      onTap: () => setCompleteness(item),
      onLongPress: () => gotoEditItemView(item),

    );
  }

  Widget buildEmptyBody(){
    return Container(
      child: Center(
        child: Text("Pas de tâche"),
      ),

    );
  }

  void gotoEditItemView(Todo item){
    Map data;
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context){
          return NewItemView(title: item.title,subtitle: item.subtitle,);
        }
    )).then((data){
      if(data != null) editTodo(item,data['title'], data['subtitle']);
    });
  }

  void goToNewItemView(){
    Map data;
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context){
        return NewItemView();
      }
    )).then((data){
      if(data != null) addTodo(Todo(title: data['title'], subtitle: data['subtitle']));
    });
  }

  void removeItem(Todo item){
    list.remove(item);
    if(list.isEmpty) setState(() {

    });
  }

  void setCompleteness(Todo item){
    setState((){
      item.complete = !item.complete;

    });
  }

  void addTodo(Todo item){
    list.add(item);
  }

  void editTodo(Todo item, String title, String subtitle){
    item.title = title;
    item.subtitle = subtitle;
  }
}


class Todo{
  String title;
  String subtitle;
  bool complete;

  Todo({this.title,this.subtitle, this.complete = false});
}
