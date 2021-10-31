import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_apps/cubit/auth/login_cubit.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  bool isHiden = true;

  void showHiden() {
    setState(() {
      isHiden = !isHiden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        )
      ],
      child: Scaffold(
          backgroundColor: Colors.green,
          body: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Form(
                key: _keyForm,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      'UDAPOS',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                     Text(
                      'Welcome Back!',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                     SizedBox(
                      height: 60,
                    ),
                     Text(
                      'Email',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: email,
                      validator: (val) {
                        return val!.isEmpty ? "Email tidak boleh kosong" : null;
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10))),
                    ),
                     SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Password',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: password,
                      obscureText: isHiden,
                      validator: (val) {
                        return val!.isEmpty
                            ? "Password tidak boleh kosong"
                            : null;
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: showHiden,
                            icon: Icon(isHiden
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          LoginCubit cubit = context.read<LoginCubit>();
                          if (state is LoginLoading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            height: 50,
                            minWidth: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            textColor: Colors.green,
                            onPressed: () async {
                              if (_keyForm.currentState!.validate()) {
                                await cubit.loginUser(
                                    context, email.text, password.text);
                              }
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
