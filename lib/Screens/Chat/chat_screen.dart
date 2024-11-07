import 'package:flutter/material.dart';
import 'package:technical_round/Common/svg_imge.dart';
import 'package:technical_round/Constants/colors.dart';
import 'package:technical_round/Constants/date_format.dart';
import 'package:technical_round/Constants/sizes.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> _messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Rishabh Kumar'),
      ),
      body: ListView.builder(
        reverse: true,
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: AppColors.lightMain,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          _messages[index],
                        ),
                        Text(
                          chatTime.format(DateTime.now()),
                          style: const TextStyle(color: AppColors.labelColor),
                        ),
                      ],
                    ),
                  ),
                ),
                w10,
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaHVxtFr0EsmismCmwOrN_4fkCC0VoIUJ6ho3dxn3BEHyfM-HnK0EsDM0b202lY76fvnU&usqp=CAU'),
                )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: TextFormField(
                maxLines: 6,
                minLines: 1,
                controller: _controller,
                onChanged: (value) {
                  setState(() {
                    _controller.text = value;
                  });
                },
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 12),
                    hintText: 'Type Something',
                    border: InputBorder.none),
              ),
            ),
            IconButton(
              onPressed: _sendMessage,
              icon: _controller.text.isEmpty
                  ? svgAsset('assets/icons/gallery.svg')
                  : const Icon(Icons.send_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
