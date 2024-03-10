// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:projeto/enums/project_status.dart';
import 'package:projeto/providers/project_provider.dart';
import 'package:projeto/widgets/custom_form_textfield.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../models/project_model.dart';

class ProjectForm extends StatefulWidget {
  const ProjectForm({super.key});

  @override
  State<ProjectForm> createState() => _ProjectFormState();
}

class _ProjectFormState extends State<ProjectForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  ProjectProvider _projectProvider = ProjectProvider();

  String _name = '';
  String _description = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _projectProvider = Provider.of<ProjectProvider>(context, listen: false);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Stack(
        clipBehavior: Clip.none,
        children: [
          const Positioned(
            top: -10,
            left: 35,
            child: Text(
              'Cadastrar novo fator',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Positioned(
            right: -40.0,
            top: -40.0,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade400,
                child: const Icon(Icons.close, color: Colors.black),
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Nome'),
                    validator: (value) {
                      if (value!.isNotEmpty && value.length < 4) {
                        return 'O Nome deve ter mais de 3 caracteres';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      _name = value.toString();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(labelText: 'Descrição'),
                    validator: (value) {
                      if (value!.isNotEmpty && value.length < 7) {
                        return 'A descrição deve ter mais de 7 caracteres';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      _description = value.toString();
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            // print("nome" + _name);
                            ProjectModel project = ProjectModel(
                                name: _name,
                                description: _description,
                                initDate: DateTime.now(),
                                score: 0);
                            _projectProvider.addOne(
                                'projects', project.toJson());
                          }
                          setState(() {
                            Navigator.of(context).pop();
                          });
                        },
                        child: const Text('Salvar')))
              ],
            ),
          )
        ],
      ),
    );
  }
}
