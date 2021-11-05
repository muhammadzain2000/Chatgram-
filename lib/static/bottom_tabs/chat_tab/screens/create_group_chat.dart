import 'package:flutter/material.dart';
import 'package:social_app/static/bottom_tabs/video_tab/models/friend_model.dart';
import 'package:social_app/static/widgets/buttons/custom_button.dart';
import 'package:social_app/static/widgets/textfields/custom_textfield.dart';

class CreateGroupChat extends StatefulWidget {
  @override
  _CreateGroupChatState createState() => _CreateGroupChatState();
}

class _CreateGroupChatState extends State<CreateGroupChat> {
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
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Create Group",
          style: theme.textTheme.headline2,
        ),
        backgroundColor: theme.primaryColorLight,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: theme.primaryColor,
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
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
                                        : Icons.chat,
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
            selectedFriend.length > 1
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        text: "Start Group Chat (${selectedFriend.length})",
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
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: theme.primaryColorLight,
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(25.0)),
                                  content: Container(
                                    height: height * 0.25,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        CustomTextField(
                                          hint: 'Set group name',
                                          obscureText: false,
                                        ),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        SizedBox(
                                          height: height * 0.01,
                                        ),
                                        CustomButton(
                                          text: "Create",
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
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
