import 'package:freeclimbers_employee/blocs/contact_us_bloc/contact_us_bloc.dart';
import 'package:freeclimbers_employee/extensions/colors.dart';
import 'package:freeclimbers_employee/repositories/contact_us/contact_us_repository.dart';
import 'package:freeclimbers_employee/services/contact_us/contact_us_service_impl.dart';
import 'package:freeclimbers_employee/ui/widgets/buttons/app_elevated_button.dart';
import 'package:freeclimbers_employee/ui/widgets/nav/app_navbar.dart';
import 'package:freeclimbers_employee/ui/widgets/text_fields/app_plain_text_field.dart';
import 'package:freeclimbers_employee/utils/toasts.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../consts/k_colors.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  late final ContactUsBloc contactUsBloc = ContactUsBloc(contactUsRepository: ContactUsRepository(contactUsService: ContactUsServiceImpl(dio: context.read<Dio>())));

  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<String> _errorTags = [];

  @override
  void dispose() {
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ContactUsBloc, ContactUsState>(
      bloc: contactUsBloc,
      listener: (context,state){
        state.maybeMap(
            sent: (_){
              context.loaderOverlay.hide();
              AppToast.instance.showSuccess(context, AppLocalizations.of(context)!.success_send_email);
              context.pop();
            },
            error: (_){
              context.loaderOverlay.hide();
              AppToast.instance.showError(context, AppLocalizations.of(context)!.failed_send_email);
            },
            orElse: (){});
      },
      child: Scaffold(
        appBar: AppNavbar(
          title: AppLocalizations.of(context)!.contact,
          onPrefixWidgetTap: (){
            context.pop();
          },
          prefixWidget: Icon(FontAwesomeIcons.chevronLeft, color: KColors.white, size: 24,),
        ),
        backgroundColor: context.colors.basePrimaryBack,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Center(child: Text(AppLocalizations.of(context)!.write_us_message, style: TextStyle(fontSize: 16, color: context.colors.fieldNormalText),)),
                ),
                AppPlanTextField(title: AppLocalizations.of(context)!.subject, whiteTitle: false, controller: _subjectController, tagForError: "subject", currentTags: _errorTags,),
                AppPlanTextField(title: AppLocalizations.of(context)!.message, whiteTitle: false, multiline: true, controller: _messageController, tagForError: "message", currentTags: _errorTags,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Center(child: AppElevatedButton(title: AppLocalizations.of(context)!.send, onPressed: (){
                    _errorTags.clear();
                    final subject = _subjectController.text;
                    final message = _messageController.text;
                    if(subject.isNotEmpty && message.isNotEmpty){
                      //context.loaderOverlay.show();
                    }else{
                      if(subject.isEmpty){
                        _errorTags.add("subject");
                      }
                      if(message.isEmpty){
                        _errorTags.add("message");
                      }
                    }
                    _formKey.currentState!.validate();
                    setState(() {});
                  }, expanded: false,)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
