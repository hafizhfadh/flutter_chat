class Message {
  Message({
    required this.id,
    required this.profileId,
    required this.content,
    required this.createdAt,
    required this.isMine,
    required this.senderId,
    required this.chatRoomId,
  });

  /// ID of the message
  final String id;

  /// ID of the user who posted the message
  final String profileId;

  String senderId;

  String chatRoomId;

  /// Text content of the message
  final String content;

  /// Date and time when the message was created
  final DateTime createdAt;

  /// Whether the message is sent by the user or not.
  final bool isMine;

  Message.fromMap({
    required Map<String, dynamic> map,
    required String myUserId,
  })  : id = map['id'],
        profileId = map['profile_id'],
        senderId = map['sender_id'],
        chatRoomId = map['chat_room_id'],
        content = map['content'],
        createdAt = DateTime.parse(map['created_at']),
        isMine = myUserId == map['sender_id'];
}
