class APIPath {
  static String userDetails(String uid) => 'users/$uid';
  static String usersList() => 'users';

  static String postDetails(String postID) => 'posts/$postID';
  static String readPosts() => 'posts/';

  static String postReaction(String postID, String uid) => 'posts/$postID/reactions/$uid';
}