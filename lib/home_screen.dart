import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:light_and_dark_theme/light_and_dark_theme/style.dart';
import 'package:light_and_dark_theme/light_and_dark_theme/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ThemeProvider themeProvider = ThemeProvider();
  bool switchValue = false;

  void getCurrentTheme() async {
    themeProvider.darkTheme = await themeProvider.preference.getTheme();
  }

  @override
  void initState() {
    getCurrentTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => themeProvider,
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            theme: Style.themeData(themeProvider.darkTheme),
            home: Scaffold(
              appBar: AppBar(
                title: Center(child: Text('Home Screen')),
              ),
              body: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Switch(
                        value: switchValue,
                        onChanged: (val) {
                          themeProvider.darkTheme = !themeProvider.darkTheme;
                          setState(() {
                            switchValue = val;
                          });
                        }),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
