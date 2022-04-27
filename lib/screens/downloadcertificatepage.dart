import 'package:flutter/material.dart';

class DownloadCertificatePage extends StatefulWidget {
  const DownloadCertificatePage({Key? key}) : super(key: key);

  @override
  State<DownloadCertificatePage> createState() =>
      _DownloadCertificatePageState();
}

class _DownloadCertificatePageState extends State<DownloadCertificatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Download Certificate'),
        centerTitle: true,
      ),
    );
  }
}
