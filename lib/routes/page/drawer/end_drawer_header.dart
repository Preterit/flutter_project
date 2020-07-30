import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///  UserAccountsDrawerHeader  实现 固定布局的  header
class UserAccountsDrawerHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      margin: EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage("https://www.itying.com/images/flutter/1.png"),
        ),
      ),
      currentAccountPicture: CircleAvatar(
        backgroundImage:
            NetworkImage("https://www.itying.com/images/flutter/3.png"),
        radius: 35.0,
      ),
      accountName: Text(
        "Lwb",
        style: TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w600),
      ),
      accountEmail: Text(
        "18614005205@163.com",
        style: TextStyle(fontSize: 14.0, color: Colors.white),
      ),
    );
  }
}
