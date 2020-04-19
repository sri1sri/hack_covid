class APIPath {
  static String userDetails(String uid) => 'users/$uid';
  static String usersList() => 'users';

  static String policies(String id) => 'policies/$id';
  static String responses(String id) => 'responses/$id';
  static String responsesList() => 'responses';
}