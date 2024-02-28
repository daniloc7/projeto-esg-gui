// import 'package:flutter/material.dart';

// import '../utils/app_colors.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: AppColors.backColor,
//       body: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Container(
//               height: height,
//               color: AppColors.mainBlueColor,
//               child: const Center(
//                 child: Text('Projeto ESG',
//                     style: TextStyle(
//                       fontSize: 48.0,
//                       color: AppColors.whiteColor,
//                       fontWeight: FontWeight.w800,
//                     )),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               height: height,
//               margin: EdgeInsets.symmetric(horizontal: height * 0.12),
//               color: AppColors.backColor,
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.only(bottom: 40.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     SizedBox(height: height * 0.2),
//                     RichText(
//                       text: const TextSpan(
//                         children: [
//                           TextSpan(
//                               text: 'Vamos fazer o',
//                               style: TextStyle(
//                                 fontSize: 25.0,
//                                 color: AppColors.blueDarkColor,
//                                 fontWeight: FontWeight.normal,
//                               )),
//                           TextSpan(
//                             text: ' Login 👇',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w800,
//                               color: AppColors.blueDarkColor,
//                               fontSize: 25.0,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: height * 0.02),
//                     SizedBox(height: height * 0.064),
//                     const Padding(
//                       padding: EdgeInsets.only(left: 16.0),
//                       child: Text(
//                         'E-mail',
//                         style: TextStyle(
//                           fontSize: 12.0,
//                           color: AppColors.blueDarkColor,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 6.0),
//                     Container(
//                       height: 50.0,
//                       width: width,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16.0),
//                         color: AppColors.whiteColor,
//                       ),
//                       child: TextFormField(
//                         style: const TextStyle(
//                           fontWeight: FontWeight.w400,
//                           color: AppColors.blueDarkColor,
//                           fontSize: 12.0,
//                         ),
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           prefixIcon: IconButton(
//                             onPressed: () {},
//                             icon: const Icon(Icons.email),
//                           ),
//                           contentPadding: const EdgeInsets.only(top: 16.0),
//                           hintStyle: TextStyle(
//                             fontWeight: FontWeight.w400,
//                             color: AppColors.blueDarkColor.withOpacity(0.5),
//                             fontSize: 12.0,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: height * 0.014),
//                     const Padding(
//                       padding: EdgeInsets.only(left: 16.0),
//                       child: Text(
//                         'Senha',
//                         style: TextStyle(
//                           fontSize: 12.0,
//                           color: AppColors.blueDarkColor,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 6.0),
//                     Container(
//                       height: 50.0,
//                       width: width,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16.0),
//                         color: AppColors.whiteColor,
//                       ),
//                       child: TextFormField(
//                         style: const TextStyle(
//                           fontWeight: FontWeight.w400,
//                           color: AppColors.blueDarkColor,
//                           fontSize: 12.0,
//                         ),
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           suffixIcon: IconButton(
//                             onPressed: () {},
//                             icon: const Icon(Icons.remove_red_eye),
//                           ),
//                           prefixIcon: IconButton(
//                             onPressed: () {},
//                             icon: const Icon(Icons.lock),
//                           ),
//                           contentPadding: const EdgeInsets.only(top: 16.0),
//                           hintStyle: TextStyle(
//                             fontWeight: FontWeight.w400,
//                             color: AppColors.blueDarkColor.withOpacity(0.5),
//                             fontSize: 12.0,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: height * 0.1),
//                     Center(
//                       child: Material(
//                         color: Colors.transparent,
//                         child: InkWell(
//                           onTap: () {},
//                           borderRadius: BorderRadius.circular(16.0),
//                           child: Ink(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 70.0, vertical: 18.0),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(16.0),
//                               color: AppColors.mainBlueColor,
//                             ),
//                             child: const Text(
//                               'Entrar',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 color: AppColors.whiteColor,
//                                 fontSize: 16.0,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// import '../utils/app_colors.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: AppColors.backColor,
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Container(
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("14.jpeg"),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           Center(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: ConstrainedBox(
//                   constraints: const BoxConstraints(
//                       maxWidth: 400), // Definindo um limite de largura
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Padding(
//                         padding: EdgeInsets.only(bottom: 50),
//                         child: Text(
//                           'Inovação Sustentável',
//                           style: TextStyle(
//                             fontSize: 36.0,
//                             color: AppColors.whiteColor,
//                             // color: AppColors.blueDarkColor,
//                             fontWeight: FontWeight.w800,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20.0),
//                       // Text(
//                       //   'Vamos fazer o Login 👇',
//                       //   style: TextStyle(
//                       //     fontWeight: FontWeight.w800,
//                       //     color: Colors.black,
//                       //     // color: AppColors.blueDarkColor,
//                       //     fontSize: 20.0,
//                       //   ),
//                       // ),
//                       const SizedBox(height: 20.0),
//                       Container(
//                         height: 40.0,
//                         width: width * 0.8,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(16.0),
//                           color: AppColors.whiteColor,
//                         ),
//                         child: Row(
//                           children: [
//                             const Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 12.0),
//                               child: Icon(Icons.email,
//                                   color: AppColors.blueDarkColor),
//                             ),
//                             Expanded(
//                               child: TextFormField(
//                                 style: const TextStyle(
//                                   fontWeight: FontWeight.w400,
//                                   color: AppColors.blueDarkColor,
//                                   fontSize: 14.0,
//                                 ),
//                                 decoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   hintText: 'Digite seu e-mail',
//                                   hintStyle: TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     color: AppColors.blueDarkColor
//                                         .withOpacity(0.5),
//                                     fontSize: 14.0,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 12.0),
//                       Container(
//                         height: 40.0,
//                         width: width * 0.8,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(16.0),
//                           color: AppColors.whiteColor,
//                         ),
//                         child: Row(
//                           children: [
//                             const Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 12.0),
//                               child: Icon(Icons.lock,
//                                   color: AppColors.blueDarkColor),
//                             ),
//                             Expanded(
//                               child: TextFormField(
//                                 style: const TextStyle(
//                                   fontWeight: FontWeight.w400,
//                                   color: AppColors.blueDarkColor,
//                                   fontSize: 14.0,
//                                 ),
//                                 obscureText: true,
//                                 decoration: InputDecoration(
//                                   suffixIcon: IconButton(
//                                     onPressed: () {},
//                                     icon: const Icon(Icons.remove_red_eye),
//                                   ),
//                                   border: InputBorder.none,
//                                   hintText: 'Digite sua senha',
//                                   hintStyle: TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     color: AppColors.blueDarkColor
//                                         .withOpacity(0.5),
//                                     fontSize: 14.0,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 20.0),
//                       Material(
//                         color: Colors.transparent,
//                         child: InkWell(
//                           onTap: () {},
//                           borderRadius: BorderRadius.circular(16.0),
//                           child: Ink(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 20.0, vertical: 10.0),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(16.0),
//                               color: AppColors.mainBlueColor,
//                             ),
//                             child: const Text(
//                               'Entrar',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 color: AppColors.whiteColor,
//                                 fontSize: 16.0,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.grey[200],
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Inovação Sustentável',
                        style: TextStyle(
                          fontSize: 36.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Container(
                        height: 40.0,
                        width: width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.white.withOpacity(0.8),
                        ),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.0),
                              child: Icon(Icons.email,
                                  color: AppColors.blueDarkColor),
                            ),
                            Expanded(
                              child: TextFormField(
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.blueDarkColor,
                                  fontSize: 14.0,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Digite seu e-mail',
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.blueDarkColor
                                        .withOpacity(0.5),
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        height: 40.0,
                        width: width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.white.withOpacity(0.8),
                        ),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.0),
                              child: Icon(Icons.lock,
                                  color: AppColors.blueDarkColor),
                            ),
                            Expanded(
                              child: TextFormField(
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.blueDarkColor,
                                  fontSize: 14.0,
                                ),
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Digite sua senha',
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.blueDarkColor
                                        .withOpacity(0.5),
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/projects_page');
                          },
                          borderRadius: BorderRadius.circular(16.0),
                          child: Ink(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: AppColors.mainBlueColor,
                            ),
                            child: const Text(
                              'Entrar',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: AppColors.whiteColor,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
