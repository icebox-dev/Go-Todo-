import 'package:flutter/material.dart';

class ConnectionsScreen extends StatefulWidget {
  const ConnectionsScreen({Key? key}) : super(key: key);

  @override
  State<ConnectionsScreen> createState() => _ConnectionsScreenState();
}

class _ConnectionsScreenState extends State<ConnectionsScreen> {
  Icon searchIcon = Icon(Icons.search);
  Widget searchBar = Text("Connections");

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: TabBarView(
            children: [
              FriendsWidget(),
              GroupsWidget()
            ],
          ),
        ),
        appBar: AppBar(
          shadowColor: Colors.transparent,
          title: searchBar,
          titleSpacing: 0.0,
          actions: [
            IconButton(onPressed: (){
              setState((){
                if(this.searchIcon.icon == Icons.search){
                  this.searchIcon = Icon(Icons.clear);
                  this.searchBar = Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(

                      textInputAction: TextInputAction.go,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search..",
                        hintStyle: TextStyle(
                          color: Colors.white54
                        ),
                      ),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                      ),
                    ),
                  );
                }
                else{
                  this.searchIcon = Icon(Icons.search);
                  this.searchBar = Text("Connections");
                }
              });
            }, icon: searchIcon)
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: "Friends",),
              Tab(text: "Groups",)
            ],
          ),
        ),
      ),
    );
  }
}

//----------------------------------------------------------------------------------

class FriendsWidget extends StatelessWidget {
  const FriendsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FriendRequestView("5"),
        ConnectionListView("https://www.himalmag.com/wp-content/uploads/2019/07/sample-profile-picture.png", "Emma Watson", "emma@exapmle.com"),
        ConnectionListView("https://i.pinimg.com/236x/e2/81/cc/e281cce8e26db25388a247a2c994d1f4.jpg", "Johnny Deep", "jacksparrow@exapmle.com"),
        ConnectionListView("https://i.pinimg.com/564x/a8/73/f3/a873f3f357e4fe348fb8100ce31d62be.jpg", "Dwayne Johnson", "therock@exapmle.com"),
        ConnectionListView("https://i.pinimg.com/236x/80/6c/3b/806c3b0f0aa6ab92a751057f41d3a9ad.jpg", "Gal Gadot", "wonderwoman@exapmle.com"),
      ],
    );
  }
}

class GroupsWidget extends StatelessWidget {
  const GroupsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ConnectionListView("https://images.pexels.com/photos/3184418/pexels-photo-3184418.jpeg?auto=compress&cs=tinysrgb&w=126&h=75&dpr=1", "IceBox Developers", "Tap for more info.."),
        ConnectionListView("https://i.pinimg.com/564x/8e/93/b6/8e93b6dd83bf48aa388fd2c95d7d1b19.jpg", "Fast and Furious", "Tap for more info.."),

      ],
    );
  }
}

class ConnectionListView extends StatelessWidget {

  final String urlStr;
  final String mainTitle;
  final String subTittle;

  ConnectionListView(this.urlStr,this.mainTitle,this.subTittle);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage:NetworkImage(urlStr),radius: 25,),
      title: Text(mainTitle,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),),
      subtitle: Text(subTittle,style: TextStyle(letterSpacing: 2,fontStyle: FontStyle.italic),),
      onTap: (){},
      dense: false,
    );
  }
}

class FriendRequestView extends StatelessWidget {

  final String number;

  FriendRequestView(this.number);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.blue[100],
      leading: CircleAvatar(child: Icon(Icons.person_add_alt),),
      title: Text("Friend Requests..",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),),
      trailing: Container(
        child: Text(number),
        height: 20,
        width: 20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle
        ),
      ),
      onTap: (){},
      dense: false,
    );
  }
}

//----------------------------------------------------------------------------------


