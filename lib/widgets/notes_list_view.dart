import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/note_cubit/note_cubit.dart';
import 'package:todo_app/models/note_model.dart';
import 'package:todo_app/widgets/notes_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(builder: (context, state) {
      List<NoteModel> notes = BlocProvider.of<NoteCubit>(context).notes ?? [];
      return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: NoteItem(
                noteModel: notes[index],
              ),
            );
          });
    });
  }
}
