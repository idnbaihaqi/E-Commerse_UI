import 'package:flutter/material.dart';

class ChatDetailPage extends StatefulWidget {
  final String shopName;
  final String shopImage;
  
  ChatDetailPage({required this.shopName, required this.shopImage});

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final TextEditingController _messageController = TextEditingController();
  
  List<Map<String, dynamic>> messages = [
    {
      'text': 'Halo, is this product ready?',
      'isMe': true,
      'time': '10:25',
    },
    {
      'text': 'Hai, the product is ready, please order! :)',
      'isMe': false,
      'time': '10:30',
    },
    {
      'text': 'Oke, I will order now.',
      'isMe': true,
      'time': '10:31',
    },
    {
      'text': 'Thank you for ordering! We will process it right away.',
      'isMe': false,
      'time': '10:32',
    },
  ];

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        final now = DateTime.now();
        final time = '${now.hour}:${now.minute.toString().padLeft(2, '0')}';
        
        messages.add({
          'text': _messageController.text,
          'isMe': true,
          'time': time,
        });
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.shopImage),
              radius: 20, // Sesuai dengan list chat page
              backgroundColor: Colors.grey[300],
            ),
            const SizedBox(width: 12),
            Text(
              widget.shopName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 255, 160, 20), // Warna hijau tema
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.call, size: 22),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.videocam, size: 24),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // Area pesan
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.grey[50]!, Colors.grey[100]!],
                ),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return _buildMessageBubble(message);
                },
              ),
            ),
          ),
          
          // Input pesan dan tombol kirim
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                // Tombol Emoji
                IconButton(
                  icon: Icon(Icons.emoji_emotions_outlined, 
                    color: Colors.grey[600], size: 24),
                  onPressed: () {},
                ),
                
                // Input Text
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _messageController,
                            decoration: InputDecoration(
                              hintText: 'Type a message...',
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.attach_file, 
                            color: Colors.grey[600], size: 22),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Tombol Kirim
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 160, 20), // Warna hijau tema
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white, size: 22),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Map<String, dynamic> message) {
    return Align(
      alignment: message['isMe'] ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: message['isMe'] ? const Color.fromARGB(255, 255, 160, 20) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message['text'],
              style: TextStyle(
                color: message['isMe'] ? Colors.white : Colors.black,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              message['time'],
              style: TextStyle(
                fontSize: 10,
                color: message['isMe'] ? Colors.white70 : Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}