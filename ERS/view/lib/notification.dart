import 'package:flutter/material.dart';
//import 'package:view/APIStatus.dart';
import 'package:view/login.dart';
import 'Register.dart';
import 'APIRegister.dart';
import 'APILogin.dart';
import 'APINofification.dart';
import 'package:get_storage/get_storage.dart';


import 'Device.dart';
import 'login.dart';
import 'AddDevice.dart';
import 'APIID_Device.dart';
import 'Status.dart';
import 'APILog.dart';
import 'APIGetToken.dart';
import 'Export.dart';


class NotificationDemo extends StatefulWidget {
  @override
  _NotificationDemoState createState() => _NotificationDemoState();
}

class _NotificationDemoState extends State<NotificationDemo> {
  final box = GetStorage();

   @override
   TextEditingController notificationController = TextEditingController();
   

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange, centerTitle: true,title: Text("ERS"),),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero,
        children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child:  Text('Electricity Reporting System',
                      style: TextStyle(fontSize: 20),
                      maxLines: 1,
              ),
              
            ),
            ListTile(
              title: const Text('Device'),
              onTap: () {
                box.write('IdDevicemode', '1');
                Navigator.pop(context);
                Navigator.push(
                    context,MaterialPageRoute(builder: (context) => APIID_Device()),         
                  );
              },
            ),
            ListTile(
              title: const Text('Status'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,MaterialPageRoute(builder: (context) => StatusWidget()),         
                  );
              },
            ),
            ListTile(
              title: const Text('History'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,MaterialPageRoute(builder: (context) => APILogpage()),         
                  );
              },
            ),
            ListTile(
              title: const Text('Export report'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,MaterialPageRoute(builder: (context) => Export()),         
                  );
              },
            ),
            ListTile(
              title: const Text('Register Notification'),
              onTap: () {
                Navigator.pop(context);
                 Navigator.push(
                    context,MaterialPageRoute(builder: (context) => NotificationDemo()),         
                  );
              },
            ),
            ListTile(
              title: const Text('Status Notification'),
              onTap: () {
                Navigator.pop(context);
                 Navigator.push(
                    context,MaterialPageRoute(builder: (context) => APIGetnotification()),         
                  );
              },
            ),
            ListTile(
              title: const Text('Add Device'),
              onTap: () {
                Navigator.pop(context);
                 Navigator.push(
                    context,MaterialPageRoute(builder: (context) => AddDeviceDemo()),         
                  );
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,MaterialPageRoute(builder: (context) => LoginDemo()),         
                  );
              },
            ),
          ],
        ),
        ),
      backgroundColor: Colors.white,
      //You should use `Scaffold` if you have `TextField` in body.
      //Otherwise on focus your `TextField` won`t scroll when keyboard popup.
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //Body Container
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: <Widget>[
                    //  Container(
                    //   height: 50.0,
                    //   alignment: Alignment.center,
                    //   child: Text("Electricity Reporting System",
                    //   style: TextStyle(
                    //     fontFamily: 'Bai Jamjuree',
                    //     fontSize: 23,
                    //     fontWeight: FontWeight.bold,
                        
                    //   )),
                    // ),
                    Container(
                      height: 50.0,
                      alignment: Alignment.center,
                      child: Text("Add Notification",style: TextStyle(
                        fontFamily: 'Bai Jamjuree',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                    Container(
                       margin: EdgeInsets.only(top: 15.0,bottom:15.0),
                       child: Column(
                        children: <Widget>[
                           new TextFormField(
                             controller: notificationController,
                            decoration: new InputDecoration(
                            hintText: "Enter Token line Notification",
                            border: OutlineInputBorder()
                            ),
                          ),
                        ],
                       ),
                     ),
                    Container(
                      height: 80.0,
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        child: const Text('Add notification'),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                            fixedSize: const Size(150, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        onPressed: ()
                        {
                          if(notificationController.text.isEmpty){
                              print('Empty Fields');
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: new Text("Please Enter Token."),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: new Text("OK"),
                                          onPressed: ()
                                          {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              return;
                            }
                            else{
                              box.write('Token', notificationController.text.toString());
                              print('Token: ');
                              print(box.read('Token'));

                              Navigator.push(
                               context, MaterialPageRoute(builder: (context) => APINotification(boob:notificationController.text)),
                              );
                            }
                        },
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),

            //Footer Container
            //Here you will get unexpected behaviour when keyboard pops-up. 
            //So its better to use `bottomNavigationBar` to avoid this.
            Container(
              padding: const EdgeInsets.all(30.0),
              color: Colors.orange,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}