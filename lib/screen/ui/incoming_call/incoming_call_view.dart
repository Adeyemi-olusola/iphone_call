import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iphone_call_ui/screen/ui/incoming_call/incoming_call_viewmodel.dart';
import 'package:iphone_call_ui/screen/ui/incoming_call/incoming_call_widget/pciked_call_bottom_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

class IncomingCallView extends StatefulWidget {
  const IncomingCallView({super.key});

  @override
  State<IncomingCallView> createState() => _IncomingCallViewState();
}

class _IncomingCallViewState extends State<IncomingCallView> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => IncomingCallModelView(),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Colors.grey[800],
            body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xff5f6165), Color(0xff363a40)])),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 100, horizontal: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Adeyemi Olusola',
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          viewModel.onEndDrag ? '00:00' : 'Calling.....',
                          style: GoogleFonts.roboto(
                              color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                    Container(
                      child: viewModel.onEndDrag
                          ? PickedCallBottomWidget()
                          : Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        const Icon(
                                          Icons.alarm,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          'Remind Me',
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white,
                                              fontSize: 11),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        const Icon(
                                          Icons.chat_rounded,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          'Message',
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white,
                                              fontSize: 11),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 60,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                        height: 75,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(75)),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 70),
                                              child: Shimmer.fromColors(
                                                period: const Duration(
                                                    milliseconds:
                                                        700), // Duration of the animation
                                                highlightColor: const Color.fromARGB(
                                                    255,
                                                    246,
                                                    246,
                                                    246), // Color of the shimmer highlight
                                                baseColor: Color.fromARGB(255, 77, 77, 77),
                                                child: const Text(
                                                  'Slide to answer',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                    Container(
                                      height: 75,
                                      decoration: BoxDecoration(
                                          // color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(75)),
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Draggable(
                                              onDragStarted: () {
                                                viewModel
                                                    .onStartDragfunction(true);
                                              },
                                              onDragUpdate: (onDragUpdate) {
                                                print(onDragUpdate);
                                              },
                                              onDragEnd: (details) {
                                                viewModel
                                                    .onEndDragfunction(true);
                                              },
                                              axis: Axis.horizontal,
                                              feedback: const CircleAvatar(
                                                radius: 34,
                                                backgroundColor: Colors.white,
                                                child: Icon(
                                                  Icons.call,
                                                  color: Colors.green,
                                                  size: 32,
                                                ),
                                              ),
                                              child: viewModel.onStartDrag
                                                  ? Container()
                                                  : const CircleAvatar(
                                                      radius: 34,
                                                      backgroundColor:
                                                          Colors.white,
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
                            ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
