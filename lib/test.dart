//import 'package:flutter/material.dart';
//import 'package:loyalty_app/loyalty_components.dart';
//
//class LoyaltyDrawerHeader extends StatefulWidget {
//  @override
//  _LoyaltyDrawerHeaderState createState() => _LoyaltyDrawerHeaderState();
//}
//
//class _LoyaltyDrawerHeaderState extends State<LoyaltyDrawerHeader> {
//  final DrawerHeaderUserInfo userInfoObject = UserInfoHandler.getUserInfo();
//  @override
//  Widget build(BuildContext context) {
//    return Semantics(
//      container: true,
//
//      child: DrawerHeader(
//        margin: EdgeInsets.only(bottom: 8.0),
//        decoration: BoxDecoration(
//          color: Color.fromARGB(255, 106, 9, 6),
//
//        ),
//        padding:  EdgeInsetsDirectional.only(top: 12.0, start: 80.0),
//        child: SafeArea(
//          bottom: false,
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.stretch,
//            children: <Widget>[
//              Expanded(
//                  child: Padding(
//                    padding: const EdgeInsetsDirectional.only(end: 16.0),
//                    child: Stack(
//                      children: <Widget>[
//                        PositionedDirectional(
//                          top: 0.0,
//                          end: 0.0,
//                          child: Row(
//                            children: <Widget>[
//                              Padding(
//                                  padding: const EdgeInsetsDirectional.only(start: 8.0),
//                                  child: Semantics(
//                                    container: true,
//                                    child: Container(
//                                      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
//                                      width: 48.0,
//                                      height: 48.0,
//                                      child:GestureDetector(
//                                        child:  Icon(Icons.menu,size: 30,color: Colors.white
//                                          , ),
//                                        onTap: (){
//                                          Navigator.of(context).pop();
//                                        },
//                                      ),
//                                    ),
//                                  )
//                              )
//                            ],
//                          ),
//                        ),
//                        Positioned(
//                          top: 0.0,
//                          left: 10.0,
//                          child:       Semantics(
//                            explicitChildNodes: true,
//
//                            child: SizedBox(
//                                width: 72.0,
//                                height: 72.0,
//                                child: CircleAvatar(
//                                  backgroundImage:  NetworkImage(userInfoObject.userProfilePicUrl),
//                                  backgroundColor: Color.fromARGB(255, 106, 9, 6),
//
//                                )
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//
//
//
//                  )
//              ),
//
//              SizedBox(
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Padding(
//                        padding: EdgeInsets.fromLTRB(0, 20, 0, 6),
//                        child: DefaultTextStyle(
//                          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 255, 255, 255)),
//                          overflow: TextOverflow.ellipsis,
//                          child: Text(userInfoObject.userName),
//
//                        ),
//                      ),
//                      Padding(
//                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
//                        child: DefaultTextStyle(
//                          style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 255, 255, 255)),
//                          overflow: TextOverflow.ellipsis,
//                          child: Text(userInfoObject.userEmail),
//
//                        ),
//                      )
//                    ],
//                  )
//
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//
//  }
//}
