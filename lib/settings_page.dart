import 'package:flutter/material.dart';
import 'package:movie_list_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
   
   SettingsPage({super.key, });



  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.error,
        title: Text("Settings",  style: TextStyle(fontSize: 30, fontWeight: .w700 ,color: Colors.white)),),
        body:Consumer<ThemeProvider>(builder:(context, provider, child) =>  Container(
          child: SwitchListTile.adaptive(
            title: Text("Theme Mode" ,style: TextStyle(fontSize: 23, fontWeight: .w500),),
            subtitle: Text('Change the theme mode hare ',style: TextStyle(fontSize: 19, fontWeight: .w400),),
            value: provider.getThemeMode(), onChanged:(value) => provider.updateTheme(mode:value),),
        ),)
    );
  }
}