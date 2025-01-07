
import 'package:flutter/material.dart';
import 'package:flutter_midtrans_example/models/database.dart';

class AccountSeting extends StatefulWidget {
  const AccountSeting({super.key});

  @override
  State<AccountSeting> createState() => AccountSetingState();
}

class AccountSetingState extends State<AccountSeting> {
  final Database db = Database();
  String docId = '';
  String name = "";
  String email = "";
  String phone = "";

  Future<void> deletAcount(context) async {
    try {
      for (var doc in await db.findAll("users")) {
        if (doc['email'] == db.auth.currentUser!.email) {
          setState(() {
            docId = doc['id'];
          });
        }
      }
      await db.user!.delete();
      await db.deleteData("users", docId);
      Navigator.popUntil(context, ModalRoute.withName('/splash'));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Gagal menghapus akun')));
    }
  }

  @override
  void initState() {
    super.initState();
    updateacount();
  }

  Future<void> updateacount() async {
    try {
      var users = await db.findAll("users");
      debugPrint('Users: $users');
      debugPrint('Current User Email: ${db.user!.email}');
      var currentUser = users.firstWhere(
        (user) => user['email'] == db.user!.email,
        orElse: () => <String, dynamic>{}, // Default jika tidak ditemukan
      );

      if (currentUser.isNotEmpty) {
        setState(() {
          name = currentUser['fullname'] ?? "fullname available";
          phone = currentUser['phone'] ?? "No phone available";

        });
      } else {
        setState(() {
          name = "User not found";
          phone = "User not found";
        });
      }
    } catch (e) {
      debugPrint('Error: $e');
      setState(() {
        name = "Error fetching name";
        phone = "Error fetching phone";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("images/blank_profil.png"),
                ),
                const SizedBox(height: 5),
                Text(
                  name,
                  style:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text('${db.auth.currentUser?.email}'),
                Text('Tanggal :${DateTime.now().toString().split(' ')[0]}'),
                const SizedBox(height: 16),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: Text('Nama : $name'),
                  subtitle: const Text('Update your display name'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () async {
                    final updatedName = await Navigator.pushNamed(context, '/setnama');
                    if (updatedName!= null && updatedName is String) {
                      setState(() {
                        name = updatedName;
                      });
                    }
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: Text('Phone : $phone'),
                  subtitle: const Text('Update your number phone'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () async{
                    final updatedPhone = await Navigator.pushNamed(context, '/set_tlp');
                    if (updatedPhone!= null && updatedPhone is String) {
                      setState(() {
                        phone = updatedPhone;
                      });
                    }
                  },
                ),
                const Divider(),
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Center(child: Text("Hapus Akun")),
                                content: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                        "Apakah Anda yakin ingin menghapus akun? Tindakan ini tidak dapat dibatalkan.")
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("No"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      deletAcount(context);
                                    },
                                    child: const Text("Ya"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text(
                          'Delete Account',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          // Logout logic
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Logout'),
                              content:
                                  const Text('Are you sure you want to logout?'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Cancel'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Perform logout operation
                                    Navigator.pop(context);
                                    Navigator.pushReplacementNamed(
                                        context, '/login');
                                  },
                                  child: const Text('Logout'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: const Text('Logout',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
