// import 'package:flutter/material.dart';
// import 'rounded_button.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'constants.dart';

// class BottomCard extends StatelessWidget {
//   final int weightAge;
//   BottomCard({required this.weightAge})

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const Text(
//           'Weight',
//           style: labelStyle,
//         ),
//         Text(
//           '$weightAge',
//           style: numberStyle,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Expanded(
//               child: RoundedButton(
//                 child: const FaIcon(FontAwesomeIcons.plus),
//                 onpressed: () {
//                   setState(() {
//                     weight++;
//                   });
//                 },
//               ),
//             ),
//             Expanded(
//               child: RoundedButton(
//                 child: const FaIcon(FontAwesomeIcons.minus),
//                 onpressed: () {
//                   setState(() {
//                     weight--;
//                   });
//                 },
//               ),
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }
