import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionScreen extends StatefulWidget {
  final String pageName;

  const TransactionScreen({super.key, required this.pageName});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  List<Contact> contactList=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOurContacts();
  }
  getOurContacts() async {
    if(await FlutterContacts.requestPermission()){
    // Get all contacts (fully fetched)
      contactList = await FlutterContacts.getContacts(
          withProperties: true);
      contactList.removeWhere((element) => element.phones.isEmpty,);
      setState(() {

      });
      print('Contacts length: ${contactList.length} contacts');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.pageName == 'Transfert'
              ? 'Envoyer de l\'argent'
              : 'Achat crédit',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(decoration: InputDecoration(labelText: 'À')),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(45),
                          ),
                          child: Icon(
                            Icons.add_outlined,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            widget.pageName == 'Transfert'
                                ? 'Entrer un nouveau numéro'
                                : 'Acheter du crédit pour un nouveau numéro',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Contacts",
                      style: GoogleFonts.dmSans(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ListView.builder(
                      itemCount: contactList.length<50?contactList.length:50,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        Contact c=contactList[index];
                        String number = '';
                        number = c.phones.first.number;

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withValues(alpha: .2),
                                  borderRadius: BorderRadius.circular(45),
                                ),
                                child: Icon(
                                  Icons.person,
                                  size: 40,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              SizedBox(width: 10,),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(c.displayName,style: GoogleFonts.dmSans(fontSize: 18,fontWeight: FontWeight.bold),),
                                    Text(number,style: GoogleFonts.dmSans(fontSize: 16,fontWeight: FontWeight.normal,color: Colors.grey),)
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
