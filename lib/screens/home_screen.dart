import 'package:cours_gl_g1_2026/models/options.dart';
import 'package:cours_gl_g1_2026/screens/scan_screen.dart';
import 'package:cours_gl_g1_2026/widgets/card_wave.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 120,
            backgroundColor: Colors.deepPurple,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings, color: Colors.white, size: 30),
            ),

            flexibleSpace: FlexibleSpaceBar(
              title: InkWell(
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: isVisible ? '10000' : '•••••••',
                        children: [
                          TextSpan(
                            text: isVisible ? 'F' : '',
                            style: GoogleFonts.aBeeZee(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      style: GoogleFonts.aBeeZee(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      !isVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 2000,
              child: Stack(
                children: [
                  Container(color: Colors.deepPurple),
                  Container(
                    margin: EdgeInsets.only(top: 80),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Center(
                        child: CardWave(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ScanScreen(),
                              ),
                               (route) => true,
                            );
                          },
                        ),
                      ),
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                        ),
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: Options.optionList.length,
                        itemBuilder: (context, index) {
                          Options option = Options.optionList[index];
                          return optionWidget(option);
                        },
                      ),
                      Divider(
                        color: Colors.grey.withValues(alpha: .3),
                        thickness: 6,
                      ),
                      ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "A Modou Fall",
                                      style: GoogleFonts.dmSans(
                                        color: Colors.deepPurple,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "10000F",
                                      style: GoogleFonts.dmSans(
                                        color: Colors.deepPurple,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  DateTime.now().toIso8601String(),
                                  style: GoogleFonts.dmSans(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  optionWidget(Options o) {
    return GestureDetector(
      onTap: () {
        switch (o.title) {
          case 'Transfert':
            break;
          case 'Paiement':
            break;
          case 'Crédit':
            break;
          case 'Banque':
            break;
          case 'Carte':
            break;
          case 'Cadeaux':
            break;
          case 'Coffre':
            break;
          case 'Transport':
            break;
          default:
        }
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: o.color.withValues(alpha: .3),
              borderRadius: BorderRadius.circular(45),
            ),
            child: Icon(o.icon, color: o.color, size: 30),
          ),
          SizedBox(height: 5),
          Text(o.title),
        ],
      ),
    );
  }
}
