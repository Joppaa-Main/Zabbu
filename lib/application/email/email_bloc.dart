import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailEvent {}

class SendEmail extends EmailEvent {
  final String email;
  final String message;
  final String phoneNumber;
  final String name;

  SendEmail({required this.name,
    required this.email,
    required this.message,
    required this.phoneNumber,
  });
}

class EmailState {}

class EmailInitial extends EmailState {}

class EmailSending extends EmailState {}

class EmailFailure extends EmailState {
   final String status;
  EmailFailure({required this.status});
}

class EmailSent extends EmailState {
  final String status;
  EmailSent({
    required this.status,
  });
}

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  EmailBloc(EmailState initialState) : super(initialState);

  @override
  EmailState get initialState => EmailInitial();

  @override
  Stream<EmailState> mapEventToState(EmailEvent event) async* {
    if (event is SendEmail) {
      yield EmailSending(); 
      try {
      await _database.reference().child("emails").push().set({
        "email": event.email,
        "message": event.message,
        "phone_number": event.phoneNumber,
        "name": event.name
      });
      yield EmailSent(status: "success");
      } catch(e){
        yield EmailFailure(status : "Failure");

      }
    }
  }
}

extension EmailStateMapper on EmailState {
  T maybeMap<T>(
    T Function(EmailSending) emailSending,
    T Function(EmailSent) emailSent,
    T Function(EmailFailure) failure,
    T Function() orElse,
  ) {
    if (this is EmailSending) {
      return emailSending(this as EmailSending);
    } else if (this is EmailSent) {
      return emailSent(this as EmailSent);
    } else if (this is EmailFailure) {
      return failure(this as EmailFailure);
    } else {
      return orElse();
    }
  }
}
