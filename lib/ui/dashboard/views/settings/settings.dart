import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:how_much_app/core/di/injectable.dart';
import 'package:how_much_app/core/resources/colors_x.dart';
import 'package:how_much_app/core/resources/styles_x.dart';
import 'package:how_much_app/core/routes/routes.gr.dart';
import 'package:how_much_app/features/profile/cubit/profile_cubit.dart';
import 'package:how_much_app/gen/assets.gen.dart';
import 'package:how_much_app/ui/widgets/sheet/h_sheets.dart';
import 'package:iconsax/iconsax.dart';


class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              buildForProfileWid(context),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    buildForSettingsTile(
                        onTap: () {
                          si<AppRouter>().push(ChangePasswordScreen());
                        },
                        title: "Change password",
                        icon: Iconsax.lock),
                    const SizedBox(
                      height: 30,
                    ),
                    buildForSettingsTile(
                      onTap: () {
                        HSheets.showLogoutModal();
                      },
                      title: "Logout",
                      islogoout: true,
                      icon: Iconsax.logout
                    ),
                    // buildForSettingsTile(
                    //     onTap: () {},
                    //     title: "Push notifications",
                    //     hasDivider: true,
                    //     icon: Iconsax.notification,
                    //     hasToggle: true),
                    // const SizedBox(
                    //   height: 30,
                    // ),
                    // buildForSettingsTile(
                    //     onTap: () {},
                    //     hasToggle: true,
                    //     title: "Face ID",
                    //     hasDivider: true,
                    //     icon: HugeIcons.strokeRoundedBiometricAccess),
                  ],
                ),
              ).animate()
              .fade(
                begin: 0,
                end: 1,
                delay: const Duration(milliseconds: 500),
                duration: const Duration(milliseconds: 900)
              )
              .slide(
                begin: const Offset(0, 2.0),
                end: const Offset(0, 0),
                delay: const Duration(milliseconds: 500),
                duration: const Duration(milliseconds: 200)
              ),
            ],
          ),
        ),
      ),
    );
  }
}

buildForProfileWid(context) {
  return BlocBuilder<ProfileCubit, ProfileState>(
    builder: (context, state) {
      return Column(
         children: AnimateList(
          children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: state.selectedImage != null
              ? FileImage(state.selectedImage!)
              : (state.userData?.image?.isNotEmpty ?? false)
                  ? NetworkImage(state.userData!.image!)
                  : AssetImage(Assets.images.profileAvatar.path) as ImageProvider,
        ).animate()
        .fade(
          begin: 0,
          end: 1,
          delay: const Duration(milliseconds: 100),
          duration: const Duration(milliseconds: 1200)
        )
        .slide(
          begin: const Offset(0, 2.0),
          end: const Offset(0, 0),
          delay: const Duration(milliseconds: 100),
          duration: const Duration(milliseconds: 200)
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          state.fullName?.text ?? "",
          style: getBoldStyle(color: ColorsX.textColor, fontSize: 25),
        ).animate()
        .fade(
          begin: 0,
          end: 1,
          delay: const Duration(milliseconds: 200),
          duration: const Duration(milliseconds: 1200)
        )
        .slide(
          begin: const Offset(0, 2.0),
          end: const Offset(0, 0),
          delay: const Duration(milliseconds: 200),
          duration: const Duration(milliseconds: 200)
        ),
        const SizedBox(
          height: 5,
        ),
        Text(state.emailAddress?.text ?? "",
            style: getRegularStyle(color: ColorsX.textGrey, fontSize: 14)).animate()
        .fade(
          begin: 0,
          end: 1,
          delay: const Duration(milliseconds: 300),
          duration: const Duration(milliseconds: 1200)
        )
        .slide(
          begin: const Offset(0, 2.0),
          end: const Offset(0, 0),
          delay: const Duration(milliseconds: 300),
          duration: const Duration(milliseconds: 200)
        ),
        const SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {
            si<AppRouter>().push(const EditProfileScreen());
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: ColorsX.primaryColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              "Edit profile",
              style: getMediumStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ).animate()
        .fade(
          begin: 0,
          end: 1,
          delay: const Duration(milliseconds: 400),
          duration: const Duration(milliseconds: 1200)
        )
        .slide(
          begin: const Offset(0, 2.0),
          end: const Offset(0, 0),
          delay: const Duration(milliseconds: 400),
          duration: const Duration(milliseconds: 200)
        )
      ]));
    },
  );
}

buildForSettingsTile(
    {required onTap,
    required title,
    icon,
    hasToggle = false,
    islogoout = false,
    hasDivider = false}) {
  return InkWell(
    onTap: onTap,
    child: Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(
                icon,
                color: islogoout ? ColorsX.errorColor : ColorsX.textGrey,
                size: 20,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(title,
                  style: getMediumStyle(
                      color:
                          (islogoout) ? ColorsX.errorColor : ColorsX.textColor,
                      fontSize: 18))
            ],
          ),
        ),
        (islogoout)
            ? const SizedBox()
            : Visibility(
                visible: hasToggle,
                replacement: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: ColorsX.textGrey,
                  size: 15,
                ),
                child: SizedBox.fromSize(
                  size: const Size(50, 30),
                  child: Switch.adaptive(
                      value: true,
                      activeColor: ColorsX.primaryColor,
                      onChanged: (v) {}),
                ),
              )
      ],
    ),
  );
}
