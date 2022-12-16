import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/presentation/Home/widgets/listtilecard_widget.dart';
import 'package:food_deliever_app/presentation/widget/cutom_back_icon.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              khight20,
              Text(
                "Chat",
                style: TextStyle(
                  fontFamily: fontBold,
                  fontSize: 27,
                ),
              ),
              khight20,
              Expanded(
                child: ListView(
                  children: const [
                    Chattile(
                        name: "Dianne Russell",
                        status: "Online",
                        imageUrl: "Asset/chat/Photo Profile.png"),
                    Chattile(
                        name: "Leslie Alexander",
                        status: "Online",
                        imageUrl: "Asset/chat/Photo Profile-3.png"),
                    Chattile(
                        name: "GUy Hawkins",
                        status: "Online",
                        imageUrl: "Asset/chat/Photo Profile-2.png"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Chattile extends StatelessWidget {
  const Chattile({
    Key? key,
    required this.name,
    required this.status,
    required this.imageUrl,
  }) : super(key: key);
  final String name;
  final String status;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: mwidth / 3 - 20,
      decoration: BoxDecoration(
          color: Colors.grey.shade800, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(imageUrl),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontFamily: fontBold, fontSize: 17),
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: kthemeGreen,
                    radius: 5,
                  ),
                  kwidth5,
                  Text(
                    status,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              )
            ],
          ),
          const Spacer(),
          CircleAvatar(
            radius: 20,
            backgroundColor: kthemeGreen.shade700.withOpacity(0.5),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.call,
                  color: kthemeGreen,
                )),
          ),
          kwidth20
        ],
      ),
    );
  }
}
