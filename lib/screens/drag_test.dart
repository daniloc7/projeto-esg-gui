// import 'package:flutter/material.dart';
// import 'package:projeto/widgets/factor.dart';

// class TestPage extends StatefulWidget {
//   const TestPage({Key? key}) : super(key: key);

//   @override
//   _TestPageState createState() => _TestPageState();
// }

// class _TestPageState extends State<TestPage> {
//   late List<Factor> factores;

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   factores = [
//   //     Factor(
//   //       name: 'Fator 1',
//   //       markedIndicators: 15,
//   //       totalIndicators: 20,
//   //     ),
//   //     Factor(
//   //       name: 'Fator 2',
//   //       markedIndicators: 15,
//   //       totalIndicators: 20,
//   //     ),
//   //     Factor(
//   //       name: 'Fator 3',
//   //       markedIndicators: 15,
//   //       totalIndicators: 20,
//   //     ),
//   //   ];
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           buildRow(factores),
//           // buildRow(factores.sublist(0, factores.length)),
//         ],
//       ),
//     );
//   }

//   Widget buildRow(List<Factor> rowFactors) {
//     return Row(
//       children: [
//         const Text('Titulo'),
//         for (final factor in rowFactors)
//           DragTarget<Factor>(
//             builder: (context, candidateData, rejectedData) {
//               return LongPressDraggable<Factor>(
//                 data: factor,
//                 feedback: Opacity(
//                   opacity: 0.7,
//                   child: factor,
//                 ),
//                 childWhenDragging: factor,
//                 onDragStarted: () {
//                   setState(() {
//                     factor.isSelected = true;
//                   });
//                 },
//                 onDragEnd: (details) {
//                   setState(() {
//                     factor.isSelected = false;
//                   });
//                 },
//                 onDragCompleted: () {
//                   setState(() {
//                     factor.isSelected = false;
//                   });
//                 },
//                 child: factor,
//               );
//             },
//             onWillAccept: (data) => true,
//             onAccept: (data) {
//               final draggedIndex = factores.indexOf(data);
//               final targetIndex = factores.indexOf(factor);

//               setState(() {
//                 factores[draggedIndex] = factor;
//                 factores[targetIndex] = data;
//               });
//             },
//           ),
//         IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
//       ],
//     );
//   }
// }
