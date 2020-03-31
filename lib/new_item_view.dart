import 'package:flutter/material.dart';

class NewItemView extends StatefulWidget {

  String title;
  String subtitle;
  NewItemView({this.title, this.subtitle});
  @override
  _NewItemViewState createState() => _NewItemViewState();
}

class _NewItemViewState extends State<NewItemView> {

  TextEditingController textFieldController;
  TextEditingController descriptionController;

  @override
  void initState() {
    textFieldController = new TextEditingController(text: widget.title);
    descriptionController = new TextEditingController(text: widget.subtitle);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              color: Colors.black12
            ),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Titre'
                  ),
                  controller: textFieldController,
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Description'
                  ),
                  controller: descriptionController,
                  onEditingComplete: (){save();},
                ),
              ],
            ),
          ),

          FlatButton(
            onPressed: (){save();},
            child: Text("Save", style: TextStyle(color: Theme.of(context).accentColor),),
          )
        ],
      ),
    );
  }


  void save(){
    Map data = {
      "title":textFieldController.text,
      "subtitle":descriptionController.text
    };
    if(textFieldController.text.isNotEmpty && descriptionController.text.isNotEmpty){
      Navigator.of(context).pop(data);

    }
  }
}
