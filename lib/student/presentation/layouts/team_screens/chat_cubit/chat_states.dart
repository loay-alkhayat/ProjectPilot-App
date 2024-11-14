abstract class MessagesState {}

class MessagesInitialState extends MessagesState {}

class SendMessageLoadingState extends MessagesState {}

class SendMessageSuccessState extends MessagesState {}

class GetMessagesLoadingState extends MessagesState {}

class GetMessagesSuccessState extends MessagesState {}

class TypingStatusChangedState extends MessagesState {}

class UpdateTypingStatusState extends MessagesState {}
