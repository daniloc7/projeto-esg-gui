import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class IndicatorForm extends StatefulWidget {
  @override
  State<IndicatorForm> createState() => _IndicatorFormState();
}

class _IndicatorFormState extends State<IndicatorForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _weightController;
  bool _essential = false; // Inicialize com um valor padrão
  late bool _isMarked;

  String? name;
  String? description;
  double? weight;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _weightController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.04,
      width: MediaQuery.of(context).size.width * 0.1,
      child: ElevatedButton(
        onPressed: () {
          Alert(
              context: context,
              content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(labelText: 'Nome'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            name = value!;
                          },
                        ),
                        TextFormField(
                          controller: _descriptionController,
                          decoration:
                              const InputDecoration(labelText: 'Descrição'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a description';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            description = value!;
                          },
                        ),
                        TextFormField(
                          controller: _weightController,
                          decoration: const InputDecoration(labelText: 'Peso'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a weight';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            weight = double.tryParse(value!) ?? 0.0;
                          },
                        ),
                        CheckboxListTile(
                          title: const Text('É essencial?'),
                          value: _essential,
                          onChanged: (bool? value) {
                            setState(() {
                              _essential = value ?? false;
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              buttons: [
                DialogButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "CRIAR",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ]).show();
        },
        child: const Text('Novo Indicador'),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class IndicatorForm extends StatefulWidget {
//   @override
//   State<IndicatorForm> createState() => _IndicatorFormState();
// }

// class _IndicatorFormState extends State<IndicatorForm> {
//   final _formKey = GlobalKey<FormState>();
//   late TextEditingController _nameController;
//   late TextEditingController _descriptionController;
//   late TextEditingController _weightController;
//   bool _essential = false; // Inicialize com um valor padrão
//   late bool _isMarked;

//   String? name;
//   String? description;
//   double? weight;

//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController();
//     _descriptionController = TextEditingController();
//     _weightController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _descriptionController.dispose();
//     _weightController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       insetPadding: const EdgeInsets.symmetric(horizontal: 16.0),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: Form(
//         key: _formKey,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             TextFormField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Nome'),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter a name';
//                 }
//                 return null;
//               },
//               onSaved: (value) {
//                 name = value!;
//               },
//             ),
//             TextFormField(
//               controller: _descriptionController,
//               decoration: InputDecoration(labelText: 'Descrição'),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter a description';
//                 }
//                 return null;
//               },
//               onSaved: (value) {
//                 description = value!;
//               },
//             ),
//             CheckboxListTile(
//               title: Text('Essential'),
//               value: _essential,
//               onChanged: (bool? value) {
//                 setState(() {
//                   _essential = value ?? false; // Atualize o valor de _essential
//                 });
//               },
//             ),
//             TextFormField(
//               controller: _weightController,
//               decoration: InputDecoration(labelText: 'Weight'),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter a weight';
//                 }
//                 return null;
//               },
//               onSaved: (value) {
//                 weight = double.tryParse(value!) ?? 0.0;
//               },
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   _formKey.currentState!.save();
//                   // Após salvar, use as variáveis name, description, weight e _essential conforme necessário
//                 }
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
