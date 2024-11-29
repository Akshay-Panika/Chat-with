import 'package:chat_with/build_screen_folder/build_appbar.dart';
import 'package:chat_with/custom_widget/hw_widget.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
   const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("Chat With"),
        backgroundColor: Colors.transparent,
      elevation: 0.0,
      ),

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            expandedHeight: 100,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                SizedBox(
                      height: 100,
                      child: ListView.builder(
                        itemCount: 8,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return  Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(radius: 30,
                            backgroundColor: Colors.black12,
                            ),
                          );
                        },),
                    ),

                ],
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                height: 450,width: 300,
                margin: EdgeInsets.all(10),
                child: const Card(
                  elevation: 0.0,
                  color: Colors.black12,
                  child: Column(
                    children: [

                    ],
                  ),
                ),
              );
            },
            childCount: 5
            ),
          )
        ],
      ),
    );
  }
}
