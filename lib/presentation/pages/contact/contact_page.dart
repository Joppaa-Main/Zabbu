import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zabbu/application/email/email_bloc.dart';
import 'package:zabbu/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../injection_container.dart';
import 'contact_page_mobile.dart';
import 'contact_page_desktop.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';

class ContactPage extends StatefulWidget {
  static const String contactPageRoute = StringConst.CONTACT_PAGE;

  const ContactPage({
    required Key key,
  }) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  late EmailBloc _emailBloc;

  @override
  void initState() {
    _emailBloc = sl<EmailBloc>();
    super.initState();
  }

  @override
  void dispose() {
    _emailBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailBloc, EmailState>(
        bloc: _emailBloc,
        listener: (context, state) {
          if (state is EmailSending) {
            
            FlushbarHelper.createLoading(
              message: "Sending Email ...",
              linearProgressIndicator: LinearProgressIndicator(
                backgroundColor: AppColors.primaryColor,
              ),
            ).show(context);
          }
          ;
          if (state is EmailFailure) {
            FlushbarHelper.createError(
              message: "Failed to send email",
            ).show(context);
          }
          ;
          if (state is EmailSent) {
            FlushbarHelper.createSuccess(
              message: "Email sent successfully",
            ).show(context);
            // if (value.email.status == "success") {
            //   FlushbarHelper.createSuccess(
            //     message: "Email sent successfully",
            //   ).show(context);
            // } else {
            //   FlushbarHelper.createError(
            //     message: "Failed to send email",
            //   ).show(context);
            // }
          } else {
            FlushbarHelper.createError(
              message: "Sorry, something went wrong.",
            ).show(context);
          }
          ; //end o
        },
        builder: (context, state) {
          return Scaffold(
            body: BlocProvider(
              create: (_) => _emailBloc,
              child: ScreenTypeLayout(
                desktop: ContactPageDesktop(),
                tablet: ContactPageDesktop(),
                mobile: ContactPageMobile(),
              ),
            ),
          );
        });
  }
}
