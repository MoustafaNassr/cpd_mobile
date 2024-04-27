
import 'package:apex_cpd/presentation/screens/certificate/add_certificate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constant/assets.dart';
import '../../../../core/constant/colors.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';


class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});
  
  
  @override  
  // ignore: library_private_types_in_public_api
  _MyNavigationBarState createState() => _MyNavigationBarState();  
}  
  
class _MyNavigationBarState extends State<MyNavigationBar > {  
  int _selectedIndex = 0;  
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  static  final List<Widget> _widgetOptions = <Widget>[  
    HomeScreen(),  
   AddCertificate(),
 ProfileScreen() ];  
  
  void _onItemTapped(int index) {  
    setState(() {  
      _selectedIndex = index;  
    });  
  }  
  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      key: scaffoldKey,
      
  
      body: Center(  
        child: _widgetOptions.elementAt(_selectedIndex),  
      ),  
      bottomNavigationBar: BottomNavigationBar(  
      showSelectedLabels: false,
      showUnselectedLabels: false,

        backgroundColor: ResColors.primary,
        items:  <BottomNavigationBarItem>[  
          BottomNavigationBarItem( 
            backgroundColor: ResColors.primary,
            icon:  SvgPicture.asset(ResAssets.folder),  
              label:'',
            activeIcon:  SvgPicture.asset(ResAssets.folderColored),  
         
           
          ),  
          BottomNavigationBarItem(  
             backgroundColor: ResColors.primary,
            icon:  SvgPicture.asset(ResAssets.file,),
            label:'',  
          activeIcon:  SvgPicture.asset(ResAssets.fileColored,),  
          ),  
         
          BottomNavigationBarItem(  
             backgroundColor: ResColors.primary,
            icon: SvgPicture.asset(ResAssets.user,),
            label: '',  
            activeIcon: SvgPicture.asset(ResAssets.userColored,),
          ),  
        ],  
        type: BottomNavigationBarType.shifting,  
        currentIndex: _selectedIndex,  
        selectedItemColor: Colors.black,  
        iconSize: 40,  
        onTap: _onItemTapped,  
        elevation: 5  
      ),  
    );  
  }  
}  

