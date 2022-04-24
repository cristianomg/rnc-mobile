import 'package:flutter/material.dart';
import 'package:rnc_mobile/app/pages/about/componentes/about_content.dart';

import 'componentes/about_title.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'SOBRE O 4lab',
                  ),
                ),
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 150,
                  ),
                ),
                const AboutTitle(
                  text: "Revolução no registro de dados laboratoriais",
                ),
                const AboutContent(
                  text:
                      'O 4lab, é um site que traz a informatização para uma etapa de fundamental importância dentro de um laboratório clínico, o controle de qualidade. Surgiu com a perspectiva de reduzir e monitorar erros laboratoriais, diminuindo a utilização de papel como forma de registro, proporcionando maior praticidade, produtividade, controle, redução de custos e menor tempo de trabalho manual. Essa inovação tecnológica também auxiliará no processo da acreditação laboratorial, indispensável para que um laboratório tenha credibilidade e qualidade.',
                ),
                const AboutTitle(
                  text: "Idealizadoras",
                ),
                const AboutContent(text: """Ana Paula Barreto Prata Silva
Camilla Figueiredo Chianca
Fabio Batista Santos
Ingridy Evangelista Viana Lucena
Patrícia de Oliveira Santos Almeida
Virgilio Antônio do Nascimento Cardoso de Faro"""),
                const AboutTitle(
                  text: "Orientadores",
                ),
                const AboutContent(text: """Ana Paula Barreto Prata Silva
Camilla Figueiredo Chianca
Fabio Batista Santos
Ingridy Evangelista Viana Lucena
Patrícia de Oliveira Santos Almeida
Virgilio Antônio do Nascimento Cardoso de Faro"""),
                const AboutTitle(
                  text: "Desenvolvedores",
                ),
                const AboutContent(text: """Amadeu Martim Silva De Oliveira
Brenno Santos Oliveira
Cristiano Macedo Guimarães de Oliveira
Danilo Michell Lisboa de Freitas
Francisco José dos Santos Santana
Gledson de Carvalho Santos
Paulo Henrique Medeiros Bittencourt
Vinícius José Santana de Mendonça
Yan Kelvin Oliveira Soares"""),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close),
        ),
      ),
    );
  }
}
