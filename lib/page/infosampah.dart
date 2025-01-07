// ignore: file_names
import 'package:flutter/material.dart';

class InfoSampah extends StatelessWidget {
  const InfoSampah({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sampah dan EcoSmart",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: ListView(
        children: [
          
          Container(
            margin: const EdgeInsets.all(15),
            child: const Text("Sampah adalah hasil sampingan dari aktivitas manusia yang tidak lagi memiliki kegunaan dan dibuang begitu saja. Sampah terbagi menjadi dua jenis utama, yaitu sampah organik dan sampah anorganik. Sampah organik berasal dari bahan alami yang mudah terurai, seperti sisa makanan dan daun, sedangkan sampah anorganik terdiri dari bahan-bahan yang tidak mudah terurai dan bisa mencemari lingkungan, seperti plastik, logam, karet, dan kain."),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: const Text(
              "Mengapa Pengelolaan Sampah Anorganik itu Penting?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const Image(
            image: AssetImage("images/sampahA.jpg")
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: const Text("Sampah anorganik seringkali sulit terurai di alam dan dapat bertahan dalam lingkungan selama bertahun-tahun, bahkan ratusan tahun. Hal ini mengakibatkan pencemaran yang berdampak pada ekosistem dan kesehatan manusia. Plastik, misalnya, tidak hanya mencemari tanah dan air, tetapi juga mengancam kehidupan satwa liar yang dapat terperangkap atau menelan plastik. Demikian pula dengan logam berat atau bahan kimia yang terkandung dalam sampah logam atau karet, yang dapat mencemari tanah dan sumber air. Karena dampaknya yang besar terhadap lingkungan, penting bagi kita untuk mengelola sampah anorganik dengan baik melalui pemisahan, daur ulang, dan pengurangan penggunaan bahan-bahan sekali pakai."),
          ),
         
          Container(
            margin: const EdgeInsets.all(15),
            child: const Text(
              "Aplikasi untuk Mengumpulkan Sampah Anorganik",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          
          Container(
             margin: const EdgeInsets.all(15),
            child: const Text("EcoSmart dirancang untuk menghubungkan konsumen langsung dengan pengepul atau pengelola sampah anorganik dengan tujuan untuk mendaur ulang sampah tersebut secara efisien dan ramah lingkungan. Melalui aplikasi ini, pengguna dapat mengumpulkan, mengidentifikasi, dan menyerahkan sampah anorganik mereka langsung kepada pihak yang memiliki fasilitas untuk mendaur ulangnya, tanpa harus khawatir tentang pencemaran atau pembuangan yang tidak tepat. Ada beberapa jenis sampah anorganik yang dapat disetorkan atau dijual melalui aplikasi ini yaitu diantaranya :"),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: const Text(
              "1. Sampah Plastik",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              )
            ),
          ),
           Container(
            margin: const EdgeInsets.all(15),
            child: const Text("Sampah plastik adalah limbah yang berasal dari produk berbahan dasar plastik, seperti botol, kantong belanja, sedotan, dan kemasan makanan. Plastik bersifat ringan, fleksibel, dan tahan lama, tetapi sulit terurai secara alami. Sampah plastik dapat mencemari tanah, air, dan udara, serta berbahaya bagi ekosistem, terutama hewan laut yang sering tertelan plastik. Selain itu, pembakaran plastik menghasilkan polusi udara berbahaya karena melepaskan zat kimia toksik seperti dioksin. Plastik membutuhkan waktu ratusan hingga ribuan tahun untuk terurai, sehingga pengelolaannya harus dilakukan dengan daur ulang atau pengurangan penggunaan plastik sekali pakai."),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: const Text(
              "2. Sampah Logam",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              )
            ),
          ),
           Container(
            margin: const EdgeInsets.all(15),
            child: const Text("Sampah logam adalah limbah yang berasal dari produk berbahan dasar logam, seperti kaleng, besi tua, dan aluminium. Logam bersifat kuat dan tahan lama, tetapi tidak mudah terurai di lingkungan. Sampah logam yang tidak dikelola dengan baik dapat mencemari tanah dan air karena adanya korosi yang melepaskan zat beracun, seperti timbal dan merkuri. Namun, logam memiliki nilai ekonomi tinggi karena dapat didaur ulang menjadi produk baru. Daur ulang logam mengurangi eksploitasi sumber daya alam dan konsumsi energi dalam proses produksi logam baru."),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: const Text(
              "3. Sampah Kain",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              )
            ),
          ),
           Container(
            margin: const EdgeInsets.all(15),
            child: const Text("Sampah kain adalah limbah yang berasal dari produk tekstil, seperti pakaian bekas, karpet, atau kain perca. Sampah kain sering kali terbuat dari serat alami seperti katun atau wol, maupun serat sintetis seperti poliester. Kain sintetis sulit terurai secara alami dan dapat mencemari lingkungan jika dibuang sembarangan. Pembuangan sampah kain dalam jumlah besar, terutama dari industri fesyen, berkontribusi pada peningkatan volume sampah global. Pengelolaan sampah kain melibatkan daur ulang tekstil untuk menghasilkan produk baru, seperti kain daur ulang atau isolasi bangunan, serta mendukung konsep fesyen berkelanjutan."),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: const Text(
              "4. Sampah Karet",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              )
            ),
          ),
           Container(
            margin: const EdgeInsets.all(15),
            child: const Text("Sampah karet berasal dari produk berbahan dasar karet alami atau sintetis, seperti ban, sepatu, dan peralatan rumah tangga. Karet sulit terurai secara alami karena sifatnya yang elastis dan tahan lama. Sampah karet yang dibuang sembarangan dapat mencemari lingkungan dan menjadi tempat berkembang biaknya serangga berbahaya, seperti nyamuk. Beberapa jenis karet sintetis juga mengandung bahan kimia berbahaya yang dapat mencemari tanah. Pengelolaan sampah karet meliputi daur ulang, seperti mengubah ban bekas menjadi bahan bakar alternatif atau produk lain seperti alas jalan."),
          ),
         
        ],
      )
    );
  }
}
