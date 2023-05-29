import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tokosmileui/modules/home/homepage.dart';
import 'package:tokosmileui/shared/constants/colors.dart';
import 'package:tokosmileui/shared/constants/strings.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

int _currentIndex = 0;
List<Widget> _children = [];

class _NavState extends State<Nav> {
  @override
  void initState() {
    _children = [const HomePage(), Container(), Container(), Container()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      // backgroundColor: AppColors.white,
      body: IndexedStack(index: _currentIndex, children: _children),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.navTextColor,
        selectedLabelStyle: const TextStyle(
          fontFamily: Strings.roboto,
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.navTextColor
        ),
        backgroundColor: white,
        selectedFontSize: 12,
        elevation: 2.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: tabItem,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: Strings.home,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number_outlined),
            label: Strings.voucher,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: Strings.wallet,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: Strings.settings,
          )
        ],
      ),
    );
  }

  void tabItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
