import 'package:chat_with/widget_folder/hw_widget.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
   const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          height: 450,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.black12,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(child: Text(index.toString())),
                            10.width,
                            const Text("Find Your Love"),
                          ],
                        ),
                        2.height,
                        const Text("This is comments area!"),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(onPressed: (){}, icon: const Icon(Icons.favorite,color: Colors.black54, size: 30,)),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.chat,color: Colors.black54, size: 30,)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
