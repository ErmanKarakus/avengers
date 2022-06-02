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

  static Center loadingCard({required String text}){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            color: Colors.transparent,
            child: Column(
              children: [
                const RefreshProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(text,style: const TextStyle(color: Colors.white)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}