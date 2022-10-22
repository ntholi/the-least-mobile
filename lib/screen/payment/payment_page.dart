import 'package:flutter/material.dart';

enum PaymentType {
  mpesa("M-Pesa"),
  card("Card"),
  paypal("PayPal");

  const PaymentType(this.text);
  final String text;
}

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PaymentType? paymentType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Pay With:",
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectionButton(
                      paymentType: PaymentType.mpesa,
                      icon: "new.png",
                      selected: paymentType == PaymentType.mpesa,
                      setPaymentType: (value) {
                        setState(() {
                          paymentType = paymentType != value ? value : null;
                        });
                      },
                    ),
                    SelectionButton(
                      paymentType: PaymentType.card,
                      icon: "new.png",
                      selected: paymentType == PaymentType.card,
                      setPaymentType: (value) {
                        setState(() {
                          paymentType = paymentType != value ? value : null;
                        });
                      },
                    ),
                    SelectionButton(
                      paymentType: PaymentType.paypal,
                      icon: "new.png",
                      selected: paymentType == PaymentType.paypal,
                      setPaymentType: (value) {
                        setState(() {
                          paymentType = paymentType != value ? value : null;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectionButton extends StatelessWidget {
  final PaymentType paymentType;
  final String icon;
  final bool selected;
  final ValueSetter setPaymentType;
  const SelectionButton({
    Key? key,
    required this.paymentType,
    required this.icon,
    required this.setPaymentType,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setPaymentType(paymentType);
      },
      child: Container(
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width / 1.2,
        decoration: BoxDecoration(
          border: Border.all(
            color: selected ? Colors.green.shade400 : Colors.grey.shade300,
          ),
          color: selected ? Colors.green.shade50 : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset('assets/images/$icon', height: 20),
            const SizedBox(width: 10),
            Text(
              paymentType.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade700,
              ),
            ),
            const Expanded(
              child: Spacer(),
            ),
            selected ? const Icon(Icons.check) : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
