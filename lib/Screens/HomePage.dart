import 'package:demo_app/AppLocalizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:single_screen/Common/Constants.dart';
import 'package:single_screen/Common/jsonData.dart';
import '../Common/jsonSubcategoryData.dart';
import '../NavigationBar/HomeHeading.dart';
import 'dart:io';
import '../NavigationBar/BottomNavigationBar.dart';
import 'SubCategory.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  Color themeColor = Color.fromRGBO(160, 26, 18, 1);
  bool isHerbrew=true;
  int selectedBottomNavigation=0;

  List<dynamic> lstBottomMenu=List<dynamic>();
  List<dynamic> lstTopMenu=List<dynamic>();
      changeSelection(int value)
  {
    setState(() {
      selectedBottomNavigation=value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //lstBottomMenu=bottomMenuItems;
    //lstTopMenu=topMenuItems;
    if(Platform.localeName.startsWith("he")) {

      //Top Menu
      for (int i = 0; i < topMenuItems.length; i = i + 4) {
        lstTopMenu.add(topMenuItems[i + 3]);
        lstTopMenu.add(topMenuItems[i + 2]);
        lstTopMenu.add(topMenuItems[i + 1]);
        lstTopMenu.add(topMenuItems[i]);
      }

     // Bottom Menu
      if (bottomMenuItems.length % 2 == 0) {
        for (int i = 0; i < bottomMenuItems.length; i = i + 2) {
          lstBottomMenu.add(bottomMenuItems[i + 1]);
          lstBottomMenu.add(bottomMenuItems[i]);
        }
      }
      else {
        for (int i = 1; i < bottomMenuItems.length; i = i + 2) {
          lstBottomMenu.add(bottomMenuItems[i]);
          lstBottomMenu.add(bottomMenuItems[i - 1]);
        }

        lstBottomMenu.add(bottomMenuItems[bottomMenuItems.length - 1]);
      }
    }
    else
      {
        lstTopMenu=topMenuItems;
        lstBottomMenu=bottomMenuItems;
      }



  }

  @override
  Widget build(BuildContext context) {

    String appbarTitle = AppLocalizations.of(context).translate("title");

    var topMenu = GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 2.0,
        crossAxisCount: 4
    ),
        itemCount: lstTopMenu.length,
        itemBuilder: (context,index){
          return _createTopMenus(index);
        });

    var freeSpace = Padding(
      padding: const EdgeInsets.only(right: 8, top: 10),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          AppLocalizations.of(context).translate("home_area"),
        ),
      ),
    );

    var bottomMenu = Expanded(
      child: GridView.builder(
         // physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2.5,
              crossAxisCount: 2
          ),
          itemCount: lstBottomMenu.length,
          itemBuilder: (context,index){
            return _createBottomMenus(index);
          }),
    );

   /* var bottomMenu = Expanded(
      child: StaggeredGridView.countBuilder(crossAxisCount: 2,
          itemCount: lstBottomMenu.length,
          itemBuilder: (context,index){
            return _createBottomMenus(index);
          },
          staggeredTileBuilder: (int index) =>
          new StaggeredTile.fit(1)),
    );*/

    return Scaffold(
        body: Column(
          children: <Widget>[
            getAppBar(context,appbarTitle),
            Expanded(child: Column(
              children: <Widget>[
                topMenu,
                freeSpace,
                SizedBox(height: 10,),
                bottomMenu
              ],
            ))
          ],
        ),
        bottomNavigationBar: getOriginalBottomNavigationBar(context,themeColor));
  }


  Widget _createTopMenus(int index) {
    var map = lstTopMenu[index];
    var lst = map["category_image"].toString().split("/");
    List<dynamic>lstSubcategory=List<dynamic>();

    subcategory.forEach((element) {
      if(element["category_id"]==map["category_id"])
        {
          lstSubcategory.add(element);
        }
    });

    return InkWell(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>SubCategoryScreen(map,lstSubcategory)));
      },

        child: Column(
          children: <Widget>[
            Image.asset(
              "assets/images/categories/"+ map["category_vector_image"]+".png",
              width: 40,
              height: 40,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              map["category_name"+(isHerbrew?"":"_en")],
              style: TextStyle(color: Color(int.parse(map["category_background_color"].replaceAll("#","0xff"))), fontSize: 12),
            )
          ],
        ),
      );
  }

  _createBottomMenus(int index) {
    var map = lstBottomMenu[index];
    List<dynamic>lstSubcategory=List<dynamic>();
    var lst = map["category_image"].toString().split("/");

    subcategory.forEach((element) {
      if(element["category_id"]==map["category_id"])
      {
        lstSubcategory.add(element);
      }
    });
    return InkWell(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>SubCategoryScreen(map,lstSubcategory)));
      },
      child: Container(
        margin: EdgeInsets.all(3),
        padding: EdgeInsets.only(top: 6, bottom: 6),
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey[300])),
        child: Column(
          children: <Widget>[
            Image.asset(
              "assets/images/categories/"+ map["category_vector_image"]+".png",
              width: 35,
              height: 35,
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              map["category_name"+(isHerbrew?"":"_en")],
              style: TextStyle(color: Color(int.parse(map["category_background_color"].replaceAll("#","0xff"))), fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}

