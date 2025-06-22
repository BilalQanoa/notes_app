import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:todo_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:todo_app/cubits/note_cubit/note_cubit.dart';
import 'package:todo_app/widgets/add_form_buttom_sheet.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding: EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom == 0
              ? 16
              : MediaQuery.of(context).viewInsets.bottom + 8,
        ),
        child: SingleChildScrollView(
          child: BlocConsumer<AddNoteCubit, AddNoteState>(
              listener: (context, state) {
            if (state is AddNoteFailuer) {
              print('error ${state.errorMessage}');
            } else if (state is AddNoteSuccess) {
              BlocProvider.of<NoteCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            }
          }, builder: (context, state) {
            return AbsorbPointer(
                absorbing: state is AddNoteLoading ? true : false,
                child: const AddFormButtomSheet());
          }),
        ),
      ),
    );
  }
}
