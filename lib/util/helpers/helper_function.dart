import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

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

static void navgateToScreen(BuildContext context ,Widget screen)
{
  Navigator.push(context, MaterialPageRoute(builder: (_)=>screen));
}

static String truncateText(String text,int maxLLenght){
  if(text.length<=maxLLenght)
  {
    return text;
  }else
  {
    return '${text.substring(0,maxLLenght)}....';
  }
}

static bool isDarkMode(BuildContext context)
{
  return Theme.of(context).brightness==Brightness.dark;
}
static Size screenSize(BuildContext context)
{
  return MediaQuery.of(context).size;
}

static double screenHeight(BuildContext context)
{
  return MediaQuery.of(context).size.height;
}

static double screenWidth(BuildContext context)
{
  return MediaQuery.of(context).size.width;
}

static String getFormatedDate(DateTime date,{String format='dd MM yyyy'})
{
  return DateFormat(format).format(date);
}

static List<T>removeDuplicates<T>(List<T> list)
{
  return list.toSet().toList();
}

 static List<Widget> wrapWidget(List<Widget> widgets,int rowsize)
 {
  final wrappList =<Widget>[];
  for(var i=0;i<widgets.length;i+=rowsize)
  {
    widgets.sublist(i,i+rowsize>widgets.length?widgets.length:i+rowsize);
  }

  return wrappList;
 }

}