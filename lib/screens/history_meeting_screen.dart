import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zoom_clone_flutter/resources/firestore_methods.dart';
import 'package:zoom_clone_flutter/widgets/custom_text.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: FirestoreMethods().meetingsHistory,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: (snapshot.data! as dynamic).docs.length,
            itemBuilder: (context, index) => ListTile(
              title: CustomText(
                text:
                    "Room Name: ${(snapshot.data! as dynamic).docs[index]["meetingName"]}",
              ),
              subtitle: CustomText(
                text:
                    "Joined At: ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]["createdAt"].toDate())}",
              ),
            ),
          );
        });
  }
}
