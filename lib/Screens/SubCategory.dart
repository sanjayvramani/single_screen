import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:single_screen/Common/jsonData.dart';
import '../AppLocalizations.dart';
import '../NavigationBar/HomeHeading.dart';
import 'dart:io';
import '../NavigationBar/BottomNavigationBar.dart';
import '../Common/SVGIcon.dart';
class SubCategoryScreen extends StatefulWidget {
  Map<dynamic,dynamic> selectedCategory;
  List<dynamic> lstSubCategory;
  SubCategoryScreen(this.selectedCategory,this.lstSubCategory);
  @override
  _SubCategoryScreenState createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  bool isHerbrew=true;
  int selectedBottomNavigation=0;

  List<dynamic> lstSubCategory=List<dynamic>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(Platform.localeName.startsWith("he"))
    {

      if (widget.lstSubCategory.length % 2 == 0) {
        for (int i = 0; i < widget.lstSubCategory.length; i = i + 2) {
          lstSubCategory.add(widget.lstSubCategory[i + 1]);
          lstSubCategory.add(widget.lstSubCategory[i]);
        }
      }
      else {
        for (int i = 1; i < widget.lstSubCategory.length; i = i + 2) {
          lstSubCategory.add(widget.lstSubCategory[i]);
          lstSubCategory.add(widget.lstSubCategory[i - 1]);
        }
        lstSubCategory.add(widget.lstSubCategory[widget.lstSubCategory.length - 1]);
      }
    }
    else
    {
      lstSubCategory=widget.lstSubCategory;
    }
  }

  changeSelection(int value)
  {
    setState(() {
      selectedBottomNavigation=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    //isHerbrew = Platform.localeName.startsWith("iw")?true:false;

    Color themeColor = Color.fromRGBO(160, 26, 18, 1);


   var bottomMenu = StaggeredGridView.countBuilder(crossAxisCount: 2,
       itemCount: lstSubCategory.length,
       itemBuilder: (context,index){
          return _createBottomMenus(index);
       },
       staggeredTileBuilder: (int index) => new StaggeredTile.fit(1));

    return Scaffold(
      body: Column(
        children: <Widget>[
          getAppBar(context,widget.selectedCategory["category_name"+(isHerbrew?"":"_en")], from: "nonHome"),
          Padding(
            padding: const EdgeInsets.only(top:10.0,right: 7,bottom: 10),
            child: Align(
                alignment: Alignment.topRight,
                child: Text(AppLocalizations.of(context).translate("find_subcategory"),style: TextStyle(color: Colors.black),)),
          ),
          Expanded(
            child: bottomMenu,
          )
        ],
      ),
        bottomNavigationBar: getOriginalBottomNavigationBar(context,themeColor)
    );
  }


  _createBottomMenus(int index) {


    var map = lstSubCategory[index];

    var image = svgIconFromAsset(map["sub_category_vector_image"], Color(int.parse(map["sub_category_background_color"].toString().replaceAll("#","0xff"))));

    return InkWell(
      onTap: (){

      },
      child:Container(
        margin: EdgeInsets.all(3),
        padding: EdgeInsets.only(top: 6, bottom: 6),
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey[300])),
        child: Column(
          children: <Widget>[
            Container(
              height: 35,
                width: 35,
                child: image,
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              map["sub_category_name"+(isHerbrew?"":"_en")],
              style: TextStyle(color: Colors.black, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
