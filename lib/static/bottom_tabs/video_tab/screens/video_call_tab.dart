import 'package:flutter/material.dart';
import 'package:social_app/static/bottom_tabs/video_tab/models/friend_model.dart';
import 'package:social_app/static/bottom_tabs/video_tab/screens/call_screen.dart';
import 'package:social_app/static/widgets/buttons/custom_button.dart';

class VideoCallTab extends StatefulWidget {
  @override
  _VideoCallTabState createState() => _VideoCallTabState();
}

class _VideoCallTabState extends State<VideoCallTab> {
  List<FriendModel> selectedFriend = List();
  // @override
  // void initState() {
  //   super.initState();
  //   setState(() {
  //     selectedFriend = List();
  //   });
  // }
  final list = [
    FriendModel(
      image: 'images/profile_image.jpg',
      name: "farah",
      phone: '03333333333',
      isSelected: false,
    ),
    FriendModel(
      image: 'images/profile_image.jpg',
      name: "huzaifa",
      phone: '03333333333',
      isSelected: false,
    ),
    FriendModel(
      image: 'images/profile_image.jpg',
      name: "ebad",
      phone: '03333333333',
      isSelected: false,
    ),
    FriendModel(
      image: 'images/profile_image.jpg',
      name: "zain",
      phone: '03333333333',
      isSelected: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    //HEIGHT-WIDTH
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    //THEMES
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColorLight,
      body: Padding(
        padding: EdgeInsets.all(7),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int i) {
                    //LIST ITEM WISE
                    FriendModel friendModel = list[i];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          friendModel.isSelected = !friendModel.isSelected;
                          if (friendModel.isSelected == true) {
                            selectedFriend.add(FriendModel(
                                name: friendModel.name,
                                phone: friendModel.phone,
                                isSelected: true,
                                image: friendModel.image));
                          } else if (friendModel.isSelected == false) {
                            selectedFriend.removeWhere(
                                (element) => element.name == friendModel.name);
                          }
                        });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          width: width,
                          height: height * 0.12,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: theme.primaryColorLight,
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 13),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(200),
                                        image: DecorationImage(
                                            image:
                                                AssetImage(friendModel.image))),
                                  ),
                                  SizedBox(
                                    width: width * 0.04,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        friendModel.name,
                                        style: theme.textTheme.bodyText1,
                                      ),
                                      SizedBox(
                                        height: height * 0.005,
                                      ),
                                      Text(
                                        friendModel.phone,
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Icon(
                                    friendModel.isSelected
                                        ? Icons.check_circle
                                        : Icons.call,
                                    size: 25,
                                    color: friendModel.isSelected
                                        ? theme.primaryColor
                                        : theme.primaryColorDark,
                                  )
                                ],
                              ),
                            ),
                          )),
                    );
                  }),
            ),
            selectedFriend.length > 0
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        text: "Call (${selectedFriend.length})",
                        onPressed: () {
                          // ADD IMAGES
                          List<String> images = [];
                          selectedFriend.forEach((element) {
                            images.add(element.image);
                          });
                          // ADD NAMES
                          List<String> names = [];
                          selectedFriend.forEach((element) {
                            names.add(element.name);
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CallScreen(
                                        images: images,
                                        names: names,
                                      )));
                        },
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
