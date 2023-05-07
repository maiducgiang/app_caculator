import 'package:auto_route/auto_route.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/data/cache_manager.dart';
import 'package:mubaha/data/model/status_click/status_click.dart';
import 'package:mubaha/icons/assets.gen.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/screen/calculator/calculator_screen.dart';
import 'package:mubaha/ui/screen/change_money_screen/change_money_screen.dart';
import 'package:mubaha/ui/screen/choose_theme/choose_theme_screen.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late bool showPopup = false;
  final _remoteConfig = FirebaseRemoteConfig.instance;
  final CacheManager _cacheManager = CacheManager.instance;
  String loginUrl = '';
  String signUpUrl = '';
  String supportUrl = '';

  final List<Widget> _widgetOptions = <Widget>[
    const CalculatorScreen(),
    const ChangeMoneyScreen(),
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

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });

    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 60),
      minimumFetchInterval: const Duration(seconds: 1),
    ));
    await _remoteConfig.ensureInitialized();
    await _remoteConfig.activate();
    await _remoteConfig.fetchAndActivate().then((value) {
      showPopup = _remoteConfig.getBool('show_sign_up');
      loginUrl = _remoteConfig.getString('login_url');
      signUpUrl = _remoteConfig.getString('signup_url');
      supportUrl = _remoteConfig.getString('support_url');
    });
    StatusClick? status = await _cacheManager.getStatusClickCached();
    if (showPopup == true && status == null) {
      _showMaterialDialog();
    }
  }

  void _showMaterialDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          child: Container(
            height: 280.h,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close_rounded,
                      size: 32,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final url = loginUrl;
                          _cacheManager.addStatusClickToCached(
                              StatusClick(statusClick: true));
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url));
                          } else {
                            throw 'Could not launch $url';
                          }
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              top: 10.h, left: 12.h, right: 12.h),
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          decoration: BoxDecoration(
                              color: const Color(0xFFFF8686),
                              borderRadius: BorderRadius.circular(16)),
                          child: const Center(
                            child: Text(
                              "Đăng nhập",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          _cacheManager.addStatusClickToCached(
                              StatusClick(statusClick: true));
                          final url = signUpUrl;
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url));
                          } else {
                            throw 'Could not launch $url';
                          }
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              top: 16.h, left: 12.h, right: 12.h),
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          decoration: BoxDecoration(
                              color: const Color(0xFFFF8686),
                              borderRadius: BorderRadius.circular(16)),
                          child: const Center(
                            child: Text(
                              'Đăng ký',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          _cacheManager.addStatusClickToCached(
                              StatusClick(statusClick: true));
                          final url = supportUrl;
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url));
                          } else {
                            throw 'Could not launch $url';
                          }
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              top: 16.h, left: 12.h, right: 12.h),
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          decoration: BoxDecoration(
                              color: const Color(0xFFFF8686),
                              borderRadius: BorderRadius.circular(16)),
                          child: const Center(
                            child: Text(
                              'Trợ giúp',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                )
              ],
            ),
          ),
        );
      },
    );
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         title: ,
    //         //content: Text('Hey! I am Coflutter!'),
    //         actions: <Widget>[],
    //       );
    //     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: appBarColor,
          // backgroundColor: backgroundColor,
          iconTheme: IconThemeData(color: textAppBarColor),
          title: Text(
            _title[_selectedIndex],
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: textAppBarColor),
          ),
          centerTitle: false,
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
        ),
        // backgroundColor: backgroundColor,
        drawer: Drawer(
          backgroundColor: backgroundColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: 112.h,
                child: DrawerHeader(
                    decoration: const BoxDecoration(
                        color: Color(0xFFFF6B6B),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20))),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person, color: Colors.grey),
                        ),
                        SizedBox(width: 16.w),
                        const Flexible(
                          child: Text(
                            'Xin chào',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                        )
                      ],
                    )),
              ),
              Column(
                children: List.generate(showPopup == true ? 4 : 3, (index) {
                  return ListTile(
                    leading: Image.asset(
                      _icon[index],
                      height: 24,
                      width: 24,
                    ),
                    title: Text(
                      _title[index],
                      style: index != _selectedIndex
                          ? titleStyle.copyWith(
                              height: 0, fontSize: 14.sp, color: textColor)
                          : titleStyle.copyWith(
                              height: 0, fontSize: 14.sp, color: primaryColor),
                    ),
                    selected: _selectedIndex == index,
                    onTap: () async {
                      if (index == 3) {
                        ///TODO: implement logout
                        await _cacheManager.deleteUserToCached();
                        _cacheManager.addStatusClickToCached(null);
                        context.router.push(const SplashPage());
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
        body: _widgetOptions.elementAt(_selectedIndex));
  }
}
