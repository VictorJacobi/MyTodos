import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todos/app/components/custom_textfield.dart';
import 'package:my_todos/features/note/presentation/widgets/note_card.dart';

class NoteScreen extends ConsumerWidget {
  static String id = 'NoteScreen';
  const NoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              IconButton(onPressed: (){

              }, icon: Icon(
                  Icons.edit,
              )),
            ],
          ),
          Expanded(
            flex: 7,
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 10,
              itemBuilder: (context,index)=> NoteCard(),
            ),
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomTextInputField(errorText: ''),
          )),
        ],
      ),
    );
  }
}
