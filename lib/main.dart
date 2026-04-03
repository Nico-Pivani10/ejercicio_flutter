import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Atividade 01',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  bool mostrarSenha = false;

  final String usuarioCorreto = "admin";
  final String senhaCorreta = "1234";

  void fazerLogin() {
    String usuario = usuarioController.text.trim();
    String senha = senhaController.text.trim();

    if (usuario.isEmpty || senha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Usuário e senha não podem ficar em branco."),
          backgroundColor: Colors.red,
        ),
      );
    } else if (usuario == usuarioCorreto && senha == senhaCorreta) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CadastroPage(nomeUsuario: usuario),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Usuário ou senha incorretos."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    usuarioController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  InputDecoration campoDecoracao({
    required String label,
    required IconData icon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      prefixIcon: Icon(icon),
      suffixIcon: suffixIcon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela de Login"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 6,
                  color: Colors.black12,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: usuarioController,
                  decoration: campoDecoracao(
                    label: "Nome de usuário",
                    icon: Icons.person,
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: senhaController,
                  obscureText: !mostrarSenha,
                  decoration: campoDecoracao(
                    label: "Senha",
                    icon: Icons.lock,
                    suffixIcon: IconButton(
                      icon: Icon(
                        mostrarSenha
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          mostrarSenha = !mostrarSenha;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: fazerLogin,
                    icon: const Icon(Icons.login),
                    label: const Text("Entrar"),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CadastroPage extends StatefulWidget {
  final String nomeUsuario;

  const CadastroPage({super.key, required this.nomeUsuario});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController enderecoController = TextEditingController();
  final TextEditingController cursoController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();
  final TextEditingController paisController = TextEditingController();

  void salvarDados() {
    String nome = nomeController.text.trim();
    String endereco = enderecoController.text.trim();
    String curso = cursoController.text.trim();
    String cidade = cidadeController.text.trim();
    String pais = paisController.text.trim();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Dados cadastrados"),
          content: SingleChildScrollView(
            child: Text(
              "Nome: $nome\n\n"
              "Endereço: $endereco\n\n"
              "Curso: $curso\n\n"
              "Cidade: $cidade\n\n"
              "País: $pais",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    nomeController.dispose();
    enderecoController.dispose();
    cursoController.dispose();
    cidadeController.dispose();
    paisController.dispose();
    super.dispose();
  }

  Widget campoTexto({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                blurRadius: 6,
                color: Colors.black12,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bem-vindo, ${widget.nomeUsuario}",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              campoTexto(
                controller: nomeController,
                label: "Nome",
                icon: Icons.person,
              ),
              campoTexto(
                controller: enderecoController,
                label: "Endereço",
                icon: Icons.home,
              ),
              campoTexto(
                controller: cursoController,
                label: "Curso",
                icon: Icons.school,
              ),
              campoTexto(
                controller: cidadeController,
                label: "Cidade",
                icon: Icons.location_city,
              ),
              campoTexto(
                controller: paisController,
                label: "País",
                icon: Icons.flag,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: salvarDados,
                      icon: const Icon(Icons.save),
                      label: const Text("Salvar"),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      label: const Text("Voltar"),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}