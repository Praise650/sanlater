import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CounterApp extends HookWidget{
  @override
  Widget build(BuildContext context) {
    var counter =useState<int>(0);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children:[
              Text('You have pressed a number of time'),
              Text('${counter.value}'),
              Container(
                width: MediaQuery.of(context).size.width*0.4,
                child: ElevatedButton(
                  onPressed: (){
                    counter.value =0;
                  },
                  child: Text('Reset'),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          counter.value +=1;
        },
        child: Icon(Icons.add),
      ),
    );
  }

}