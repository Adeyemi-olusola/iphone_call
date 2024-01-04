import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PickedCallBottomWidget extends StatelessWidget {
  PickedCallBottomWidget({super.key});

  List<BottomItemClass> itemList = [
    BottomItemClass(text: 'Speaker', icon: Icons.volume_up_rounded),
    BottomItemClass(text: 'FaceTime', icon: Icons.video_call_sharp),
    BottomItemClass(text: 'Mute', icon: Icons.mic),
    BottomItemClass(text: 'Add', icon: Icons.person_add_alt_1_outlined),
    BottomItemClass(text: 'End', icon: Icons.call_end_rounded),
    BottomItemClass(text: 'Keypad', icon: Icons.keyboard_sharp),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: itemList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.7,

            crossAxisCount: 3, // Number of columns
            crossAxisSpacing: 40.0, // Spacing between columns
            mainAxisSpacing: 10.0, // Spacing between rows
          ),
          itemBuilder: (context, int) {
            return Column(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: itemList[int].text == 'End'
                          ? Colors.red
                          : const Color(0xff62656a)),
                  child: Icon(
                    itemList[int].icon,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  itemList[int].text,
                  style:
                      GoogleFonts.montserrat(color: Colors.white, fontSize: 11),
                )
              ],
            );
          }),
    );
  }
}

class BottomItemClass {
  BottomItemClass({required this.text, required this.icon});
  String text;
  IconData icon;
}
