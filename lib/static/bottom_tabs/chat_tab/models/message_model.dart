import 'package:social_app/static/bottom_tabs/chat_tab/models/user_model.dart';

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.unread,
  });
}

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: user1,
    time: '5:30 PM',
    text: 'Hello! This is me talking from behind the truck.',
    unread: true,
  ),
  Message(
    sender: user2,
    time: '4:30 PM',
    text: 'Do you know how what is the population of Pakistan right now?',
    unread: true,
  ),
  Message(
    sender: user3,
    time: '3:30 PM',
    text: 'Okay so this outlet is the best to but clothes!',
    unread: false,
  ),
  Message(
    sender: user4,
    time: '2:30 PM',
    text: 'The idea of developing this kind of app is just great',
    unread: true,
  ),
  Message(
    sender: user5,
    time: '1:30 PM',
    text: 'What is your current CGPA?',
    unread: false,
  ),
  Message(
    sender: user6,
    time: '12:30 PM',
    text: 'I like cricket! Which sport do you like?',
    unread: false,
  ),
  Message(
    sender: user7,
    time: '11:30 AM',
    text: 'I will need more time to finish this assignment!',
    unread: false,
  ),
  Message(
    sender: user8,
    time: '12:45 AM',
    text: 'The main purpose of this meeting is to understand how to create',
    unread: false,
  ),
];

List<Message> messages = [
  Message(
    sender: user3,
    time: '5:30 PM',
    text: 'Hello! How are you?',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Hey! I\'m good',
    unread: true,
  ),
  Message(
    sender: user3,
    time: '3:45 PM',
    text: 'My future plan is to graduate from an IVY League.',
    unread: true,
  ),
  Message(
    sender: user3,
    time: '3:15 PM',
    text: 'I\'m always proud of myself',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Although it was a really good experience studying there!',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'And I am from NED University of Engineering and Technology',
    unread: true,
  ),
  Message(
    sender: user3,
    time: '2:00 PM',
    text: 'I hope my family is doing well.',
    unread: true,
  ),
];
