import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/note_cubit/note_cubit.dart';
import 'package:todo_app/models/note_model.dart';
import 'package:todo_app/widgets/custom_app_bar.dart';
import 'package:todo_app/widgets/custom_text_field.dart';
import 'package:todo_app/widgets/edit_color_list_view.dart';

class EditNoteViewBody extends StatelessWidget {
  EditNoteViewBody({required this.note, Key? key}) : super(key: key);

  String? title, subtitle;
  NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CustomAppBar(
            onPressed: () {
              note.title = title ?? note.title;
              note.subTitle = subtitle ?? note.subTitle;
              note.save();
              BlocProvider.of<NoteCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            title: 'Edit Note',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            onChanged: (newTitle) {
              title = newTitle;
            },
            hint: note.title,
          ),
          const SizedBox(
            height: 24,
          ),
          CustomTextField(
            onChanged: (newSubTitle) {
              subtitle = newSubTitle;
            },
            hint: note.subTitle,
            maxLines: 5,
          ),
          const SizedBox(
            height: 32,
          ),
          EditColorListView(
            note: note,
          ),
        ],
      ),
    );
  }
}
