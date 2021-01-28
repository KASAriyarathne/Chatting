import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(
    title: Text("Chatting"),
  );
}

Widget chatBar(userName) {
  return AppBar(
    title: Text(
                userName,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
  );
}

Widget iosappBar(String name) {
  return new AppBar(
    backgroundColor: Colors.white,
    bottom: PreferredSize(
      preferredSize: Size(100.0, 100.0),
      child: Container(
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text('$name',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 50,
                          color: Colors.black),
                    )),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.white),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)));
}

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 16);
}

TextStyle sTextStyle() {
  return TextStyle(color: Colors.white);
}

TextStyle mideumTextStyle() {
  return TextStyle(color: Colors.black, fontSize: 17);
}

 class CustomNavBarWidget extends StatelessWidget {
         final int selectedIndex;
         final List<PersistentBottomNavBarItem> items; // NOTE: You CAN declare your own model here instead of `PersistentBottomNavBarItem`.
         final ValueChanged<int> onItemSelected;

         CustomNavBarWidget(
             {Key key,
             this.selectedIndex,
             @required this.items,
             this.onItemSelected,});

         Widget _buildItem(
             PersistentBottomNavBarItem item, bool isSelected) {
             return Container(
             alignment: Alignment.center,
             height: 60.0,
             child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisSize: MainAxisSize.min,
                 children: <Widget>[
                 Flexible(
                     child: IconTheme(
                     data: IconThemeData(
                         size: 26.0,
                         color: isSelected
                             ? (item.activeColorAlternate == null
                                 ? item.activeColor
                                 : item.activeColorAlternate)
                             : item.inactiveColor == null
                                 ? item.activeColor
                                 : item.inactiveColor),
                     child: item.icon,
                     ),
                 ),
                 Padding(
                     padding: const EdgeInsets.only(top: 5.0),
                     child: Material(
                     type: MaterialType.transparency,
                     child: FittedBox(
                         child: Text(
                         item.title,
                         style: TextStyle(
                             color: isSelected
                                 ? (item.activeColorAlternate == null
                                     ? item.activeColor
                                     : item.activeColorAlternate)
                                 : item.inactiveColor,
                             fontWeight: FontWeight.w400,
                             fontSize: 12.0),
                     )),
                     ),
                 )
                 ],
             ),
             );
         }

         @override
         Widget build(BuildContext context) {
             return Container(
             color: Colors.white,
             child: Container(
                 width: double.infinity,
                 height: 60.0,
                 child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: items.map((item) {
                     int index = items.indexOf(item);
                     return Flexible(
                     child: GestureDetector(
                         onTap: () {
                         this.onItemSelected(index);
                         },
                         child: _buildItem(
                             item, selectedIndex == index),
                     ),
                     );
                 }).toList(),
                 ),
             ),
             );
         }
     }

