import 'package:flutter/material.dart';
import 'package:instagram/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class screenhome extends StatelessWidget {
  const screenhome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(166, 224, 7, 97),
        title: Text('chats'),
        actions: [
          IconButton(
              onPressed: () {
                signout(context);
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: SafeArea(
        child:
            // ListView(
            //   children: [
            //     Row(
            //       children: [
            //         CircleAvatar(
            //           radius: 20,
            //           backgroundImage: AssetImage('assets/images/avatar1.webp'),
            //         ),
            //         Column(
            //           children: [
            //             Text('   RF_EQ__'),
            //             Text('india'),
            //           ],
            //         ),
            //       ],
            //     ),
            //     Image.asset('assets/images/IMG_2003.JPG'),
            //     Divider(),
            //     Row(
            //       children: [
            //         CircleAvatar(
            //           radius: 20,
            //           backgroundImage: AssetImage('assets/images/avatar2.png'),
            //         ),
            //         Column(
            //           children: [
            //             Text('    SHAZZ__0'),
            //             Text('kerala'),
            //           ],
            //         ),
            //       ],
            //     ),
            //     Image.asset('assets/images/FEVF2944.JPG'),
            //     Divider(),
            //     Row(
            //       children: [
            //         CircleAvatar(
            //           radius: 20,
            //           backgroundImage: AssetImage('assets/images/avatar3.webp'),
            //         ),
            //         Column(
            //           children: [
            //             Text('    RQ__0340'),
            //             Text('vadasseri'),
            //           ],
            //         ),
            //       ],
            //     ),
            //     Image.asset('assets/images/TIBA4004.JPG'),
            //     Divider(),
            //   ],
            // ),

            ListView.separated(
          itemBuilder: ((context, index) {
            return ListTile(
              leading: (index % 2 == 0)
                  ? const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/FEVF2944.JPG'),
                    )
                  : Container(
                      height: 40,
                      width: 40,
                      child: Image.asset("assets/images/IMG_2003.JPG"),
                    ),
              title: Text("Person ${index + 1}"),
              subtitle: Text("Messege in person ${index + 1}"),
              trailing: Text("${index}:00"),
            );
          }),
          separatorBuilder: (context, index) => Divider(),
          itemCount: 23,
        ),
      ),
    );
  }

  signout(BuildContext ctx) async {
    final _sharepreference = await SharedPreferences.getInstance();
    _sharepreference.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx2) => screenlogin()), (route) => false);
  }
}
