import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:app/core/Router/appRouter.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/network/cachehelper.dart';
import 'package:app/core/network/endpoints.dart';

class SplachBody extends StatelessWidget {
  const SplachBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      onFinish: (direction) {
        // print('before Tokenfff :${CacheHelper().getData(key: ApiKeys.token)}');
        // CacheHelper().clearData(key: ApiKeys.token);

        if (CacheHelper().getData(key: ApiKeys.token) != null) {
          Navigator.pushReplacementNamed(context, Approuter.homePage);
          print('after Tokenfff :${CacheHelper().getData(key: ApiKeys.token)}');
        } else {
          Navigator.pushReplacementNamed(context, Approuter.onBording);
        }
      },
      child: Center(
        child: Image.asset(
          ImageManager.marktiaLogo,
          height: 256,
          width: 300.17,
        ),
      ),
    );
  }
}
