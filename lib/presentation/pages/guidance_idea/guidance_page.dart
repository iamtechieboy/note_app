// import 'package:flutter/material.dart';
// import 'package:note_app/config/constants/app_colors.dart';
// import 'package:note_app/config/constants/app_text_style.dart';
// import 'package:note_app/presentation/components/bottom_task_bar.dart';
// import 'package:note_app/presentation/components/custom_app_bar.dart';

// class GuidancePage extends StatefulWidget {
//   const GuidancePage({super.key});

//   @override
//   State<GuidancePage> createState() => _GuidancePageState();
// }

// class _GuidancePageState extends State<GuidancePage> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: const CustomAppBar(),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24,),
//               child: Column(
//                 children: [
//                   SizedBox(
//                       width: size.width - 32,
//                       child: Flexible(
//                         child: TextFormField(
//                           style: AppTextStyle.bold2Xl,
//                           maxLines: null,
//                           minLines: null,
//                           keyboardType: TextInputType.multiline,
//                           autocorrect: false,
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             hintText: "Title Here",
//                             hintStyle: AppTextStyle.bold2Xl.copyWith(
//                               color: AppColors.neutralColor.baseGrey,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                 ],
//               ),

//             ),
//           ),
//           BottomTaskBar(context: context),
//         ],
//       ),
//     );
//   }
// }
