import 'package:flutter/material.dart';
import 'package:seatd/screens/seatd_home_page.dart';
import 'screens/committees_screen.dart';
import 'screens/members_screen.dart';
import 'screens/bills_screen.dart';
import 'screens/votes_screen.dart';
import 'screens/statements_screen.dart';

void main() => runApp(Seatd());

class Seatd extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        VotesScreen.id: (context) => VotesScreen(),
        BillsScreen.id: (context) => BillsScreen(),
        MembersScreen.id: (context) => MembersScreen(),
        CommittesScreen.id: (context) => CommittesScreen(),
        StatementsScreen.id: (context) => StatementsScreen(),
        SeatdHomePage.id: (context) => SeatdHomePage()
      },
      initialRoute: SeatdHomePage.id,
    );
  }
} //5:00 flight#790