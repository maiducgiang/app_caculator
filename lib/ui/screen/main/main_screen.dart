import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/icons/assets.gen.dart';
import 'package:mubaha/ui/screen/calculator/calculator_screen.dart';
import 'package:mubaha/ui/screen/choose_theme/choose_theme_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const CalculatorScreen(),
    Container(color: Colors.blue),
    const ChooseThemeScreen()
  ];

  final List<String> _title = [
    'Máy tính',
    'Chuyển đổi tiền tệ',
    'Chủ đề',
    'Đăng xuất'
  ];

  final List<String> _icon = [
    Assets.images.icCalculator.path,
    Assets.images.icCurrencyConvert.path,
    Assets.images.icTheme.path,
    Assets.images.icLogout.path
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title[_selectedIndex],
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        centerTitle: false,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 112.h,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(0xFFFF6B6B),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20)
                  )
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: Colors.grey),
                    ),
                    SizedBox(width: 16.w),
                    const Flexible(
                      child: Text(
                          'Xin chào, Tom',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white
                        ),
                      ),
                    )
                  ],
                )
              ),
            ),

            Column(
              children: List.generate(4, (index){
                return ListTile(
              leading: Image.asset(
                _icon[index],
                height: 24,
                width: 24,
              ),
              title: Text(_title[index]),
              selected: _selectedIndex == index,
              onTap: () {
                if(index == 3) {
                  ///TODO: implement logout
                } else {
                  _onItemTapped(index);
                }
              },
            );
              }),
            )
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex)
    );
  }
}