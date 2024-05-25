
part of '../page.dart';

class _ContentContact extends StatelessWidget {
  const _ContentContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.phone),
          title: const Text('Phone Number'),
          subtitle: const Text('+1 234 567 890'),
          onTap: () {
            // Implement your logic here to call the admin
          },
        ),
        ListTile(
          leading: const Icon(Icons.email),
          title: const Text('Email Address'),
          subtitle: const Text('lezazelf@gmail.com'),
          onTap: () {
            // Implement your logic here to send an email to the admin
          },
        ),
        ListTile(
          leading: const Icon(Icons.location_on),
          title: const Text('Address'),
          subtitle: const Text('123 Main Street, City, Country'),
          onTap: () {
            // Implement your logic here to show the admin's location on a map
          },
        ),

        20.0.h,
        ElevatedButton.icon(
          onPressed: (){},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(lezazelColor),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(fontSize: 16),
            ),
            minimumSize: MaterialStateProperty.all<Size>(
              const Size(double.infinity, 40),
            ),
          ),
          icon: const Icon(Icons.chat),
          label: const Text('Start Chat'),
        ),
      ],
    );
  }
}
