import 'package:auth_repository/auth_repository.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../../helper/validator.dart';

class LoginFormBloc extends FormBloc<String, String> {
  final AuthRepository authRepository;
  @override
  Future<void> close() async {
    print('Login bloc close');
    super.close();
  }

  final email = TextFieldBloc(
    validators: [
      emailValidator,
    ],
  );

  final password = TextFieldBloc(
    validators: [
      passwordValidator,
    ],
  );
  String get emailValue => email.value;
  final rememberMe = BooleanFieldBloc();

  LoginFormBloc(this.authRepository) {
    addFieldBlocs(
      fieldBlocs: [
        email,
        password,
        rememberMe,
      ],
    );
  }

  @override
  void onSubmitting() async {
    authRepository.login(email.value, password.value).then((value) {
      if (value?.isSuccess ?? false) {
        emitSuccess(successResponse: value?.data);
      } else {
        emitFailure(failureResponse: value?.message ?? 'error');
      }
    });
  }
}
