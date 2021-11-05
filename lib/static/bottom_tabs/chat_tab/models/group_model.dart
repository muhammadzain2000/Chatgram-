import 'package:social_app/static/bottom_tabs/chat_tab/models/user_model.dart';

class Group {
  final String name;
  final String time;
  final String text;
  final bool unread;
  final User createdBy;

  Group({this.name, this.time, this.text, this.unread, this.createdBy});
}

// EXAMPLE CHATS ON HOME SCREEN
List<Group> groups = [
  Group(
      name: "JOB VACANCIES",
      time: '5:30 PM',
      text: 'Hello! This is me talking from behind the truck.',
      unread: true,
      createdBy: user1),
  Group(
      name: "Friends party",
      time: '4:30 PM',
      text: 'Do you know how what is the population of Pakistan right now?',
      unread: true,
      createdBy: user1),
  Group(
      name: 'Islamic group',
      time: '3:30 PM',
      text: 'Okay so this outlet is the best to but clothes!',
      unread: false,
      createdBy: user1),
  Group(
      name: 'NedShareefs',
      time: '2:30 PM',
      text: 'The idea of developing this kind of app is just great',
      unread: true,
      createdBy: user1),
];

class GroupMessage {
  final User sender;
  final String time;
  final String text;
  final bool unread;

  GroupMessage({
    this.sender,
    this.time,
    this.text,
    this.unread,
  });
}

List<GroupMessage> messages = [
  GroupMessage(
    sender: user2,
    time: '5:30 PM',
    text: 'Hello! How are you?',
    unread: true,
  ),
  GroupMessage(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Hey! I\'m good',
    unread: true,
  ),
  GroupMessage(
    sender: user1,
    time: '3:45 PM',
    text: 'My future plan is to graduate from an IVY League.',
    unread: true,
  ),
  GroupMessage(
    sender: user3,
    time: '3:15 PM',
    text: 'I\'m always proud of myself',
    unread: true,
  ),
  GroupMessage(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Although it was a really good experience studying there!',
    unread: true,
  ),
  GroupMessage(
    sender: currentUser,
    time: '2:30 PM',
    text: 'And I am from NED University of Engineering and Technology',
    unread: true,
  ),
  GroupMessage(
    sender: user2,
    time: '2:00 PM',
    text: 'I hope my family is doing well.',
    unread: true,
  ),
];
