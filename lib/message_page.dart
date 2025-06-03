import 'package:chat_app/core/theme.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Message",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 70,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "Recent",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Container(
              height: 100,
              padding: EdgeInsets.all(5),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildRecentContact("Test1", context),
                  _buildRecentContact("Test2", context),
                  _buildRecentContact("Test3", context),
                  _buildRecentContact("Test4", context),
                  _buildRecentContact("Test5", context)
                ],
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: DefaultColors.messageListPage,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)
                    )
                  ),
                  child: ListView(
                    children: [
                      _buildMessageTitle("Test1", "test@gmail.com", "08:43"),
                      _buildMessageTitle("Test1", "test@gmail.com", "08:43"),
                      _buildMessageTitle("Test1", "test@gmail.com", "08:43"),
                      _buildMessageTitle("Test1", "test@gmail.com", "08:43"),
                      _buildMessageTitle("Test1", "test@gmail.com", "08:43"),
                    ],
                  ),
                )
            )
          ],
        ));
  }
}

Widget _buildMessageTitle(String name, String message, String time) {
  return ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    leading: CircleAvatar(
      radius: 30,
      backgroundImage: NetworkImage("https://via.placeholder.com/150"),
    ),
    title: Text(name,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    subtitle: Text(
      message,
      style: TextStyle(color: Colors.grey),
      overflow: TextOverflow.ellipsis,
    ),
    trailing: Text(
      time,
      style: TextStyle(color: Colors.grey),
    ),
  );
}

Widget _buildRecentContact(String name, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage("https://via.placeholder.com/150"),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          name,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    ),
  );
}
