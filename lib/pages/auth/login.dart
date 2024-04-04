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
                SizedBox(
                  width: 600,
                  child: const Image(image: NetworkImage("https://app.corestoc.com/assets/uploads/logo/theme.jpg"))),
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
                            
                            decoration: const InputDecoration(
                              labelText: "Username",
                              hintText: "JohnDoyle",
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(23),),
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
                            decoration: const InputDecoration(
                              labelText: "Email",
                              hintText: "JohnDoyle@example.com",
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(23),),
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
                            decoration: const InputDecoration(
                              labelText: "Password",
                              hintText: "***********",
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(23),),
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
                            decoration: InputDecoration(
                              labelText: "Confirm Password",
                              hintText: "***********",
                              border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(23),),
                              ),
                              helperText: "must contain at least ",
                              enabled: password.isEmpty ? false : true
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