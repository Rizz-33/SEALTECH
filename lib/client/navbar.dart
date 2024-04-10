import 'package:flutter/material.dart';
import 'package:sealtech/client/cart/cart.dart' as fourthTab;
import 'package:sealtech/client/category/category.dart' as secondTab;
import 'package:sealtech/client/contact%20us/contactUs.dart';
import 'package:sealtech/client/home.dart' as firstTab;
import 'package:sealtech/client/profile/profile.dart' as fifthTab;
import 'package:sealtech/client/search.dart' as thirdTab;
import 'package:sealtech/components/theme.dart';

class NavbarC extends StatefulWidget{
  @override
  HomeWidget createState() => HomeWidget();
}

class HomeWidget extends State<NavbarC>{
  int _selectedTab = 0;

  final PageController _navPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: bgColor,
      body: PageView(
        controller: _navPage,
        onPageChanged: (index){
          setState(() {
            _selectedTab = index;
          });
        },
        children: <Widget>[
          firstTab.Home(),
          secondTab.Category(),
          thirdTab.Search(),
          fourthTab.Cart(),
          fifthTab.Profile(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        shape: const CircularNotchedRectangle(),
        color: bgColor,
        child: Container(
          color: bgColor,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                iconSize: 30,
                icon: Icon(
                  _selectedTab == 0 ? Icons.home : Icons.home_outlined,
                  color: _selectedTab == 0 ? accentColor : null,
                ),
                onPressed: () {
                  setState(() {
                    _navPage.jumpToPage(0);
                  });
                },
              ),
              IconButton(
                iconSize: 30,
                icon: Icon(
                  _selectedTab == 1 ? Icons.category : Icons.category_outlined,
                  color: _selectedTab == 1 ? accentColor : null,
                ),
                onPressed: () {
                  setState(() {
                    _navPage.jumpToPage(1);
                  });
                },
              ),
              IconButton(
                iconSize: 30,
                icon: Icon(
                  _selectedTab == 2 ? Icons.search : Icons.search_outlined,
                  color: _selectedTab == 2 ? accentColor : null,
                ),
                onPressed: () {
                  setState(() {
                    _navPage.jumpToPage(2);
                  });
                },
              ),
              IconButton(
                iconSize: 30,
                icon: Icon(
                  _selectedTab == 3 ? Icons.shopping_cart : Icons.shopping_cart_outlined,
                  color: _selectedTab == 3 ? accentColor : null,
                ),
                onPressed: () {
                  setState(() {
                    _navPage.jumpToPage(3);
                  });
                },
              ),
              IconButton(
                iconSize: 30,
                icon: Icon(
                  _selectedTab == 4 ? Icons.person : Icons.person_outline,
                  color: _selectedTab == 4 ? accentColor : null,
                ),
                onPressed: () {
                  setState(() {
                    _navPage.jumpToPage(4);
                  });
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _selectedTab != 3 && _selectedTab != 4
        ? FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactUsPage()),
              );
            },
            child: Icon(Icons.message, color: primary25),
            backgroundColor: primaryColor,
          )
        : null,
    );
  }
}