import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:single_screen/Common/jsonData.dart';

class SubCategoryScreen extends StatefulWidget {
  @override
  _SubCategoryScreenState createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset(
                "images/appbar_background.png",
                fit: BoxFit.fill,
                height: 160,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 12, right: 12, bottom: 7),
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 2.0,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).padding.top + 20,
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Fluttertoast.showToast(
                                msg: "Your Location",
                                gravity: ToastGravity.BOTTOM,
                                textColor: Colors.white,
                                backgroundColor: Colors.black,
                                fontSize: 16.0);
                          },
                          child: Image.asset(
                            "images/location_icon.png",
                            width: 30,
                            height: 30,
                          ),
                        ),

//                          GestureDetector(
//                            child: Image.asset(
//                              "images/location_icon.png",
//                              width: 30,
//                              height: 30,
//
//
//                            ),
//                          ),
                        Expanded(
                          child: Center(
                            child: Text(
                              "Allinfo",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        IconButton(icon: Icon(Icons.arrow_forward_ios,color: Colors.white), onPressed: (){
                          Navigator.pop(context);
                        })
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 42,
                      padding: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                      ),
                      child: TextField(
                        cursorColor: Colors.black,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.search,
                                color: Colors.grey, size: 20),
                            border: InputBorder.none,
                            hintText: 'מה תרצו פשוט למצוא'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top:10.0,right: 7,bottom: 10),
            child: Align(
              alignment: Alignment.topRight,
                child: Text("אני רוצה למצוא")),
          ),
          Expanded(
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              padding: EdgeInsets.only(top: 0),
              itemCount: subcategory.length,
              itemBuilder: (BuildContext context, int index) =>
                  _subcategoryComponent(
                      "images/" +
                          subcategory[index]["sub_category_vector_image"] +
                          ".png",
                      subcategory[index]["sub_category_name"]),
              staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
            ),
          ),
        ],
      ),
    );
  }
}

_subcategoryComponent(imageName, text) {
  return Container(
    margin: EdgeInsets.all(3),
    padding: EdgeInsets.only(top: 6, bottom: 6),
    decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey[300])),
    child: Column(
      children: <Widget>[
        Image.asset(
          imageName,
          width: 40,
          height: 40,
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          "$text",
          style: TextStyle(color: Colors.red, fontSize: 12,fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}

