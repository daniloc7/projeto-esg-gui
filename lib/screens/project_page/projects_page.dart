import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cross_scroll/cross_scroll.dart';
import 'package:flutter/material.dart';
import 'package:projeto/controllers/factor_controller.dart';
import 'package:projeto/controllers/project_controller.dart';
import 'package:projeto/controllers/score_controller.dart';
import 'package:projeto/models/project_model.dart';
import 'package:projeto/providers/factor_provider.dart';
import 'package:projeto/providers/project_provider.dart';
import 'package:projeto/screens/project_page/project_card.dart';
import 'package:projeto/screens/project_page/register_project.dart';
import 'package:projeto/utils/pallete.dart';
import 'package:projeto/widgets/custom_float_button.dart';
import 'package:projeto/widgets/custom_list_tile.dart';
import 'package:provider/provider.dart';

import '../../enums/project_status.dart';
import '../../widgets/side_bar_proxy.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  List<ProjectModel> projects = [];
  List<ProjectModel> projects2 = [];
  ProjectProvider projectProvider = ProjectProvider();
  FactorProvider factorProvider = FactorProvider();
  final TextEditingController _controller = TextEditingController();
  bool isButton1Pressed = false;
  bool isButton2Pressed = false;
  String searchTerm = '';

  void instaFactor() async {
    //posso transformar um model utilizando um toJson para passar por parametro
    // Map<String, dynamic> factor = {
    //   'name': 'Factor 2 Teste',
    //   'description': 'Factor 2',
    //   'fkIdScore': 'FKfGfIMtknOJvvKPEn8D',
    // };
    // await factorProvider.addOne('factors', factor);
    await projectProvider.getAll('projects');
    projects = projectProvider.projectList;
    // await projectProvider.getByNameOrDescription(
    //     'projects', 'Projeto B', projects);
    projects2 = projectProvider.projectList;
    // print('projetos' + projects2.length.toString());
  }

  @override
  void initState() {
    super.initState();
    projectProvider = Provider.of<ProjectProvider>(context, listen: false);
    instaFactor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(50),
      //   child: Padding(
      //     padding: const EdgeInsets.fromLTRB(300, 10, 300, 10),
      //     child: Container(
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(50),
      //         color: mycolor,
      //       ),
      //       child: AppBar(
      //         title: const Text('Bem vindo, Danilo!'),
      //         centerTitle: true,
      //         backgroundColor: Colors.transparent,
      //         elevation: 0,
      //       ),
      //     ),
      //   ),
      // ),
      // appBar: AppBar(toolbarHeight: MediaQuery.of(context).size.height * 0.05),
      body: Row(
        children: [
          Expanded(flex: 1, child: drawer()),
          Expanded(flex: 5, child: body()),
        ],
      ),
      floatingActionButton: CustomFloatButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const RegisterProjectPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget drawer() {
    return Drawer(
      // width: MediaQuery.of(context).size.width * 0.15,
      child: ListView(
        children: [
          // ignore: prefer_const_constructors
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.lightGreen, mycolor],
              ),
            ),
            child: Column(
              children: [
                Material(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYf6uUYcGcQ8e9neDNRXMUUXzmUPuUJtel5g&usqp=CAU',
                      fit: BoxFit.contain,
                      // fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        }
                      },
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Center(
                          child: Text('Erro ao carregar a imagem'),
                        );
                      },
                    ),
                  ),
                  // child: Image.asset(
                  //   'lib/assets/images/logo.PNG',
                  //   width: 98,
                  //   height: 98,
                  // ),
                ),
                Container(
                  decoration: BoxDecoration(
                    // color: Colors.,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: const Text(
                    "Projeto ESG",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          CustomListTile(icon: Icons.groups, text: "Início", onTap: () => {}),
          CustomListTile(icon: Icons.groups, text: "Clientes", onTap: () => {}),
          CustomListTile(
              icon: Icons.groups, text: "Gestão de Projetos", onTap: () => {}),
          CustomListTile(
              icon: Icons.groups, text: "Gestão de OKR's", onTap: () => {}),
          CustomListTile(icon: Icons.groups, text: "Sair", onTap: () => {}),
          // () => {principalCtrl.routeClientes(context)}),
        ],
      ),
    );
  }

  Widget body() {
    return Container(
      color: Colors.grey[200],
      child: Column(
        children: [
          const SizedBox(height: 20),
          //gestão de projetos, redimensionar o container
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 700,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  //widget gestão de projetos com o icon
                  child: Stack(
                    children: [
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Gestão de Projetos',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.menu)),
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(
                  right: 50, bottom: 15, child: Icon(Icons.person)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(200, 40, 200, 0),
            child: Column(
              children: [
                // if (isButton2Pressed)
                //   Padding(
                //     padding: const EdgeInsets.fromLTRB(200, 10, 0, 0),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: <Widget>[
                //         ElevatedButton(
                //           onPressed: () {
                //             setState(() {
                //               isButton2Pressed = !isButton2Pressed;
                //             });
                //           },
                //           child: const Text('Sucesso'),
                //         ),
                //         const SizedBox(
                //             width:
                //                 10), // Add some spacing between the buttons
                //         ElevatedButton(
                //           onPressed: () {
                //             setState(() {
                //               isButton2Pressed = !isButton2Pressed;
                //             });
                //           },
                //           child: const Text('Falha'),
                //         ),
                //       ],
                //     ),
                //   ),
              ],
            ),
          ),
          //barra de pesquisa
          Padding(
              padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
              child: searchBar()),
          //em progresso e finalizados
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                  width: 145,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isButton1Pressed = !isButton1Pressed;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        isButton1Pressed ? Colors.white54 : Colors.white,
                      ),
                    ),
                    child: const Text(
                      'Em progresso',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  height: 40,
                  width: 145,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isButton2Pressed = !isButton2Pressed;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        isButton2Pressed ? Colors.white54 : Colors.white,
                      ),
                    ),
                    child: Row(
                      children: [
                        const Text(
                          'Finalizados',
                          style: TextStyle(color: Colors.black),
                        ),
                        PopupMenuButton<String>(
                          icon: const Icon(Icons.more_vert,
                              size: 24, color: Colors.black),
                          onSelected: (String result) {},
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              value: 'editar',
                              child: ListTile(
                                leading: Icon(
                                  Icons.check,
                                  color: Colors.green,
                                ),
                                title: Text('Sucesso'),
                              ),
                            ),
                            const PopupMenuItem<String>(
                              value: 'excluir',
                              child: ListTile(
                                leading: Icon(Icons.error, color: Colors.red),
                                title: Text('Falha'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //area dos projetos
          Expanded(
            child: SingleChildScrollView(
              child: Consumer<ProjectProvider>(
                builder: (context, projectProvider, _) {
                  // projectProvider.getOne('projects', '0k6zvh1XCxNwHlVF9RXk');
                  // searchTerm == ''
                  //     ? projects = projectProvider.projectList
                  //     : projects = projects;
                  projects = projectProvider.projectList;

                  return Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      // color: Color(0xF5F5F9),
                      padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                      child: projects.isEmpty
                          ? const Center(child: CircularProgressIndicator())
                          : Wrap(
                              //verificar se aq n fica melhor inkwell
                              spacing: 80, //coluna
                              runSpacing: 40, //linha
                              children: projects
                                  .map((project) => ProjectCard(
                                        project: project,
                                      ))
                                  .toList(),
                            ));
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Widget searchBar() {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: 'Pesquisar',
        fillColor: Colors.white,
        filled: true,
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            _controller.clear();
          },
        ),
      ),
      onSubmitted: (value) async {
        setState(() {
          _controller.text = '';
        });
        // projects = await projectProvider.getByNameOrDescription(
        //     'projects', searchTerm);
        // print('leng' + projects.length.toString());
        searchTerm = value;
      },
    );
  }
}
