import 'package:flutter/material.dart';
class DrawerListItem{
  String label ;
  String leftImageUrl;
  Icons rightIcon ;
  VoidCallback itemOnTap ;
  DrawerListItem(this.label,this.leftImageUrl,this.rightIcon,this.itemOnTap );
}
