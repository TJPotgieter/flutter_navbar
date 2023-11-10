# NavBar
## Table ofcontent
- [Install](#install)
- [Usage](#usage)
- [Versions](#vers)

## Install
<a href="install"></a>Add the following entry into your pubspec.yaml file under *dependencies*:
```
  navbar:
    git:
      url: https://github.com/TJPotgieter/flutter_navbar.git
      tag: 1.0.0
```

Replace tag with the correct version of the library.

## Versions Available
<a href="vers"></a>
| Version | Note |
|---|---|
| 1.0.0 | Initial release |

## Usage
<a href="usage"></a>Example usage:
```
import 'package:flutter/material.dart';
import 'package:sidebar_one/navbar.dart';
import 'package:sidebar_one/navbar0.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> menuItems = [
      ListTile(
        leading: const Icon(Icons.favorite),
        title: const Text("Favorates"),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.people),
        title: const Text("Friends"),
        onTap: () {},
      ),
    ];

    return MaterialApp(
      home: Scaffold(
        drawer: NavBar(
          onProfilePictureTap: () {
            print("Header Tapped");
          },
          profileBackgroundColor: Colors.blue,
          profileBackgroundImage: const NetworkImage("https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg"),
          profileEmail: "tester@test.com",
          profileName: "Tester",
          profilePicture: Image.network(
            "https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png",
            width: 90,
            height: 90,
            fit: BoxFit.cover,
          ),
          menuItems: menuItems,
        ),
        appBar: AppBar(
          title: const Text("Sidebar One"),
        ),
        body: const Center(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
```
