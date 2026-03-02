// import 'package:flutter/material.dart';

// class UserCard extends StatelessWidget {
//   final int userId;
//   final VoidCallback onTap;

//   const UserCard({
//     super.key,
//     required this.userId, required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Card(
//         margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12),
//           child: Center(
//             child: Text("User : $userId" , style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
//           ),
//         ),
//       ),
//     );
//   }
// }