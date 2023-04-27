import 'package:flutter/material.dart';
import 'package:zoom_clone_flutter/widgets/custom_text.dart';
import 'package:zoom_clone_flutter/widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  const MeetingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onPressed: () {},
              icon: Icons.videocam,
              text: "New Meeting",
            ),
            HomeMeetingButton(
              onPressed: () {},
              icon: Icons.add_box_rounded,
              text: "Join Meeting",
            ),
            HomeMeetingButton(
              onPressed: () {},
              icon: Icons.calendar_today,
              text: "Schedule Meeting",
            ),
            HomeMeetingButton(
              onPressed: () {},
              icon: Icons.arrow_upward_rounded,
              text: "Share Screen",
            ),
          ],
        ),
        const Expanded(
            child: Center(
          child: CustomText(
            text: "Create or Join Meeting with just a single click!",
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ))
      ],
    );
  }
}
