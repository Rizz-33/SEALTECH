import 'package:flutter/material.dart';
import 'package:sealtech/Employee/Profile.dart' as fourthTab;
import 'package:sealtech/Employee/Location.dart' as secondTab;
import 'package:sealtech/Employee/SalaryCalculator.dart' as thirdTab;
import 'package:sealtech/components/theme.dart';
import 'package:sealtech/Employee/Home.dart' as firstTab;

//Initial widget
class NavbarE extends StatefulWidget {
  @override
  HomeWidget createState() => HomeWidget();
}

//State<StatefulWidget> action method
class HomeWidget extends State<NavbarE> {
  int _selectedTab = 0;

  //Page controller
  final PageController _navPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: bgColor,
        child: PageView(
          controller: _navPage,
          onPageChanged: (index) {
            setState(() {
              _selectedTab = index;
            });
          },
          children: const <Widget>[
            firstTab.Home_Page(),
            secondTab.Location_Page(),
            thirdTab.Salary_Page(),
            fourthTab.Profile_Page(),
          ],
        ),
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
              //home
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
                  }),

              //location
              IconButton(
                iconSize: 30,
                icon: Icon(
                  _selectedTab == 1 ? Icons.map : Icons.map_outlined,
                  color: _selectedTab == 1 ? accentColor : null,
                ),
                onPressed: () {
                  setState(() {
                    _navPage.jumpToPage(1);
                  });
                },
              ),

              //salary
              IconButton(
                  iconSize: 30,
                  icon: Icon(
                    _selectedTab == 2 ? Icons.wallet : Icons.wallet_outlined,
                    color: _selectedTab == 2 ? accentColor : null,
                  ),
                  onPressed: () {
                    setState(() {
                      _navPage.jumpToPage(2);
                    });
                  }),

              //profile
              IconButton(
                iconSize: 30,
                icon: Icon(
                  _selectedTab == 3 ? Icons.person : Icons.person_outline,
                  color: _selectedTab == 3 ? accentColor : null,
                ),
                onPressed: () {
                  setState(() {
                    _navPage.jumpToPage(3);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
