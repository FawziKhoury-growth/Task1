// part of screens_library;

// class LoadingWidget extends StatelessWidget {
//   const LoadingWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AbsorbPointer(
//       absorbing: true,
//     child: Container(
//       height: MediaQuery.of(context).size.height,
//       width: double.infinity,
//       color: Colors.transparent,
//       child: Center(
//         // alignment: Alignment.center,
//         child: Container(
//           color: Colors.transparent,
//           height: 40.h,
//           width: 40.w,
//           child: CircularProgressIndicator(),
//         ),
//       ),
//     ),
//   );
// }
// }

import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      color: Colors.transparent,
      child: Center(
        // alignment: Alignment.center,
        child: Container(
          color: Colors.transparent,
          height: 40,
          width: 40,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
