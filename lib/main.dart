import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app/dynamic/providers/theme_provider.dart';
import 'package:social_app/static/screens/tabbar/tabbar_menu.dart';
import 'package:social_app/static/utils/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
          builder: (context, ThemeProvider notifier, child) {
        return MaterialApp(
          home: TabbarMenu(),
          theme: notifier.darkTheme ? dark : light,
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}

// class Menu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     //HEIGHT-WIDTH
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     //THEMES
//     var theme = Theme.of(context);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: theme.primaryColor,
//         title: Text(
//           'Hello',
//           style: theme.textTheme.headline4,
//         ),
//       ),
//       backgroundColor: theme.primaryColorLight,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             height: 200,
//             width: 200,
//             color: theme.primaryColorLight,
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Container(
//             height: 200,
//             width: 200,
//             color: theme.primaryColorDark,
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Consumer<ThemeProvider>(
//             builder: (context, notifier, child) => RaisedButton(
//               color: theme.primaryColorDark,
//               onPressed: () {
//                 notifier.toggleTheme();
//               },
//               child: Text(
//                 "Theme",
//                 style: theme.textTheme.headline3,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
