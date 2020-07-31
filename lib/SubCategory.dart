import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
          Padding(
            padding: const EdgeInsets.only(top:40.0,right: 7,bottom: 10),
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
                      subcategory[index]["sub_category_image"],
                      subcategory[index]["sub_category_name"],
                      subcategory[index]["sub_category_background_color"]
                          .replaceAll("#", "0xff")),
              staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
            ),
          ),
        ],
      ),
    );
  }
}

_subcategoryComponent(imageName, text, colorName) {
  return Container(
    margin: EdgeInsets.all(3),
    padding: EdgeInsets.only(top: 6, bottom: 6),
    decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey[300])),
    child: Column(
      children: <Widget>[
        Image.network(
          imageName,
          width: 40,
          height: 40,
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          "$text",
          style: TextStyle(color: Color(int.parse(colorName)), fontSize: 12),
        )
      ],
    ),
  );
}

