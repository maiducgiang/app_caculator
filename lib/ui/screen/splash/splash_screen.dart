import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mubaha/data/cache_manager.dart';
import 'package:mubaha/data/firebase/firebase_manager.dart';
import 'package:mubaha/data/model/user_local/user_model_local.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/theme/app_path.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../sign_up/sign_up_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _remoteConfig = FirebaseRemoteConfig.instance;
  final FirebaseManager _firebaseManager = FirebaseManager();
  final _cacheManager = CacheManager.instance;
  Future<void> init() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 60),
      minimumFetchInterval: const Duration(seconds: 1),
    ));
    await _remoteConfig.ensureInitialized();
    await _remoteConfig.activate();
    await _remoteConfig.fetchAndActivate().then((value) {
      checkFirtLoad(showSignUp: _remoteConfig.getBool('show_sign_up'));
    });
  }

  @override
  initState() {
    //init();
    context.router.pushAll([const MainPage()]);
    super.initState();
  }

  void checkFirtLoad({required bool showSignUp}) async {
    UserLocal? userLocal = await _cacheManager.getUserCached();
    if (userLocal != null) showSignUp = false;
    await Future.delayed(const Duration(seconds: 1));
    context.router.pushAll([showSignUp ? const SignUp() : const MainPage()]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            alignment: Alignment.center,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/splash/icon_splash2.svg",
                        width: 50.w,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(
                        "assets/images/splash/icon_splash1.svg",
                        width: 50.w,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/splash/icon_splash3.svg",
                        width: 50.w,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SvgPicture.asset(
                        "assets/images/splash/icon_splash4.svg",
                        width: 50.w,
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
