import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machine_test/common/hexcolor.dart';
import 'package:machine_test/screens/account_screen.dart';
import 'package:machine_test/screens/cart_screen.dart';
import 'package:machine_test/screens/catogories_screen.dart';
import 'package:machine_test/screens/offers_screen.dart';

import '../common/const.dart';
import '../common/route_generator.dart';
import 'homescreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(tabBar: CupertinoTabBar(items: [
      BottomNavigationBarItem(icon: Icon(Icons.home_outlined,color: HexColor('#7B7B7B'),size: 20,),label: 'Home',),
      BottomNavigationBarItem(icon: Icon(Icons.category_outlined,color: HexColor('#7B7B7B'),size: 20,),label: 'Categories',),
      BottomNavigationBarItem(icon: Icon(Icons.local_offer_outlined,color: HexColor('#7B7B7B'),size: 20,),label: 'Offers',),
      BottomNavigationBarItem(icon: Stack(children: [Image.asset(Const.cartIcon,height: 18.0,width: 18.0,),
        Padding(
          padding: const EdgeInsets.only(left: 12.0,),
          child: Material(
            child: Container(
                height: 13.0,
                width: 13.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: HexColor('#EF3234'),
                ),
                alignment: Alignment.center,
                child:
                const FittedBox(
                  child: Padding(
                    padding: EdgeInsets.all(0.80),
                    child: Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )),
          ),
        ),
      ],),label: 'Cart',),
      BottomNavigationBarItem(icon: Image.asset(Const.accountIcon,height: 18.0,width: 18.0,),label: 'Account',),
    ],),
        tabBuilder: (context,index){
          switch(index){
            case 0:
              return CupertinoTabView(builder: (context){
                return CupertinoPageScaffold(child: HomeScreen());
              },
                onGenerateRoute: (settings) => NavRouteGenerator.generateRoute(settings),);
            case 1:
              return CupertinoTabView(builder: (context){
                return CupertinoPageScaffold(child: CategoriesScreen());
              },
                  onGenerateRoute: (settings) => NavRouteGenerator.generateRoute(settings));
            case 2:
              return CupertinoTabView(builder: (context){
                return CupertinoPageScaffold(child: OffersScreen());
              },
                  onGenerateRoute: (settings) => NavRouteGenerator.generateRoute(settings));
            case 3:
              return CupertinoTabView(builder: (context){
                return CupertinoPageScaffold(child: CartScreen());
              },
                  onGenerateRoute: (settings) => NavRouteGenerator.generateRoute(settings));
            default:
              return CupertinoTabView(builder: (context){
                return CupertinoPageScaffold(child: AccountScreen());
              },
                  onGenerateRoute: (settings) => NavRouteGenerator.generateRoute(settings));
          }
        }
    );
  }
}
