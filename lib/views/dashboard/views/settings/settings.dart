import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:how_much_app/core/resources/colors_x.dart';
import 'package:how_much_app/core/resources/styles_x.dart';
import 'package:how_much_app/views/dashboard/dashboard.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iconsax/iconsax.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              buildForProfileWid(),
                    const SizedBox(height: 30,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "General",
              style: getMediumStyle(
                color: ColorsX.textGrey,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: ColorsX.backgroundColor,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: ColorsX.grey
              )
            ),
            child: Column(
              children: [
                buildForSettingsTile(
                  onTap: (){}, 
                  title: "My proposals",
                  hasDivider: true,
                  icon: Iconsax.box
                ),
                buildForSettingsTile(
                  onTap: (){}, 
                  title: "Change password",
                  icon: Iconsax.lock
                ),
              ],
            ),
          )
        ],
      ),
      const SizedBox(height: 15,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Preferences",
              style: getMediumStyle(
                color: ColorsX.textGrey,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: ColorsX.backgroundColor,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: ColorsX.grey
              )
            ),
            child: Column(
              children: [
                buildForSettingsTile(
                  onTap: (){}, 
                  title: "Push notifications",
                  hasDivider: true,
                  icon: Iconsax.notification,
                  hasToggle: true
                ),
                buildForSettingsTile(
                  onTap: (){}, 
                  hasToggle: true,
                  title: "Face ID",
                  hasDivider: true,
                  icon: HugeIcons.strokeRoundedBiometricAccess
                ),
                buildForSettingsTile(
                  onTap: (){}, 
                  title: "Logout",
                  islogoout: true,
                  icon: Iconsax.logout
                ),
              ],
            ),
          )
        ],
      ),
            ],
          ),
        ),
      ),
    );
  }
}

buildForProfileWid() {
  return Column(
    children: AnimateList(
      // effects: [
      //   const ScaleEffect(
      //     duration: Duration(milliseconds: 100),
      //     curve: Curves.easeInOut,
      //   )
      // ],
      children: [
        const CircleAvatar(
          radius: 40,
        ),
        const SizedBox(height: 15,),
        Text(
          "Akintade Oluwaseun",
          style: getBoldStyle(
            color: ColorsX.textColor,
            fontSize: 25
          ),
        ),
        const SizedBox(height: 5,),
        Text(
          "akintadeseun816@gmail.com",
          style: getRegularStyle(
            color: ColorsX.textGrey,
            fontSize: 14
          )
        ),
        const SizedBox(height: 15,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: ColorsX.textColor,
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
      ]
    )
  );
}

buildForSettingsTile({
  required onTap,
  required title,
  icon,
  hasToggle = false,
  islogoout = false,
  hasDivider = false
}) {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  height: 35,
                  width: 35,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    icon,
                    color: islogoout ?
                    ColorsX.errorColor:
                    ColorsX.textGrey,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 15,),
                Text(
                  title,
                  style: getMediumStyle(
                    color: (islogoout)?
                    ColorsX.errorColor:
                    ColorsX.textColor,
                    fontSize: 18
                  )
                )
              ],
            ),
          ),
          (islogoout)?
          const SizedBox():
          Visibility(
            visible: hasToggle,
            replacement: Icon(
              Icons.arrow_forward,
              color: ColorsX.textGrey,
            ),
            child: SizedBox.fromSize(
              size: const Size(50, 30),
              child: Switch.adaptive(
                value: true, 
                activeColor: ColorsX.primaryColor,
                onChanged: (v){
              
                }
              ),
            ),
          )
        ],
      ),
      Visibility(
        visible: hasDivider,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Divider(
            color: ColorsX.grey,
          ),
        ),
      )
    ],
  );
}