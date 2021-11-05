import 'package:flutter/material.dart';
import 'package:social_app/static/bottom_tabs/video_tab/models/friend_model.dart';

class FriendCard extends StatelessWidget {
  FriendModel friendModel;
  FriendCard(this.friendModel);
  @override
  Widget build(BuildContext context) {
    //THEMES
    var theme = Theme.of(context);
    //height - width
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        width: width,
        height: height * 0.12,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: theme.primaryColorLight,
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.12,
                  height: height * 0.12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      image: DecorationImage(
                          image: AssetImage(friendModel.image))),
                ),
                SizedBox(
                  width: width * 0.04,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                IconButton(
                    icon: Icon(
                      Icons.call,
                      size: 25,
                      color: theme.primaryColorDark,
                    ),
                    onPressed: () {})
              ],
            ),
          ),
        ));
  }
}
