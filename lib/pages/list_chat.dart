import 'package:flutter/material.dart';
import 'chat_detail.dart';

class ChatListPage extends StatefulWidget {
  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  // Data dummy untuk daftar chat
  final List<Map<String, dynamic>> chatList = [
    {
      'name': 'Emezon Store',
      'message': 'Is this product ready?',
      'time': '10:30',
      'isRead': false,
      'image': 'images/trolley.png',
    },
    {
      'name': 'Electronic Store',
      'message': 'The product is ready, please order!',
      'time': '09:15',
      'isRead': true,
      'image': 'images/cooking.png',
    },
    {
      'name': 'Fashion Store',
      'message': 'Oke, I will order now.',
      'time': 'Yesterday',
      'isRead': true,
      'image': 'images/brand.png',
    },
    {
      'name': 'Book Store',
      'message': 'Thank you for ordering! We will process it right away.',
      'time': '11:45',
      'isRead': false,
      'image': 'images/book.png',
    },
  ];

  bool showUnreadOnly = false;

  // Get filtered chat list based on filter
  List<Map<String, dynamic>> get filteredChatList {
    if (showUnreadOnly) {
      return chatList.where((chat) => !chat['isRead']).toList();
    }
    return chatList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chats',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 160, 20), // Warna hijau tema
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 24),
            onPressed: () {
              // Fungsi pencarian
            },
          ),
        ],
      ),
      body: Container(
        color: const Color.fromARGB(
          255,
          255,
          255,
          255,
        ), // membuat warna background halaman chat menjadi merah
        child: Column(
          children: [
            // Tombol Filter: Semua & Belum Dibaca
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  // Filter All
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showUnreadOnly = false;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: !showUnreadOnly
                            ? const Color.fromARGB(255, 255, 160, 20)
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        'All',
                        style: TextStyle(
                          color: !showUnreadOnly
                              ? Colors.white
                              : Colors.grey[600],
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Filter Unread
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showUnreadOnly = true;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: showUnreadOnly
                            ? const Color.fromARGB(255, 255, 160, 20)
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        'Unread',
                        style: TextStyle(
                          color: showUnreadOnly
                              ? Colors.white
                              : Colors.grey[600],
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // List Chat
            Expanded(
              child: ListView.builder(
                itemCount: filteredChatList.length,
                itemBuilder: (context, index) {
                  final chat = filteredChatList[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage(chat['image']),
                        backgroundColor: Colors.grey[300],
                      ),
                      title: Text(
                        chat['name'],
                        style: TextStyle(
                          fontWeight: !chat['isRead']
                              ? FontWeight.bold
                              : FontWeight.w600,
                          color: !chat['isRead']
                              ? Colors.black
                              : Colors.grey[800],
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          chat['message'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: !chat['isRead']
                                ? FontWeight.w500
                                : FontWeight.normal,
                            color: !chat['isRead']
                                ? Colors.grey[800]
                                : Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            chat['time'],
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: !chat['isRead']
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 6),
                          if (!chat['isRead'])
                            Container(
                              width: 18,
                              height: 18,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 160, 20),
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Text(
                                  '!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatDetailPage(
                              shopName: chat['name'],
                              shopImage: chat['image'],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}