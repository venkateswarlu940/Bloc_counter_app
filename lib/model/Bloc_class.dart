import 'dart:async';
import 'package:bloc_app/Event_counter.dart';
import 'package:flutter/material.dart';
class Bloc_Counter{
  int _counter=0;
  final _counterStateController=StreamController<int>();
  StreamSink<int> get _inCounter=>_counterStateController.sink;
  Stream<int>get counter=>_counterStateController.stream;
  final _counterEventController=StreamController<EventCounter>();
  Sink<EventCounter>get counterEventSink=>_counterEventController.sink;
  Bloc_Counter(){
    _counterEventController.stream.listen((_mapEventtoState));
  }
  void _mapEventtoState(EventCounter event){
    if(event is IncrementEvent)
      _counter++;
    else
      _counter--;
    _inCounter.add(_counter);
  }
  void dispose(){
    _counterStateController.close();
    _counterEventController.close();
  }
}