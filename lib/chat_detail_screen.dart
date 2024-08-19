import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ChatDetailScreen extends StatefulWidget {
  final int index;
  final String name;
  const ChatDetailScreen(this.index, this.name, {super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  List<String> messages = [
    "who is here?",
    "Ich bin hier",
    "was can ich fUr sie tun?"
  ];

  final TextEditingController _controller = TextEditingController();
  String message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(CupertinoIcons.chevron_back),
          color: Colors.black,
        ),
        title: Row(
          children: [
            Container(
              height: kToolbarHeight - 10,
              width: kToolbarHeight - 10,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/${widget.index}.png'),
                  scale: 10,
                ),
                shape: BoxShape.circle,
                color: Colors.grey.shade200,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                // Text(widget.Name)
                const SizedBox(height: 2),
                const Text(
                  "Online",
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Icon(
            CupertinoIcons.video_camera,
            color: Colors.grey.shade600,
            size: 40,
          ),
          const SizedBox(width: 10),
          Icon(
            CupertinoIcons.phone,
            color: Colors.grey.shade600,
            size: 40,
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.red,
              child: ListView.builder(
                  itemCount: message.length,
                  itemBuilder: (context, int i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: i.isEven
                          ? Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.7),
                                    // width:

                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(message[i]),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "08:21",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Align(
                              alignment: Alignment.topRight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.7),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        message[i],
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "08:23",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, kTextTabBarHeight),
            child: Container(
              // height: kToolbarHeight * 2,
              color: Colors.blue,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 10.0),
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(CupertinoIcons.paperclip),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: TextField(
                      controller: _controller,
                      onChanged: (value) {
                        setState(() {
                          message = value;
                        });
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type message ...."),
                    )),
                    const SizedBox(
                      width: 20,
                    ),
                    message.isEmpty
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                messages.add(message);
                                _controller.clear();
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                  color: Colors.blue, shape: BoxShape.circle),
                              child: const Icon(
                                CupertinoIcons.mic,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                                color: Colors.blue, shape: BoxShape.circle),
                            child: const Icon(
                              CupertinoIcons.paperplane,
                              color: Colors.white,
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
