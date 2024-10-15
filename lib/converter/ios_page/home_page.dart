import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter_app/converter/ios_page/add_people.dart';
import 'package:platform_converter_app/converter/ios_page/setting_page.dart';
import '../../provider/provider_homepage.dart';
import 'call_page.dart';
import 'chat_page.dart';

class HomePageIos extends StatelessWidget {
  const HomePageIos({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_add),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return const AddPeopleIos();
          case 1:
            return const ChatPageIos();
          case 2:
            return const CallPageIos();
          case 3:
            return const SettingPageIos();
          default:
            return Container();
        }
      },
    );
  }
}

CupertinoNavigationBar buildCupertinoNavigationBar(
    ProviderHomepage providerHomepageTrue,
    ProviderHomepage providerHomepageFalse) {
  return CupertinoNavigationBar(
    backgroundColor: Colors.transparent,
    trailing: CupertinoSwitch(
      value: providerHomepageTrue.isIos,
      onChanged: (value) {
        providerHomepageFalse.changePlatform();
      },
    ),
    middle: Text("Platform Converter",style: TextStyle(color: providerHomepageTrue.isDark ? Colors.white: null),),
  );
}
