import 'package:flutter/material.dart';
import 'package:webtonicui/widgets/buttons.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String email = '';
  String password = '';
  String username = '';
  String passwordc = '';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordcController = TextEditingController();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
    passwordcController = TextEditingController();
    super.initState();
  }

  String? validateEmail(String? value){
    if (value!.isEmpty) {
      return "This cannot be empty";
    }else if(!value.contains("@")){
      return "Please enter a valid email";
    }else if(!value.contains(".")){
      return "Please enter a valid email";
    }else{
      return null;
    }
  }
  String? validateusername(String? value){
    if (value!.isEmpty) {
      return "Please enter a username";
    }else if(value.length < 8){
      return "Username must be atleast 8 characters long";
    }else{
      return null;
    }
  }
  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your password';
    } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    } else if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one symbol';
    }
    return null;
  }
  String? validatepasswordc(String? value){
    if (value!.isEmpty) {
      return "Please enter a username";
    }else if(value != password){
      return "Password do not match";
    }else{
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 160, vertical: 60),
        child: Center(
          child: Container(

            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // //Image 
                const SizedBox(
                  width: 600,
                  child: Image(image: NetworkImage("https://app.corestoc.com/assets/uploads/logo/theme.jpg"))),
                //form
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 500,
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //username
                          TextFormField(
                            controller: usernameController,
                            decoration:  InputDecoration(
                              labelText: "Username",
                              hintText: "JohnDoyle",
                              errorText: validateusername(usernameController.text),
                              border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(23),),
                              )
                            ),
                            validator: validateusername,
                            onSaved: (value){
                              username = value!;
                            },
                          ),
                          
                          const SizedBox( height: 7,),
                  
                          // email
                          TextFormField(
                            controller: emailController,
                            decoration:  InputDecoration(
                              errorText: validateEmail(emailController.text),
                              labelText: "Email",
                              hintText: "JohnDoyle@example.com",
                              border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(23),),
                              )
                            ),
                            validator: validateEmail,
                            onSaved: (value){
                              email = value!;
                            },
                          ),
                                
                          const SizedBox( height: 7,),
                                
                          // password
                          TextFormField(
                            controller: passwordController,
                            decoration:  InputDecoration(
                              labelText: "Password",
                              errorText: validatePassword(passwordController.text),
                              hintText: "***********",
                              border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(23),),
                              )
                            ),
                            obscureText: true,
                            validator: validatePassword,
                            onSaved: (value){
                              password = value!;
                            },
                          ),
                                
                          const SizedBox( height: 7,),
                                
                          // confirm password
                          TextFormField(
                            controller: passwordcController,
                            decoration: InputDecoration(
                              errorText: validatePassword(passwordc),
                              labelText: "Confirm Password",
                              hintText: "***********",
                              border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(23),),
                              ),
                              helperText: "must contain at least ",
                              enabled: passwordController.text.isEmpty ? true : true
                            ),
                            obscureText: true,
                            validator: validatepasswordc,
                            onSaved: (value){
                              passwordc = value!;
                            },
                          ),
                                
                          const SizedBox( height: 7,),
                          
                          BigButton(action: (){}, title: "Submit"),
                                
                        ],
                      )
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}