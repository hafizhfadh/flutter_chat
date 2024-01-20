class ChatRoom {
  final String id;
  final String profileId;
  final String roomName;
  final String encryptionKey;

  ChatRoom({
    required this.id,
    required this.profileId,
    required this.roomName,
    required this.encryptionKey,
  });

  ChatRoom.fromMap({
    required Map<String, dynamic> map,
  })  : id = map['id'],
        profileId = map["profile_id"],
        roomName = map["room_name"],
        encryptionKey = map["encryption_key"];
}
