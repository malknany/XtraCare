// ignore_for_file: file_names

class ChatMessage {
  final String text;
  final DateTime date;
  final bool isSentByMe;
  ChatMessage(
      {required this.text, required this.date, required this.isSentByMe});
}
