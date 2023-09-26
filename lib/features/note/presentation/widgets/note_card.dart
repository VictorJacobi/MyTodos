import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
import 'package:my_todos/features/note/presentation/widgets/ProfilePicImageViewer.dart';


class NoteCard extends StatelessWidget {
  const NoteCard({
    Key? key,
    // required this.bookingModel,
  }) : super(key: key);

  // final List<BookingModel> lists;
  // final BookingModel? bookingModel;
  // final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      height: 168,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xffffffff),
        boxShadow: const [
          BoxShadow(
            offset: Offset(5, 10),
            spreadRadius: -5,
            blurRadius: 8,
            color: Color(0xffD0D5DD),
          ),
          BoxShadow(
            offset: Offset(-5, 10),
            spreadRadius: -5,
            blurRadius: 8,
            color: Color(0xffD0D5DD),
          ),
          BoxShadow(
            offset: Offset(-5, -2),
            spreadRadius: -5,
            blurRadius: 8,
            color: Color(0xffD0D5DD),
          ),
          BoxShadow(
            offset: Offset(5, -2),
            spreadRadius: -5,
            blurRadius: 8,
            color: Color(0xffD0D5DD),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              ProfilePicImageViewer(
                width: 55,
                height: 60,
                imageType: ImageType.network,
                image: 'bookingModel?.imageUrl',
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'vhvgkgkvkl',
                style:GoogleFonts.blinker(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  // fontFamily: 'Microgamma',
                  color: Color(0xff1D2939),
                )
              ),
              Expanded(child: Container()),
              // Visibility(
              //   visible: bookingModel?.status == Bookings.completed,
              //   child: Row(
              //     children: [
              //       const Icon(
              //         Icons.star,
              //         color: GlobalVariables.orangeColor,
              //         size: 25,
              //       ),
              //       Text(
              //         '${bookingModel?.rating??4.5}',
              //         style: GlobalVariables.buttontextStyle.copyWith(
              //           fontWeight: FontWeight.w600,
              //           fontSize: 16,
              //           color: GlobalVariables.orangeColor,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
          const Divider(
            color: Color(0xffD0D5DD),
            thickness: 1,
          ),
          Row(
            children: [
              const Icon(
                Icons.check_box,
                size: 20,
                color: Color(0xff7E00C4),
              ),
              const SizedBox(width: 10),
              Text(
                'gsggshash',
                style: GoogleFonts.blinker(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  // fontFamily: 'Microgamma',
                  color: Color(0xff1D2939),
                ),
              ),
              Expanded(child: Container()),
              // Visibility(
              //   visible: bookingModel?.status == Bookings.active,
              //   child: Row(
              //     children: [
              //       InkWell(
              //         onTap: () async {
              //           // await launchPhoneCall(
              //           //     phoneNumber: '${bookingModel?.phone??08022446574}');
              //           // Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatScreen()));
              //         },
              //         child: const Material(
              //           child: CircleAvatar(
              //             radius: 15,
              //             backgroundColor: GlobalVariables.mintcolor,
              //             child: Icon(
              //               FlutterRemix.phone_fill,
              //               size: 14,
              //               color: GlobalVariables.whiteColor,
              //             ),
              //           ),
              //         ),
              //       ),
              //       const SizedBox(width: 10),
              //       InkWell(
              //         onTap: () {
              //           locator<GoRouter>().go('/${ChatPage.id}/${bookingModel?.id}?isActive=${bookingModel?.status==Bookings.active}');
              //           // Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatPage(
              //           //   // imageUrl: bookingModel?.imageUrl,
              //           //   // firstName: bookingModel?.firstName,
              //           //   // lastName: bookingModel?.lastName,
              //           //   bookingId: bookingModel?.id,
              //           //   isActive: bookingModel?.status==Bookings.active,
              //           // )));
              //           // Navigator.of(context).pushNamed(ChatScreen.routeName);
              //         },
              //         child: const Material(
              //           child: CircleAvatar(
              //             radius: 15,
              //             backgroundColor: GlobalVariables.blueColor,
              //             child: Icon(
              //               FlutterRemix.chat_3_fill,
              //               size: 14,
              //               color: GlobalVariables.whiteColor,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(
                Icons.calendar_month,
                color: Color(0xff7E00C4),
                size: 20,
              ),
              const SizedBox(width: 10),
              Text(
                'cghdhjjj',
                // 'DateTime.format(lists[index].date)',
                style:  GoogleFonts.blinker(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  // fontFamily: 'Microgamma',
                  color: Color(0xff1D2939),
                ),
              ),
              Expanded(child: Container()),
              Text(
               ' bookingModel?.status?.convert()??''',
                style: GoogleFonts.blinker(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  // fontFamily: 'Microgamma',
                  color: Color(0xff1D2939),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
