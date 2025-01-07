import 'package:flutter/material.dart';
import 'package:flutter_midtrans_example/models/token_model.dart';
import '../models/database.dart';
import '../models/jemput_model.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:midtrans_sdk/midtrans_sdk.dart';

class Jemput extends StatefulWidget {
  const Jemput({super.key});

  @override
  State<Jemput> createState() => JemputState();
}

class JemputState extends State<Jemput> {
  late final MidtransSDK? _midtrans;
  User? user = FirebaseAuth.instance.currentUser;
  final TokenModel token = TokenModel();

  final uuid = const Uuid();
  final Database db = Database();
  final Jemputmodel jemput = Jemputmodel();
  final TextEditingController namaPengguna = TextEditingController();
  final List<String> kategoriSampah = ['anorganik', 'organik', 'lainnya'];
  final TextEditingController dateController = TextEditingController();
  final TextEditingController alamatControler = TextEditingController();
  final TextEditingController catatanController = TextEditingController();
  final TextEditingController beratController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();

  String? selectedKategori;

  void _showResultDialog() {
    String nama = namaPengguna.text;
    String kategori = selectedKategori ?? 'Belum dipilih';
    String berat = beratController.text;
    String harga = hargaController.text;
    String tanggal = dateController.text;
    String alamat = alamatControler.text;
    String catatan = catatanController.text;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text("Hasil Input")),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Nama: $nama"),
              Text("Kategori Sampah: $kategori"),
              Text("Berat: $berat kg"),
              Text("Harga: Rp. $harga"),
              Text("Tanggal Penjemputan: $tanggal"),
              Text("Alamat: $alamat"),
              if (catatan.isNotEmpty) Text("Catatan: $catatan"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () async {
                var docId = uuid.v4();
                db.addDataWithDoc('jemput_sampah', docId, {
                  'nama': nama,
                  'email': db.auth.currentUser?.email,
                  'kategori': kategori,
                  'berat': berat,
                  'harga': harga,
                  'tanggal': tanggal,
                  'alamat': alamat,
                  'catatan': catatan,
                });
                await jemput.addDataJemput({
                  'order_id': docId,
                  'nama': nama,
                  'alamat': alamat,
                  'harga': harga,
                  'kategori': kategori,
                  'berat': berat,
                  'catatan': catatan,
                  'tanggal': dateController.text,
                });
                var tokenize = await token.getToken(docId);
                _midtrans?.startPaymentUiFlow(
                  token: tokenize,
                );
                Navigator.pushNamed(context, '/home');
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    beratController.addListener(_updateHarga);
    _initSDK();
  }

  void _initSDK() async {
    _midtrans = await MidtransSDK.init(
      config: MidtransConfig(
        clientKey: "SB-Mid-client-N_skrmEA9857Z8cj",
        merchantBaseUrl:
            "https://boss-supreme-peacock.ngrok-free.app/ecosmartapi/",
        colorTheme: ColorTheme(
          colorPrimary: Colors.blue,
          colorPrimaryDark: Colors.blue,
          colorSecondary: Colors.blue,
        ),
      ),
    );
    _midtrans?.setUIKitCustomSetting(
      skipCustomerDetailsPages: true,
    );
    _midtrans!.setTransactionFinishedCallback((result) {
      _showToast('Transaction Completed', false);
    });
  }

  void _showToast(String msg, bool isError) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: isError ? Colors.red : Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  void dispose() {
    beratController.dispose();
    hargaController.dispose();
    _midtrans?.removeTransactionFinishedCallback();
    super.dispose();
  }

  void _updateHarga() {
    try {
      final berat = double.tryParse(beratController.text) ?? 0;
      int hargaPerKg;

      switch (selectedKategori) {
        case 'anorganik':
        case 'organik':
          hargaPerKg = 1500;
          break;
        case 'lainnya':
        default:
          hargaPerKg = 2500;
          break;
      }

      final harga = berat * hargaPerKg;
      hargaController.text = harga.toStringAsFixed(0);
    } catch (e) {
      hargaController.text = "0";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          "Jemput Sampah",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.teal.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.info, color: Colors.teal),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Mohon isi data di bawah ini dengan benar",
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: namaPengguna,
                  decoration: InputDecoration(
                    labelText: "Nama Pengguna",
                    hintText: "Masukkan Nama Lengkap",
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Jenis Sampah",
                    prefixIcon: const Icon(Icons.category),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  value: selectedKategori,
                  items: kategoriSampah.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedKategori = newValue;
                      _updateHarga();
                    });
                  },
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: beratController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Berat (kg)',
                          prefixIcon: const Icon(Icons.fitness_center),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: hargaController,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'Harga (Rp)',
                          prefixIcon: const Icon(Icons.monetization_on),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: dateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Tanggal Penjemputan",
                    prefixIcon: const Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      dateController.text =
                          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                    }
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: alamatControler,
                  decoration: InputDecoration(
                    labelText: "Alamat Penjemputan",
                    hintText: "Masukkan Alamat Lengkap",
                    prefixIcon: const Icon(Icons.location_on),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: catatanController,
                  decoration: InputDecoration(
                    labelText: "Catatan (Opsional)",
                    hintText: "Masukkan Catatan (jika ada)",
                    prefixIcon: const Icon(Icons.note),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (namaPengguna.text.isEmpty ||
                          selectedKategori == null ||
                          beratController.text.isEmpty ||
                          dateController.text.isEmpty ||
                          alamatControler.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Mohon lengkapi semua data yang diperlukan!",
                            ),
                          ),
                        );
                      } else {
                        _showResultDialog();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 50,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Kirim",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
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
