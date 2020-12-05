import 'package:flutter/material.dart';
import 'package:mktp_service/models/user_models.dart';
import 'package:mktp_service/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Login"),
          centerTitle: true,
        ),
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model){
            if(model.isLoading)
              return Center(child: CircularProgressIndicator(),);
            return Form(
              key: _formKey,
              child: Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                    ),
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Acessar com E-mail:',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[900],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 3, bottom: 4, top: 8),
                            child: Text(
                              'E-mail',
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (text){
                              if(text.isEmpty || !text.contains("@")) return "e-mail inválido!";
                            },
                          ),
                          const SizedBox(height: 16,),
                          Padding(padding: const EdgeInsets.only(left: 3, bottom: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Senha',
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                                GestureDetector(
                                  child: Text(
                                    'Esqueceu a senha?',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  onTap: (){
                                    if(_emailController.text.isEmpty)
                                      _scaffoldKey.currentState.showSnackBar(
                                          SnackBar(content: Text("Insira o e-mail!"),
                                            backgroundColor: Colors.redAccent,
                                            duration: Duration(seconds: 2),
                                          )
                                      );
                                    else
                                      model.recoverPass(_emailController.text);
                                    _scaffoldKey.currentState.showSnackBar(
                                        SnackBar(content: Text("Verifique seu e-mail!"),
                                          backgroundColor: Theme.of(context).primaryColor,
                                          duration: Duration(seconds: 2),
                                        )
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                          TextFormField(
                            controller: _passController,
                            obscureText: true,
                            validator: (text){
                              if(text.isEmpty || text.length < 6) return "senha inválida";
                            },
                          ),
                          const SizedBox(height: 8,),
                          Container(
                            height: 40,
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            child: RaisedButton(
                              color: Colors.orangeAccent,
                              child: Text('ENTRAR'),
                              textColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              onPressed: (){
                                if(_formKey.currentState.validate()){

                                }
                                model.sigIn(
                                    email: _emailController.text,
                                    pass: _passController.text,
                                    onSucces: _onSuccess,
                                    onFail: _onFail
                                );
                              },
                            ),
                          ),
                          Divider(color: Colors.black,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                const Text(
                                  'Não possui conta? ',
                                  style: TextStyle(
                                      fontSize: 16
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (_) => SignUpScreen()));
                                  },
                                  child: Text(
                                    'Cadastre-se',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.blue,
                                        fontSize: 16
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        )
    );
  }

  void _onSuccess() {
    Navigator.of(context).pop();
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Falha ao Entrar!"),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        )
    );
  }
}

