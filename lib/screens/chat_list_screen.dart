import 'package:flutter/material.dart';
import 'package:flutter_chat/models/chat_room.dart';
import 'package:flutter_chat/screens/chat_screen.dart';
import 'package:flutter_chat/utils/constants.dart';
import 'package:go_router/go_router.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  var chatRooms;

  Future<List<Map<String, dynamic>>> _getChatRoom() async {
    chatRooms = supabase.from('chat_rooms').select().order('created_at');
    return chatRooms;
  }

  @override
  void initState() {
    super.initState();
    _getChatRoom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            supabase.auth.signOut();
            context.pushReplacement('/login');
          }, icon: const Icon(Icons.logout)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/start_chat');
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
          future: _getChatRoom(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                ChatRoom chatRoom =
                ChatRoom.fromMap(map: snapshot.data![index]);
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(chatRoom.roomName.substring(0, 1)),
                  ),
                  title: Text(chatRoom.roomName),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(
                          chatRoomId: chatRoom.id,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }),
    );
  }
}
