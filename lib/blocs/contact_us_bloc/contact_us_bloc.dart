import 'package:bloc/bloc.dart';
import 'package:climbers/custom_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repositories/contact_us/contact_us_repository.dart';

part 'contact_us_event.dart';
part 'contact_us_state.dart';
part 'contact_us_bloc.freezed.dart';

class ContactUsBloc extends Bloc<ContactUsEvent, ContactUsState> {
  final ContactUsRepository _contactUsRepository;

  Future<void> _mapEventToState(ContactUsEvent event, Emitter<ContactUsState> emit) =>
      event.map(sendEmail: (e) => _sendEmail(e, emit));

  Future<void> _sendEmail(_SendEmailEvent event, Emitter<ContactUsState> emit) async{
    try{
      emit(ContactUsState.loading());
      await _contactUsRepository.sendEmail(email: event.email, subject: event.subject, message: event.message);
      emit(ContactUsState.sent());
    }on CustomError catch(e){
      emit(ContactUsState.error(customError: e));
      emit(ContactUsState.initial());
    }
  }

  ContactUsBloc({
    required ContactUsRepository contactUsRepository,
  }) : _contactUsRepository = contactUsRepository, super(const ContactUsState.initial()){
    on<ContactUsEvent>(_mapEventToState);
  }
}
