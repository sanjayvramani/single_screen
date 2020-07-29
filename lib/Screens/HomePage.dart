import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:single_screen/Common/jsonData.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color themeColor = Color.fromRGBO(160, 26, 18, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 12, right: 12, bottom: 7),
              decoration:
                  BoxDecoration(color: themeColor, boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 2.0,
                  spreadRadius: 3,
                ),
              ]),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).padding.top + 20,
                  ),
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "images/appbar_icon.png",
                      ),
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
                      Image.asset(
                        "images/sos_icon.png",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 42,
                    padding: EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "מה תרצו פשוט למצוא",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.search,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: GridView.count(
                crossAxisCount: 4,
                children: <Widget>[
                  for (int i = 0; i < topMenuItems.length; i++) ...[
                    _createTopMenus(
                        topMenuItems[i]["category_image"],
                        topMenuItems[i]["category_name"],
                        topMenuItems[i]["category_background_color"]
                            .replaceAll("#", "0xff")),
                  ]
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, top: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "ואולי חיפשת משהו בתחומים האלו?",
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                padding: EdgeInsets.only(top: 0),
                itemCount: bottomMenuItems.length,
                itemBuilder: (BuildContext context, int index) =>
                    _createBottomMenus(
                        bottomMenuItems[index]["category_image"],
                        bottomMenuItems[index]["category_name"],
                        bottomMenuItems[index]["category_background_color"]
                            .replaceAll("#", "0xff")),
                staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: themeColor,
              ),
              title: Text(
                "ראשי",
                style: TextStyle(
                  color: themeColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: themeColor,
              ),
              title: Text(
                "חיפוש",
                style: TextStyle(
                  color: themeColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.update,
                color: themeColor,
              ),
              title: Text(
                "הסטוריה",
                style: TextStyle(
                  color: themeColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: themeColor,
              ),
              title: Text(
                "מועדפים",
                style: TextStyle(
                  color: themeColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_pin,
                color: themeColor,
              ),
              title: Text(
                "אזור אישי",
                style: TextStyle(
                  color: themeColor,
                ),
              ),
            ),
          ],
        ));
  }
}

_createTopMenus(imageName, text, colorName) {
  return Column(
    children: <Widget>[
      FadeInImage.assetNetwork(
        placeholder: "images/placeholder.png",
        image: imageName,
        width: 40,
        height: 40,
      ),
      SizedBox(
        height: 8,
      ),
      Text(
        "$text",
        style: TextStyle(color: Color(int.parse(colorName)), fontSize: 12),
      )
    ],
  );
}

_createBottomMenus(imageName, text, colorName) {
  return Container(
    margin: EdgeInsets.all(3),
    padding: EdgeInsets.only(top: 4, bottom: 4),
    decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey[300])),
    child: Column(
      children: <Widget>[
        FadeInImage.assetNetwork(
          placeholder: "images/placeholder.png",
          image: imageName,
          width: 40,
          height: 40,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "$text",
          style: TextStyle(color: Color(int.parse(colorName)), fontSize: 12),
        )
      ],
    ),
  );
}
