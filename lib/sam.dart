// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: PageTurnAnimationDemo(),
//     );
//   }
// }
//
// class PageTurnAnimationDemo extends StatefulWidget {
//   @override
//   _PageTurnAnimationDemoState createState() => _PageTurnAnimationDemoState();
// }
//
// class _PageTurnAnimationDemoState extends State<PageTurnAnimationDemo> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 500),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Page Turn Animation Demo'),
//       ),
//       body: GestureDetector(
//         onHorizontalDragUpdate: (details) {
//           if (details.delta.dx > 0) {
//             // Swiping right
//             _controller.forward(from: 0.0);
//           } else {
//             // Swiping left
//             _controller.reverse(from: 1.0);
//           }
//         },
//         child: Center(
//           child: AnimatedBuilder(
//             animation: _controller,
//             builder: (context, child) {
//               return Transform(
//                 alignment: Alignment.center,
//                 transform: Matrix4.identity()
//                   ..setEntry(3, 2, 0.001) // Perspective
//                   ..rotateY((_controller.value - 0.5) * 3.14), // Y rotation
//                 child: child,
//               );
//             },
//             child: Container(
//               width: 200,
//               height: 300,
//               color: Colors.blue,
//               child: Center(
//                 child: Text(
//                   'Page Content',
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }