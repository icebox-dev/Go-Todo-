import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../StateManagement/google_sign_in.dart';

class NavDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    final user = FirebaseAuth.instance.currentUser;
    final userName = user?.displayName;
    final emailId = user?.email;
    final imageURL = user?.photoURL;
    print('-----------------------');
    print(userName);

    return Drawer(
      backgroundColor: Theme.of(context).backgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // DrawerHeader(
          //   child: Text(
          //     '',
          //     style: TextStyle(color: Colors.white, fontSize: 25),
          //   ),
          //   decoration: BoxDecoration(
          //       color: Colors.green,
          //       image: DecorationImage(
          //           fit: BoxFit.fill,
          //           image: AssetImage('assets/images/cover.jpg'))),
          // ),
          DrawerHeader(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      child: ClipOval(
                        child: Image.network(imageURL!),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName!,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: queryData.size.width * 0.05),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            emailId!,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: queryData.size.width * 0.04),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).appBarTheme.backgroundColor),
          ),

          ListTile(
            leading: Icon(
              Icons.people_alt,
              color: Theme.of(context).iconTheme.color,
            ),
            title: Text(
              'Connections',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            onTap: () => {},
          ),

          ListTile(
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).iconTheme.color,
            ),
            title: Text(
              'Settings',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),

          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Theme.of(context).iconTheme.color,
            ),
            title: Text(
              'Logout',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            onTap: () {
              final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogout();
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
