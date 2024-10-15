import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../converter/android_page/home_page.dart';
import '../converter/ios_page/home_page.dart';
import '../provider/provider_homepage.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ProviderHomepage providerHomepageTrue = Provider.of<ProviderHomepage>(context, listen: true);
    return (providerHomepageTrue.isIos)
        ? const HomePageIos()
        : const HomePageAndroid();
  }
}
