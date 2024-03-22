import 'package:flutter/cupertino.dart';

Widget auditObjectContainer(int id,String title,String description,int type){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Expanded(
        flex: 1,
        child: Text('$id')),
    Expanded(
        flex: 1,
        child: Text(title)),
    Expanded(flex:2,
    child: Text(description)),
    Expanded(
      flex: 1,
        child: Text('$type')),
      Expanded(
          flex: 1,
          child: Text('Action'))
  ],);
}