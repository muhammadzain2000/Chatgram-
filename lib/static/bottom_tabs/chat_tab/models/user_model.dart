class User {
  final int id;
  final String name;
  final String imageUrl;
  final bool isOnline;

  User({
    this.id,
    this.name,
    this.imageUrl,
    this.isOnline,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Ebad Ullah',
  imageUrl: 'images/profile_image.jpg',
  isOnline: true,
);

// USERS
final User user1 = User(
  id: 1,
  name: 'Muhammad Huzaifa',
  imageUrl: 'images/profile_image.jpg',
  isOnline: true,
);
final User user2 = User(
  id: 2,
  name: 'Muhammad Zain',
  imageUrl: 'images/profile_image.jpg',
  isOnline: true,
);
final User user3 = User(
  id: 3,
  name: 'Farah',
  imageUrl: 'images/profile_image.jpg',
  isOnline: false,
);
final User user4 = User(
  id: 4,
  name: 'Numaira Zaib',
  imageUrl: 'images/profile_image.jpg',
  isOnline: false,
);
final User user5 = User(
  id: 5,
  name: 'Sarim Ali Zuberi',
  imageUrl: 'images/profile_image.jpg',
  isOnline: true,
);
final User user6 = User(
  id: 6,
  name: 'Suhaib',
  imageUrl: 'images/profile_image.jpg',
  isOnline: false,
);
final User user7 = User(
  id: 7,
  name: 'Asad Saleem',
  imageUrl: 'images/profile_image.jpg',
  isOnline: false,
);
final User user8 = User(
  id: 8,
  name: 'Sheeraz',
  imageUrl: 'images/profile_image.jpg',
  isOnline: false,
);
