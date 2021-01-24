import 'package:flutter/material.dart';

import '../../constants.dart';

class TopBar extends StatelessWidget with PreferredSizeWidget {
  const TopBar({
    Key key,
    @required this.size, this.press,
  }) : super(key: key);

  final Size size;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.2,
      width: double.infinity,
      color: kPrimaryColor,
      child: Padding(
        padding: EdgeInsets.only(left: 20, top: 40, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: press,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 3, color: kSecondaryColor),
              ),
              child: Text("Your week", style: kHeadingextStyle),
            ),
            Spacer(),
            Icon(
              Icons.add,
              color: Colors.transparent,
            )
          ],
        ),
      ),
    );
  }

  @override
  
  Size get preferredSize => new Size.fromHeight(size.height);
}
