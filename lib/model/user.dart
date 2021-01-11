class User {
  final String name;
  final String imageUrl;
  final bool isOnline;

  User({
    this.name,
    this.imageUrl,
    this.isOnline,
  });
}

class Story {
  final User user;
  final String imageUrl;
  final bool isViewed;
  final bool isLive;
  Story({
    this.user,
    this.imageUrl,
    this.isViewed,
    this.isLive,
  });
}

class Post {
  final User user;
  final String caption;
  final String timeAgo;
  final int likes;
  final int comments;
  final int shares;
  final String imageUrl;

  Post({
    this.user,
    this.caption,
    this.timeAgo,
    this.likes,
    this.comments,
    this.shares,
    this.imageUrl,
  });
}

User currentUser = User(
  name: 'Lawal Opeyemi',
  imageUrl: null,
);
