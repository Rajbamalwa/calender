import 'package:calender/Utils/Button/Button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../Provider/themePro.dart';
import '../Colors/Colors.dart';
import '../TextStyle/textStyle.dart';
import '../Utils.dart';

class UserContainer extends StatefulWidget {
  const UserContainer({Key? key}) : super(key: key);

  @override
  State<UserContainer> createState() => _UserContainerState();
}

class _UserContainerState extends State<UserContainer> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance.currentUser;
    final themeChanger = Provider.of<ThemeFun>(context);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
              child: Padding(
                  padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 10, bottom: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(
                                  auth!.photoURL.toString(),
                                ),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                    ),
                  ))),
          ListTile(
            leading: const Icon(
              Icons.person,
            ),
            title: Text(
              user!.displayName.toString(),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.alternate_email,
            ),
            title: Text(
              auth.email.toString(),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.contact_page,
            ),
            title: const Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Container(
                padding: const EdgeInsets.only(right: 20, left: 10),
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    RadioListTile<ThemeMode>(
                        title: const Text('Light Theme'),
                        value: ThemeMode.light,
                        groupValue: themeChanger.themeMode,
                        onChanged: (themeChanger.setTheme)),
                    RadioListTile<ThemeMode>(
                        title: const Text('Dark Theme'),
                        value: ThemeMode.dark,
                        groupValue: themeChanger.themeMode,
                        onChanged: (themeChanger.setTheme)),
                    RadioListTile<ThemeMode>(
                        title: const Text('System Theme'),
                        value: ThemeMode.system,
                        groupValue: themeChanger.themeMode,
                        onChanged: (themeChanger.setTheme)),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: ElevatedButton(
                child: const SizedBox(
                    height: 50, child: Center(child: Text('Sign Out'))),
                onPressed: () {}),
          ),
        ],
      ),
    );
  }
}

class AccountWidget extends StatelessWidget {
  AccountWidget({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 1, 20, 1),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    text,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    softWrap: false,
                    style: textStyle().googleStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*Container(
width: double.infinity,
decoration: BoxDecoration(color: Colors.blue.shade200),
child: Column(
mainAxisAlignment: MainAxisAlignment.start,
children: [
Text(
'Your Card',
style: textStyle().googleStyle,
),
Padding(
padding: const EdgeInsets.only(top: 40, bottom: 30),
child: Container(
height: 200,
width: 200,
decoration: BoxDecoration(
shape: BoxShape.circle,
image: DecorationImage(
image: NetworkImage(
auth!.photoURL.toString(),
),
fit: BoxFit.cover),
),
),
),
AccountWidget(
text: 'Name - ${auth.displayName.toString()}',
),
AccountWidget(
text: 'Email - ${auth.email.toString()}',
),
InkWell(
onTap: () {
Utils.flushBarError(
'Please Email your query at sendhere819@gmail.com',
context);
},
child: AccountWidget(
text: 'Contact Us',
),
),
RadioListTile<ThemeMode>(
title: const Text('Light Theme'),
value: ThemeMode.light,
groupValue: themeChanger.themeMode,
onChanged: (themeChanger.setTheme)),
RadioListTile<ThemeMode>(
title: const Text('Dark Theme'),
value: ThemeMode.dark,
groupValue: themeChanger.themeMode,
onChanged: (themeChanger.setTheme)),
RadioListTile<ThemeMode>(
title: const Text('System Theme'),
value: ThemeMode.system,
groupValue: themeChanger.themeMode,
onChanged: (themeChanger.setTheme)),
],
),
),*/
