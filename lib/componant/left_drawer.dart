import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({
    Key ? key,
    this.size,
  }) : super(key: key);

  final double ? size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: size,
        color: const Color(0xFF2C3C56),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              color: Color(0xFF223047),
              child: Text('CORE UI'.tr),
            ),
            _tile('Dashboard'.tr),
            Container(
                padding: const EdgeInsets.only(left: 10),
                margin: const EdgeInsets.only(top: 30),
                child: Text('THEME'.tr,
                    style: TextStyle(
                      color: Colors.white54,
                    ))),
            _tile('Colors'.tr),
            _tile('ContactUs'.tr),
            _tile('Base'.tr),
            _tile('Buttons'.tr),
          ],
        ),
      ),
    );
  }

  Widget _tile(String label) {
    return ListTile(
      title: Text(label),
      onTap: () {},
    );
  }
}