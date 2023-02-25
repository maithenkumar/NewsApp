// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:decisionlite/services/functions/authFunctions.dart';
// import 'package:decisionlite/services/providers/pollProvider.dart';
// import 'package:decisionlite/utils/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:polls/polls.dart';
// import 'package:provider/provider.dart';

// class PollsContainer extends StatefulWidget {
//   const PollsContainer({Key? key}) : super(key: key);

//   @override
//   _PollsContainerState createState() => _PollsContainerState();
// }

// class _PollsContainerState extends State<PollsContainer> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<PollsProvider>(
//         builder: (context, model, child) => Card(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   side:
//                       BorderSide(color: Colors.grey.shade600.withOpacity(0.3))),
//               elevation: 0,
//               margin: const EdgeInsets.only(top: 20, bottom: 20),
//               color: Colors.transparent,
//               child: Container(
//                 padding: EdgeInsets.all(10),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                             child: TextFormField(
//                           decoration: const InputDecoration(
//                               hintText: 'Add Polls Title',
//                               hintStyle: TextStyle(fontSize: 18),
//                               border: OutlineInputBorder(
//                                   borderSide: BorderSide.none)),
//                           textCapitalization: TextCapitalization.sentences,
//                           cursorColor: AppColors.primary,
//                           maxLines: 2,
//                           minLines: 1,
//                           validator: (value) {
//                             if (value!.length == 0) {
//                               return 'Enter Title';
//                             } else {
//                               return null;
//                             }
//                           },
//                           onSaved: (value) {
//                             model.addPollTitle(value!);
//                           },
//                         ))
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         for (int i = 0; i < model.pollsOptions.length; i++)
//                           Container(
//                               margin: EdgeInsets.symmetric(vertical: 10),
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Row(
//                                 children: [
//                                   IconButton(
//                                       onPressed: () {
//                                         model.removeOption();
//                                       },
//                                       icon: Icon(Icons.close)),
//                                   Expanded(
//                                       child: TextFormField(
//                                     decoration: InputDecoration(
//                                         hintText: 'Enter Option',
//                                         // hintText: 'Option ${index + 1}',
//                                         border: InputBorder.none),
//                                     validator: (value) {
//                                       if (value!.length == 0) {
//                                         return 'Enter Option';
//                                       } else {
//                                         return null;
//                                       }
//                                     },
//                                     onSaved: (value) {
//                                       model.pollsOptions[i] = value!;
//                                       model.pollsWeights[value] = 0;
//                                     },
//                                   ))
//                                 ],
//                               ))
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         TextButton(
//                             onPressed: () {
//                               model.addPollOption();
//                             },
//                             child: Text('Add an Option')),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ));
//   }
// }

// class PollsWidget extends StatefulWidget {
//   final String decisionId, decisionTitle, creatorId;
//   final Map pollWeights, usersWhoVoted;
//   const PollsWidget(
//       {Key? key,
//       required this.decisionId,
//       required this.decisionTitle,
//       required this.creatorId,
//       required this.pollWeights,
//       required this.usersWhoVoted})
//       : super(key: key);

//   @override
//   _PollsWidgetState createState() => _PollsWidgetState();
// }

// class _PollsWidgetState extends State<PollsWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 10),
//       child: Card(
//         shadowColor: Colors.grey.shade600.withOpacity(0.2),
//         elevation: 0,
//         color: Colors.transparent,
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(14),
//             side: BorderSide(color: Colors.grey.shade600.withOpacity(0.3))),
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Expanded(
//                     child: Text(
//                       widget.decisionTitle,
//                       style: const TextStyle(fontSize: 18),
//                     ),
//                   ),
//                 ],
//               ),
//               Polls(
//                 iconColor: Colors.black,
//                 children: [
//                   for (int i = 0;
//                       i < widget.pollWeights.keys.toList().length;
//                       i++)
//                     Polls.options(
//                         title: widget.pollWeights.keys.toList()[i],
//                         value: (widget.pollWeights.values.toList()[i])
//                             .toDouble()) //change value
//                 ],
//                 allowCreatorVote: true,
//                 question: const Text(''),
//                 outlineColor: AppColors.primary,

//                 currentUser: currUser!.uid,
//                 creatorID: widget.creatorId,

//                 voteData: widget.usersWhoVoted, //Users who have already voted
//                 leadingBackgroundColor: AppColors.primary.withOpacity(0.6),
//                 userChoice: widget.pollWeights.keys
//                     .toList()
//                     .indexOf(widget.usersWhoVoted[widget.decisionId]),
//                 onVoteBackgroundColor: AppColors.primary.withOpacity(0.5),

//                 backgroundColor: Colors.transparent,

//                 onVote: (choice) async {
//                   Map userWhoVoted = widget.usersWhoVoted;
//                   Map thisPollweights = widget.pollWeights;

//                   var selectedOption =
//                       widget.pollWeights.keys.toList()[choice - 1];
//                   setState(() {
//                     //updating Poll Weights
//                     thisPollweights[selectedOption] =
//                         thisPollweights[selectedOption] + 1;

//                     //Updating people who voted map with their choice
//                     userWhoVoted[currUser!.uid] =
//                         widget.pollWeights.keys.toList()[choice - 1];
//                   });

//                   //updating everything on Cloud Firestore
//                   await FirebaseFirestore.instance
//                       .collection('decisions')
//                       .doc(widget.decisionId)
//                       .update({
//                     'pollWeights': thisPollweights,
//                     'usersWhoVoted': userWhoVoted
//                   });
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
