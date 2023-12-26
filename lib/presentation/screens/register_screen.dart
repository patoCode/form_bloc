import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_bloc/presentation/blocs/register/register_cubit.dart';
import 'package:form_bloc/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nuevo usuario"),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FlutterLogo(size: 100),
              _RegisterForm(),
              SizedBox(height: 40)
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.name;
    final password = registerCubit.state.password;

    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: "nombre de usuario ",
            onChanged: (value) => registerCubit.nameChanged,
            // * validacion disponible porque estamos usando Formz y tenemos el campo personalizado
            errorMessage: username.errorMessage,
          ),
          const SizedBox(height: 40),
          CustomTextFormField(
            label: "correo electronico",
            onChanged: (value) => registerCubit.emailChanged(value),
          ),
          const SizedBox(height: 40),
          CustomTextFormField(
            label: "Password ",
            obscureText: true,
            onChanged: (value) => registerCubit.passwordChanged,
            // * validacion disponible porque estamos usando Formz y tenemos el campo personalizado
            errorMessage: password.errorMessage,
          ),
          const SizedBox(height: 40),
          FilledButton.tonalIcon(
            onPressed: () {
              //print("$name, $email, $password");
              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save),
            label: const Text("Guardar"),
          ),
          const SizedBox(height: 40)
        ],
      ),
    );
  }
}
