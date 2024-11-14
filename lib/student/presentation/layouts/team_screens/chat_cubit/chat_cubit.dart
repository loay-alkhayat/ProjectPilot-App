import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectpilot/core/models/models/message_model.dart';
import 'package:projectpilot/student/presentation/layouts/team_screens/chat_cubit/chat_states.dart';

import '../../../../../core/services/dio_services.dart';
import '../../../../domain/entities/student_entities/get_student_profile_by_token_entity.dart';

class MessagesCubit extends Cubit<MessagesState> {
  List<MessageModel> messages = [];
  bool getMessagesSuccess = false;

  MessagesCubit() : super(MessagesInitialState());
  static MessagesCubit get(context) => BlocProvider.of(context);

  GetStudentInfoEntity? getStudentInfoEntity;

  void sendMessage({required String text}) async {
    emit(SendMessageLoadingState());
    MessageModel model = MessageModel(
      DateTime.now().toString(),
      getStudentInfoEntity!.data.teamID.toString(),
      getStudentInfoEntity!.data.studentID.toString(),
      getStudentInfoEntity!.data.name,
      text,
    );
    await FirebaseFirestore.instance
        .collection('teams')
        .doc(getStudentInfoEntity!.data.teamID.toString())
        .collection('messages')
        .add(model.toMap());
    emit(SendMessageSuccessState());
  }

  ScrollController controllerScroll = ScrollController();

  void getMessages() {
    FirebaseFirestore.instance
        .collection('teams')
        .doc(getStudentInfoEntity?.data.teamID.toString())
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      getMessagesSuccess = true;
      messages = [];
      for (var element in event.docs) {
        messages.add(MessageModel.fromJson(element.data()));
      }
      emit(GetMessagesSuccessState());
    });
  }

  void updateTypingStatus(bool isTyping) {
    FirebaseFirestore.instance
        .collection('teams')
        .doc(getStudentInfoEntity!.data.teamID.toString())
        .collection('typingStatus')
        .doc(getStudentInfoEntity!.data.studentID.toString())
        .set({'isTyping': isTyping});
    emit(UpdateTypingStatusState());
  }

  bool otherUserIsTyping = false;

  void listenToTypingStatus() {
    FirebaseFirestore.instance
        .collection('teams')
        .doc(getStudentInfoEntity!.data.teamID.toString())
        .collection('typingStatus')
        .snapshots()
        .listen((snapshot) {
      otherUserIsTyping = false;
      for (var doc in snapshot.docs) {
        if (doc.id != getStudentInfoEntity!.data.studentID.toString() &&
            doc['isTyping']) {
          otherUserIsTyping = true;
          break;
        }
      }
      logger.w(otherUserIsTyping);
      emit(TypingStatusChangedState());
    });
  }
}
