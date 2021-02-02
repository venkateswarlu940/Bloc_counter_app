import 'package:bloc_app/Event_counter.dart';
import 'package:flutter/material.dart';
import 'package:bloc_app/model/Bloc_class.dart';
class MyHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePage();
  }
}
class HomePage extends State<MyHomePage>{
  final _bloc= Bloc_Counter();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Bloc Counter Example"),
        centerTitle: true,
      ),
      body: Center(
        child: StreamBuilder(
          stream: _bloc.counter,
          initialData: 0,
       builder: (BuildContext context,AsyncSnapshot<int> snapshot){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Flutter Bloc Example", style: TextStyle(fontStyle: FontStyle.italic,fontSize: 25),),
              Text(
                  '${snapshot.data}',
                style: TextStyle(fontSize: 30),
              ),
              FlatButton(
                color: Colors.blue,
                child: Text("Increment",style: TextStyle(fontSize: 15,color: Colors.white),),
                onPressed: (){
                  //print("Increment");
                  //class bloc class by passing IncrementEvent
                  _bloc.counterEventSink.add(IncrementEvent());
                },
              ),
              FlatButton(
                color: Colors.blue,
                child: Text("Decrement",style: TextStyle(fontSize: 15,color: Colors.white),),
                onPressed: (){
                  //print("decrement");
                  //class bloc class by passing IncrementEvent
                  _bloc.counterEventSink.add(DecrementEvent());
                },
              ),
            ],
          );
       }
        ),
      ),
      //floatingActionButton: ,
    );
  }
   @override
  void dispose(){
    super.dispose();
    _bloc.dispose();
   }
}
