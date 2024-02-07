// import 'package:flutter/material.dart';
// import 'package:projeto/models/project_model.dart';
// import 'package:projeto/enums/project_status.dart';

// class RegisterProjectPage extends StatefulWidget {
//   const RegisterProjectPage({super.key});

//   @override
//   State<RegisterProjectPage> createState() => _RegisterProjectPageState();
// }

// class _RegisterProjectPageState extends State<RegisterProjectPage> {
//   late TextEditingController _nameController;
//   late TextEditingController _descriptionController;
//   late DateTime _initDate;
//   DateTime? _finalDate;
//   ProjectStatus _status = ProjectStatus.iniciado;
//   late double _score;

//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController();
//     _descriptionController = TextEditingController();
//     _initDate = DateTime.now();
//     _score = 0.0;
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _descriptionController.dispose();
//     super.dispose();
//   }

//   void _saveProject() {
//     ProjectModel newProject = ProjectModel(
//       id: UniqueKey().toString(),
//       name: _nameController.text,
//       description: _descriptionController.text,
//       initDate: _initDate,
//       finalDate: _finalDate,
//       status: _status,
//       score: _score,
//     );
//     // Aqui você pode enviar o novo projeto para onde quer que precise ser salvo.
//     print("Novo Projeto: $newProject");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Novo Projeto'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Nome do Projeto'),
//             ),
//             SizedBox(height: 12.0),
//             TextField(
//               controller: _descriptionController,
//               decoration: InputDecoration(labelText: 'Descrição'),
//               maxLines: null,
//             ),
//             SizedBox(height: 12.0),
//             Text('Data de Início: ${_initDate.toString()}'),
//             ElevatedButton(
//               onPressed: () {
//                 showDatePicker(
//                   context: context,
//                   initialDate: _initDate,
//                   firstDate: DateTime(2000),
//                   lastDate: DateTime(2100),
//                 ).then((date) {
//                   if (date != null) {
//                     setState(() {
//                       _initDate = date;
//                     });
//                   }
//                 });
//               },
//               child: Text('Selecionar Data de Início'),
//             ),
//             SizedBox(height: 12.0),
//             Text('Data de Término: ${_finalDate ?? "Não definida"}'),
//             ElevatedButton(
//               onPressed: () {
//                 showDatePicker(
//                   context: context,
//                   initialDate: _finalDate ?? DateTime.now(),
//                   firstDate: DateTime(2000),
//                   lastDate: DateTime(2100),
//                 ).then((date) {
//                   if (date != null) {
//                     setState(() {
//                       _finalDate = date;
//                     });
//                   }
//                 });
//               },
//               child: Text('Selecionar Data de Término'),
//             ),
//             SizedBox(height: 12.0),
//             DropdownButton<ProjectStatus>(
//               value: _status,
//               onChanged: (newValue) {
//                 setState(() {
//                   _status = newValue!;
//                 });
//               },
//               items: ProjectStatus.values.map((status) {
//                 return DropdownMenuItem<ProjectStatus>(
//                   value: status,
//                   child: Text(status.toString().split('.').last),
//                 );
//               }).toList(),
//             ),
//             SizedBox(height: 12.0),
//             TextField(
//               keyboardType: TextInputType.numberWithOptions(decimal: true),
//               onChanged: (value) {
//                 setState(() {
//                   _score = double.parse(value);
//                 });
//               },
//               decoration: InputDecoration(labelText: 'Pontuação'),
//             ),
//             SizedBox(height: 24.0),
//             ElevatedButton(
//               onPressed: _saveProject,
//               child: Text('Salvar Projeto'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class RegisterProjectPage extends StatefulWidget {
  const RegisterProjectPage({super.key});

  @override
  State<RegisterProjectPage> createState() => _RegisterProjectPageState();
}

// ProjectCard(
//     name: "Projeto 2",
//     description: "descricao",
//     initDate: DateTime.now(),
//     status: ProjectStatus.iniciado,
//     score: 5.5),

class _RegisterProjectPageState extends State<RegisterProjectPage> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _description = TextEditingController();
  final _status = TextEditingController();
  final _score = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(45),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
              100, 10, 100, 0), // Adicione o espaço no topo aqui
          child: AppBar(
            primary: false,
            centerTitle: true,
            toolbarHeight: 40,
            title: const Text('Criar Novo Projeto'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _name,
                  decoration:
                      const InputDecoration(labelText: 'Nome do Projeto'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Esse campo é obrigatório';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _description,
                  decoration: const InputDecoration(labelText: 'Descrição'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Esse campo é obrigatório';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Criar novo usuário
                    }
                  },
                  child: const Text('Criar Projeto'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
