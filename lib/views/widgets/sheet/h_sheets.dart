import 'package:flutter/material.dart';
import 'package:how_much_app/core/di/injectable.dart';
import 'package:how_much_app/core/routes/routes.gr.dart';
import 'package:how_much_app/views/components/logout_wid.dart';
import 'package:how_much_app/views/components/upload_profile_pic.dart';

class HSheets {
  
  static bottomSheet(
    {
      context,
      bool isDismissible = false,
      bool enableDrag = true,
      Widget? child,
    }
  ) {
    return showModalBottomSheet(
      context: context, 
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )
      ),
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => child ?? const SizedBox()
    );
  }

  static showUploadProfilePicSheet() {
    var context = si<AppRouter>().navigatorKey.currentContext;
    return bottomSheet(
      context: context,
      child: const UploadProfilePicWid(),
    );
  }

  static showLogoutModal() {
    var context = si<AppRouter>().navigatorKey.currentContext;
    return bottomSheet(
      context: context,
      child: const LogoutWid(),
    );
  }

}