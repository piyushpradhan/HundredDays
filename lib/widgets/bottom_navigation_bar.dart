import 'package:flutter/material.dart';
import 'package:hundreddays/constants/colors.dart';
import 'package:hundreddays/providers/bottom_nabigation_bar_provider.dart';
import 'package:hundreddays/screens/home_screen.dart';
import 'package:hundreddays/screens/progress_screen.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {

  List currentScreen = [
    HomeScreen(),
    ProgressScreen(),
    HomeScreen(), 
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      body: currentScreen[provider.currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: primary,
          primaryColor: primary,
        ),
        child: BottomNavigationBar(
          currentIndex: provider.currentIndex,
          onTap: (index) {
            provider.currentIndex = index;
          },
          selectedIconTheme: IconThemeData(
            size: 30,
          ),
          unselectedIconTheme: IconThemeData(
            size: 20,
          ),
          unselectedItemColor: primary,
          selectedItemColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                width: provider.currentIndex == 0 ? 50 : 40,
                height: provider.currentIndex == 0 ? 50 : 40,
                decoration: BoxDecoration(
                  color: provider.currentIndex == 0 ? primary : Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: provider.currentIndex == 0 ? [
                    BoxShadow(
                      blurRadius: 6,
                      offset: Offset.zero,
                      color: Colors.black26
                    )
                  ] : [],
                ),
                child: new Icon(Icons.home)
              ),
              label: "Home"
            ),
            BottomNavigationBarItem(
              icon: Container(
                  width: provider.currentIndex == 1 ? 50 : 40,
                  height: provider.currentIndex == 1 ? 50 : 40,
                  decoration: BoxDecoration(
                      color: provider.currentIndex == 1 ? primary : Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: provider.currentIndex == 1 ? [
                        BoxShadow(
                            blurRadius: 6,
                            offset: Offset.zero,
                            color: Colors.black26
                        )
                      ] : [],
                  ),
                  child: new Icon(Icons.bar_chart)
              ),
              label: "Progress"
            ),
            BottomNavigationBarItem(
                icon: Container(
                    width: provider.currentIndex == 2 ? 50 : 40,
                    height: provider.currentIndex == 2 ? 50 : 40,
                    decoration: BoxDecoration(
                      color: provider.currentIndex == 2 ? primary : Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: provider.currentIndex == 2 ? [
                        BoxShadow(
                            blurRadius: 6,
                            offset: Offset.zero,
                            color: Colors.black26
                        )
                      ] : [],
                    ),
                    child: new Icon(Icons.show_chart)
                ),
                label: "Dont know"
            ),
          ],
        ),
      ),
    );
  }
}
