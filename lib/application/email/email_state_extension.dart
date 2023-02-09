import "./email_bloc.dart";


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
