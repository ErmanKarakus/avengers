import 'package:flutter/material.dart';

class AppWidget{
  static Center dataLoading(){
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  static Center onErrorText({required String text}){
    return Center(child: Text(text));
  }
}