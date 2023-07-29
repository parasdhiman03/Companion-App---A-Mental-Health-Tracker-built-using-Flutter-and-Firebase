import 'package:flutter/material.dart';

class ProfessionalHelpPage extends StatelessWidget {
  // Define the list of therapists' data
  final List<TherapistData> therapists = [
    TherapistData(
      name: 'Dr Raman Taneja',
      address: 'Dehradun',
      phoneNumber: '+91 9898809303',
      profilePicture: 'https://img.freepik.com/premium-vector/young-smiling-doctor-with-stethoscope3d-vector-people-character-illustrationcartoon-minimal-style_365941-707.jpg?size=626&ext=jpg', // Replace with the actual asset path or network URL
    ),
    TherapistData(
      name: 'Dr Tanisha Mittal',
      address: 'Dehradun',
      phoneNumber: '+91 983243434',
      profilePicture: 'https://img.freepik.com/premium-vector/smiling-woman-doctor-holding-clipboard-wearing-uniform-stethoscope-healthcare-medicine-concept-3d-vector-people-character-illustration-cartoon-minimal-style_365941-823.jpg?size=626&ext=jpg', // Replace with the actual asset path or network URL
    ),
    TherapistData(
      name: 'Dr Vishwajeet Patel',
      address: 'Delhi',
      phoneNumber: '+91 912982372',
      profilePicture: 'https://img.freepik.com/premium-vector/young-smiling-doctor-with-stethoscope3d-vector-people-character-illustrationcartoon-minimal-style_365941-707.jpg?size=626&ext=jpg', // Replace with the actual asset path or network URL
    ),
    TherapistData(
      name: 'Dr Saurabh Mehra',
      address: 'Dehradun',
      phoneNumber: '9876543214',
      profilePicture: 'https://img.freepik.com/premium-vector/young-smiling-doctor-with-stethoscope3d-vector-people-character-illustrationcartoon-minimal-style_365941-707.jpg?size=626&ext=jpg', // Replace with the actual asset path or network URL
    ),
    TherapistData(
      name: 'Dr. Kanishk Singh',
      address: 'Dehradun',
      phoneNumber: '9876543435',
      profilePicture: 'https://img.freepik.com/premium-vector/young-smiling-doctor-with-stethoscope3d-vector-people-character-illustrationcartoon-minimal-style_365941-707.jpg?size=626&ext=jpg', // Replace with the actual asset path or network URL
    ),
    TherapistData(
      name: 'Dr B. S. Judge',
      address: 'Dehradun',
      phoneNumber: '98783754673',
      profilePicture: 'https://img.freepik.com/premium-vector/young-smiling-doctor-with-stethoscope3d-vector-people-character-illustrationcartoon-minimal-style_365941-707.jpg?size=626&ext=jpg', // Replace with the actual asset path or network URL
    ),
    // Add more therapists as needed
    // TherapistData(...),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Professional Help'),
      ),
      body: ListView.builder(
        itemCount: therapists.length,
        itemBuilder: (context, index) {
          final therapist = therapists[index];
          return TherapistCard(
            therapist: therapist,
          );
        },
      ),
    );
  }
}

class TherapistData {
  final String name;
  final String address;
  final String phoneNumber;
  final String profilePicture;

  TherapistData({
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.profilePicture,
  });
}

class TherapistCard extends StatelessWidget {
  final TherapistData therapist;

  const TherapistCard({required this.therapist});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(therapist.profilePicture),
            radius: 40,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  therapist.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(therapist.address),
                SizedBox(height: 8),
                Text(therapist.phoneNumber),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
