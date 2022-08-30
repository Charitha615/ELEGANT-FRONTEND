import 'package:elegant_fit_on/screens/LoginScreen/login_screen.dart';
import 'package:elegant_fit_on/screens/Profiles/UserProfile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


bool isLoading = false;

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<NavBar> {
  var user_Name = "", user_Email = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }

  getToken() async {
    setState(() {
      isLoading = true;
    });
    final prefs = await SharedPreferences.getInstance();
    user_Email = prefs.getString('user_email').toString();
    user_Name = prefs.getString('user_name').toString();

    print("NavBar username" + user_Name);

    if (user_Name.length > 0) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: new Text(user_Name),
            accountEmail: Text(user_Email),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                  child: Image.network(
                "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80",
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              )),
            ),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1586672806791-3a67d24186c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y292ZXIlMjBhcnR8ZW58MHx8MHx8&w=1000&q=80"),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            // onTap: () => null,
            onTap: () => {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => UserHome(),
              //     ))
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Profile"),
            // onTap: () => null,
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserProfile(),
                  ))
            },
          ),
          ListTile(
            onTap: () {
              clearSharedPreferences();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }

  void clearSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    print("cleared");
  }
}
