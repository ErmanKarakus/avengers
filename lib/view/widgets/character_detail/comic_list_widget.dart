import 'package:avengers/const/app_const.dart';
import 'package:avengers/model/comic_model.dart';
import 'package:flutter/material.dart';

class ComicListWiget{
  static List<Padding> bringList(List<ComicModel> list){
    List<Padding> widgetList = [];
    for(var element in list){
      widgetList.add(
        Padding(
          padding: const EdgeInsets.only(left: 5,right: 5),
          child: Column(
            children: [
              ListTile(
                style: ListTileStyle.drawer,
                tileColor: Colors.white24,
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("${element.thumbnail.path}.${element.thumbnail.extension}"),
                ),
                title: Text(element.title),
                subtitle: Text(AppConst.dateTimeFormatter(DateTime.parse(element.dates.first.date))),
              ),
              const Divider(height: 0,thickness: 0.5)
            ],
          ),
        )
      );
    }
    return widgetList;
  }
}