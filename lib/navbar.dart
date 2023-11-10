import 'package:flutter/material.dart';

// Example of a valid menuItems list at end of file.
class NavBar extends StatelessWidget {
  // -- Singleton Implementation

  // -- Class variables & declarations
  final Color? profileBackgroundColor;
  final ImageProvider? profileBackgroundImage;
  final Widget? profilePicture;
  final String? profileName;
  final String? profileEmail;
  final bool padTop;
  final List<Widget>? menuItems; // ListTiles
  final Function? onProfilePictureTap;

  // -- c'tor(s) & d'tor
  const NavBar({
    super.key,
    this.profileBackgroundColor,
    this.profileBackgroundImage,
    this.profilePicture,
    this.profileName,
    this.profileEmail,
    this.menuItems,
    this.padTop = false,
    this.onProfilePictureTap,
  });

  // -- Properties

  // -- Public methods
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: padTop ? null : EdgeInsets.zero,
        children: [
          _buildHeader(),
          ...menuItems ?? [],
        ],
      ),
    );
  }

  // -- Private methods
  Widget _buildHeader() {
    if (profileBackgroundColor != null ||
        profileBackgroundImage != null ||
        profilePicture != null ||
        profileName != null ||
        profileEmail != null) {
      return InkWell(
        child: UserAccountsDrawerHeader(
          accountName: Text(profileName ?? "", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          accountEmail: Text(profileEmail ?? ""),
          currentAccountPicture: InkWell(
            onTap: () {
              onProfilePictureTap?.call();
            },
            child: (profilePicture != null)
                ? CircleAvatar(
                    child: ClipOval(
                      child: profilePicture,
                    ),
                  )
                : const CircleAvatar(
                    child: Icon(Icons.person, size: 50),
                  ),
          ),
          decoration: BoxDecoration(
            color: profileBackgroundColor,
            image: profileBackgroundImage != null
                ? DecorationImage(
                    image: profileBackgroundImage!,
                    fit: BoxFit.cover,
                  )
                : null,
          ),
        ),
      );
    }
    return Container();
  }
}

/*
  Example of a valid menuItems list::
    List<Widget> menuItems = [
      ListTile(
        leading: const Icon(Icons.favorite),
        title: const Text("Favorates"),
        onTap: () {},
      ),
      Divider(),
      ListTile(
        leading: Icon(Icons.notifications),
        title: Text("Requests"),
        onTap: () {},
        trailing: ClipOval(
          child: Container(
            color: Colors.red,
            width: 20,
            height: 20,
            child: const Center(
              child: Text(
                "8",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
      ),
    ];
*/
