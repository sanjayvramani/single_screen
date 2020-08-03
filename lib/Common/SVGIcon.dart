import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget svgIconFromAsset(String assetName,Color color)
{


    return SvgPicture.asset("assets/images/subcategories/$assetName.svg",color:  color);

}