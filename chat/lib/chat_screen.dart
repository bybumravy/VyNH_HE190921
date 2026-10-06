import 'package:flutter/material.dart';

// 1. Lớp dữ liệu giả lập cho Tin nhắn
class ChatMessage {
  final String text;
  final bool isMe;
  final String time;
  final bool hasLocationCard;

  ChatMessage({
    required this.text,
    required this.isMe,
    required this.time,
    this.hasLocationCard = false,
  });
}

// 2. Màn hình chính
class ChatScreen extends StatelessWidget {
  // Tạo danh sách tin nhắn mẫu giống trong hình
  final List<ChatMessage> messages = [
    ChatMessage(
      text: 'Chào bạn! Cuối tuần này bạn có thời gian không? Mình rủ bạn đi cà phê nhé ☕',
      isMe: false,
      time: '09:12',
    ),
    ChatMessage(
      text: 'Có chứ! Nghe hấp dẫn quá 😊 Bạn muốn đi đâu?',
      isMe: true,
      time: '09:14',
    ),
    ChatMessage(
      text: 'Mình thấy quán mới mở ở đường Lê Lợi cũng hay nè. Không gian đẹp, đồ uống cũng ổn lắm. Bạn xem qua nhé!',
      isMe: false,
      time: '09:16',
      hasLocationCard: true, // Kích hoạt hiển thị Card địa điểm
    ),
    ChatMessage(
      text: 'Đẹp quá! Mình cũng thấy quán này trên mạng rồi. Vậy chiều nay 3h nhé? 👍',
      isMe: true,
      time: '09:20',
    ),
    ChatMessage(
      text: 'Ok luôn! Mình hẹn ở quán nha. Để mình đặt chỗ trước rồi, bạn cứ đi nhé!',
      isMe: false,
      time: '09:21',
    ),
    ChatMessage(
      text: 'Cảm ơn bạn! Hẹn gặp nhé! 😊',
      isMe: true,
      time: '09:22',
    ),
  ];

  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // --- APPBAR ---
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () {},
        ),
        title: Row(
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=5'), // Ảnh mạng mẫu
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Lan Anh', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                Text('Đang hoạt động', style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.call_outlined, color: Colors.blue), onPressed: () {}),
          IconButton(icon: const Icon(Icons.videocam_outlined, color: Colors.blue), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert, color: Colors.grey), onPressed: () {}),
        ],
      ),

      // --- BODY ---
      body: Column(
        children: [
          // Expanded bọc ListView ép phần nhập liệu xuống đáy
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                // Gọi Custom Widget và truyền dữ liệu vào
                return MessageBubble(message: messages[index]);
              },
            ),
          ),
          
          // Khu vực nhập liệu ở dưới cùng
          _buildBottomInputArea(),
        ],
      ),
    );
  }

  // Khối nhập liệu tách riêng cho gọn code
  Widget _buildBottomInputArea() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: SafeArea(
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.add_circle_outline, color: Colors.blue, size: 28),
              onPressed: () {},
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Nhập tin nhắn...',
                    border: InputBorder.none,
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min, // Giữ cụm icon chiếm diện tích nhỏ nhất
                      children: [
                        Icon(Icons.emoji_emotions_outlined, color: Colors.grey.shade600),
                        const SizedBox(width: 12),
                        Icon(Icons.image_outlined, color: Colors.grey.shade600),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.mic_none, color: Colors.grey, size: 28),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// 3. Custom Component: BONG BÓNG TIN NHẮN (Tự động rẽ nhánh giao diện)
class MessageBubble extends StatelessWidget {
  final ChatMessage message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    // Dùng mainAxisAlignment để dạt khối tin nhắn sang trái hoặc phải
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ảnh đại diện chỉ hiện nếu người khác gửi
          if (!message.isMe) ...[
            const CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=5'),
            ),
            const SizedBox(width: 8),
          ],
          
          // Cột chứa nội dung tin nhắn và thời gian
          // Dùng crossAxisAlignment để căn lề chữ bên trong cột
          Flexible( // Tránh lỗi tràn màn hình khi chữ quá dài
            child: Column(
              crossAxisAlignment: message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                // Hộp màu chứa chữ
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: message.isMe ? Colors.blue : Colors.grey.shade100,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(16),
                      topRight: const Radius.circular(16),
                      // Nếu là mình gửi thì bo tròn góc trái dưới, và ngược lại
                      bottomLeft: Radius.circular(message.isMe ? 16 : 0),
                      bottomRight: Radius.circular(message.isMe ? 0 : 16),
                    ),
                  ),
                  child: Text(
                    message.text,
                    style: TextStyle(
                      color: message.isMe ? Colors.white : Colors.black87,
                      fontSize: 15,
                    ),
                  ),
                ),
                
                // Hộp Card địa điểm (Chỉ vẽ nếu có)
                if (message.hasLocationCard)
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    width: 250,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1554118811-1e0d58224f24', // Ảnh cafe mẫu
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              const Icon(Icons.location_on, color: Colors.grey),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('The Cozy Cafe', style: TextStyle(fontWeight: FontWeight.bold)),
                                    Text('123 Lê Lợi, Quận 1', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                // Cụm Thời gian
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(message.time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    if (message.isMe) ...[
                      const SizedBox(width: 4),
                      const Icon(Icons.done_all, size: 14, color: Colors.blue),
                    ]
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
