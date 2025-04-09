import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class THelperfunction
{


static Color? getColor(String value) {
  if (value == 'Green') {
    return Colors.green;
  } else if (value == 'Red') {
    return Colors.red;
  } else if (value == 'Blue') {
    return Colors.blue;
  } else if (value == 'Pink') {
    return Colors.pink;
  } else if (value == 'Gray') {
    return Colors.grey;
  } else if (value == 'White') {
    return Colors.white;
  } else if (value == 'Black') {
    return Colors.black;
  } else if (value == 'Yellow') {
    return Colors.yellow;
  } else if (value == 'Purple') {
    return Colors.purple;
  } else if (value == 'Orange') {
    return Colors.orange;
  } else if (value == 'Brown') {
    return Colors.brown;
  } else if (value == 'Teal') {
    return Colors.teal;
  }
  return null; // Return null if the color is not found
}

}