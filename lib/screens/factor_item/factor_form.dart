// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/factor_model.dart';
import '../../providers/factor_provider.dart';

class FactorForm extends StatefulWidget {
  String fkIdScore;
  FactorForm({
    Key? key,
    required this.fkIdScore,
  }) : super(key: key);

  @override
  State<FactorForm> createState() => _FactorFormState();
}

class _FactorFormState extends State<FactorForm> {
  late FactorProvider _factorProvider;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String _name = '';
  String _desc = '';
  double _weight = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _factorProvider = Provider.of<FactorProvider>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _descController.dispose();
    _weightController.dispose();
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
                    controller: _descController,
                    decoration: const InputDecoration(labelText: 'Descrição'),
                    validator: (value) {
                      if (value!.isNotEmpty && value.length < 7) {
                        return 'A descrição deve ter mais de 7 caracteres';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      _desc = value.toString();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _weightController,
                    decoration:
                        const InputDecoration(labelText: 'Peso do fator'),
                    //esperar o gui me passar esta info
                    // validator: (value) {
                    //   //realizar a validação do peso aqui
                    //   if (value!.isNotEmpty && value.length < 7) {
                    //     return 'A descrição deve ter mais de 7 caracteres';
                    //   } else {
                    //     return null;
                    //   }
                    // },
                    onSaved: (value) {
                      _weight = double.parse(value.toString());
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            print("nome" + _name);
                            FactorModel factor = FactorModel(
                                name: _name,
                                description: _desc,
                                weight: _weight,
                                fkIdScore: widget.fkIdScore);
                            _factorProvider.addOne('factors', factor.toJson());
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
