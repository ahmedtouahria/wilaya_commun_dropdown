import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DataController extends GetxController{

List wilaya=[]; // for testing 
List wilayaMaps=[]; // for push map into dropDown
List commun=[]; 
String wilayaName ='سطيف'; // intialization null safety
String communName ='سطيف'; // intialization null safety

/* function for push wilaya in dropDown , async because it take a while ! */
Future<List> getAllWilaya()async{
  // get data 'wilaya map' from Sample.json
final String response = await rootBundle.loadString('assets/sample.json');
// assign response to data variable
final data = await json.decode(response);
// for filtering data and delete duplicate wilaya_name
data.map((e)=>{
if (!wilaya.contains(e['wilaya_name'])) {
wilaya.add((e['wilaya_name']).toString()),
wilayaMaps.add(e)
    }
  }).toList(); // Then we turn it into a list
 // print(wilayaMaps);
  return wilayaMaps;
  }
   Future<void> getAllCommun(String s)async{
     //for delete duplicate commune_name from previous dropDowm list 
  commun=[];
  //get data 
  final String response = await rootBundle.loadString('assets/sample.json');
  final data = await json.decode(response);

// for filtering data 'commune_name' from response
  data.map((e)=>{
   if(e['wilaya_name'].toString()==s)
   commun.add(e),

  }).toList();
  
  update(); // this function is already exist in GetX for the purpose of listening to any change to rebuild dropDpwn
 // print(commun);
  }
  // intialisation , this is already exist in GetX 
 @override
  void onInit() {
    super.onInit();
    getAllWilaya();
  }

}