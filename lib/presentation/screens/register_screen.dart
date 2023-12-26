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

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();

    return Form(
      key: _formkey,
      child: Column(
        children: [
          CustomTextFormField(
            label: "nombre de usuario",
            onChanged: (value) => registerCubit.nameChanged(value),
          ),
          const SizedBox(height: 40),
          CustomTextFormField(
            label: "correo electronico",
            onChanged: (value) => registerCubit.emailChanged(value),
          ),
          const SizedBox(height: 40),
          CustomTextFormField(
            label: "Password",
            obscureText: true,
            onChanged: (value) => registerCubit.passwordChanged(value),
          ),
          const SizedBox(height: 40),
          FilledButton.tonalIcon(
            onPressed: () {
              //print("$name, $email, $password");
              registerCubit.onSUbmit();
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
