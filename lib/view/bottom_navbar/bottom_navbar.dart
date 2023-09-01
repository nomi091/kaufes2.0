import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaufes/utils/routes/routes.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/constant_width.dart';
import '../account_screens/account_setting.dart';
import '../my_ads_screen/my_ads_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _buildPage(_selectedIndex),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(left: 19.0, right: 19.0),
          child: SizedBox(
            height: kBottomNavigationBarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // SizedBox(
                //   width: ConstantSize.getWidth(context) * 0.02,
                // ),
                _buildNavItem(0, CupertinoIcons.home, 'Home'),
                SizedBox(
                  width: ConstantSize.getWidth(context) * 0.01,
                ),
                _buildNavItem(1, CupertinoIcons.chat_bubble, 'Chat'),
                SizedBox(
                  width: ConstantSize.getWidth(context) * 0.12,
                ),
                _buildNavItem(3, Icons.add_chart, 'My Ads'),
                // SizedBox(
                //   width: ConstantSize.getWidth(context) * 0.1,
                // ),
                _buildNavItem(4, CupertinoIcons.person, 'Account'),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        child: const Icon(CupertinoIcons.plus),
        onPressed: () {
          // Action for the center FAB
          Navigator.pushNamed(context, ScreenRoutes.createAdDetailScreen);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNavItem(int index, IconData icon, String title) {
    final isSelected = index == _selectedIndex;

    return InkWell(
      onTap: () => _onNavItemTapped(index),
      child: SizedBox(
        height: kBottomNavigationBarHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: isSelected ? 4.0 : 0.0,
              color: isSelected ? AppColors.primaryColor : Colors.transparent,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: isSelected ? AppColors.primaryColor : Colors.black,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: isSelected ? AppColors.primaryColor : Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return const AccountScreen();
      case 1:
        return Center(
          child: Text(
            'Chat Screen',
            style: MyTextStyles.subHeadingBoldBlack,
          ),
        );
      case 2:
        return Container(); // Empty container for the center FAB
      case 3:
        return const MyAdsScreen();

      case 4:
        return const AccountScreen();

      default:
        return Container();
    }
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
