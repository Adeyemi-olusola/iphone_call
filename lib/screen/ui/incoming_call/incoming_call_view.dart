import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class IncomingCallView extends StatefulWidget {
  const IncomingCallView({super.key});

  @override
  State<IncomingCallView> createState() => _IncomingCallViewState();
}

class _IncomingCallViewState extends State<IncomingCallView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Adeyemi Olusola',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Calling.....',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.alarm,
                          color: Colors.white,
                        ),
                        Text(
                          'Remind Me',
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.chat_rounded,
                          color: Colors.white,
                        ),
                        Text(
                          'Message',
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Stack(
                  children: [
                    Container(
                        height: 75,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(75)),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 70),
                              child: Shimmer.fromColors(
                                period: const Duration(
                                    milliseconds:
                                        40), // Duration of the animation
                                highlightColor: Color.fromARGB(255, 246, 246,
                                    246), // Color of the shimmer highlight
                                baseColor: Color.fromARGB(255, 181, 181, 181),
                                child: Text(
                                  'Slide to answer',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Container(
                      height: 75,
                      decoration: BoxDecoration(
                          // color: Colors.grey,
                          borderRadius: BorderRadius.circular(75)),
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Draggable(
                              onDragStarted: () {},
                              axis: Axis.horizontal,
                              child: CircleAvatar(
                                radius: 34,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.call,
                                  color: Colors.green,
                                  size: 32,
                                ),
                              ),
                              feedback: CircleAvatar(
                                radius: 34,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.call,
                                  color: Colors.green,
                                  size: 32,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
