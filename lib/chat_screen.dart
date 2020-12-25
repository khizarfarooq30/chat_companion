import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  String name;
  ChatScreen(this.name);
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController textEditingController = new TextEditingController();
  final List<ChatMessage> _messages= <ChatMessage>[];


  void _handleSubmit(String text) {
    textEditingController.clear();
    ChatMessage chatMessage1 = new ChatMessage(message: text,name: widget.name,isMyUserName: false,);
    ChatMessage chatMessage2 = new ChatMessage(message: text,name: "Khizar(Own)",isMyUserName: true,);
    setState(() {
      //used to rebuild our widget
      _messages.insert(0, chatMessage1);
      _messages.insert(0, chatMessage2);
    });
  }

  Widget _textComposerWidget() {
    return new IconTheme(
      data: new IconThemeData(color: Colors.blue),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration: new InputDecoration.collapsed(
                    hintText: "Enter your message"),
                controller: textEditingController,
                onSubmitted: _handleSubmit,
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => _handleSubmit(textEditingController.text),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name),),
      body: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder:(_,int index)=>_messages[index],
              itemCount: _messages.length,
            ),
          ),
          new Divider(height: 1.0,),
          new Container(
            decoration: new BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _textComposerWidget(),
          )
        ],
      ),
    );
  }
}
class ChatMessage extends StatelessWidget {
  final String message ;
  final String name ;
  final bool isMyUserName;
  //for optional params we use curly braces
  ChatMessage({this.message,this.name,this.isMyUserName});
  @override
  Widget build(BuildContext context) {
    String prettyTxt =  getPrettyString(message);

    if(isMyUserName){
      return Card(
        elevation: 0.5,
        child: ListTile(
          isThreeLine: true,
          trailing: new CircleAvatar(
            child: new Text(name[0],),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(" "),
              Text(name,style: Theme.of(context).textTheme.subtitle1),
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(" "),
              Text("$prettyTxt"),
            ],
          ),
        ),
      );
    }
    return  ListTile(
      contentPadding: EdgeInsets.only(left: 15.0,),
      isThreeLine: true,
      leading: new CircleAvatar(
        child: new Text(name[0]),
      ),
      title: Text(name,style: Theme.of(context).textTheme.subtitle1),
      subtitle: Text("$prettyTxt"),
    );
  }

  String getPrettyString(String str){
    for(int i = 1; i<str.length;i++){
      if(i%30 == 0){
        str = "${str.substring(0,i)} \n ${str.substring(i)}";
      }
    }
    return str;
  }
}
