import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      "pk_test_51LCMV7GXGWUd9WFl8RS29bMoqxxz4NiU55kjmNtUEF2STjcaY9HKyg9HpuQQJn8vQxe5h8Lr2TfjfCbow4GhMfcY00l7xb07h4";
  await Stripe.instance.applySettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stripe Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const PaymentPage(),
    );
  }
}

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Future<void> initPaymentSheet(context,
    //     {required String email, required int amount}) async {
    //   try {
    //     // 1. create payment intent on the server
    //     final response = await http.post(
    //         Uri.parse(
    //             'https://us-central1-stripe-checkout-flutter.cloudfunctions.net/stripePaymentIntentRequest'),
    //         body: {
    //           'email': email,
    //           'amount': amount.toString(),
    //         });

    //     final jsonResponse = jsonDecode(response.body);
    //     log(jsonResponse.toString());

    //     //2. initialize the payment sheet
    //     await Stripe.instance.initPaymentSheet(
    //       paymentSheetParameters: SetupPaymentSheetParameters(
    //         paymentIntentClientSecret: jsonResponse['paymentIntent'],
    //         merchantDisplayName: 'Flutter Stripe Store Demo',
    //         customerId: jsonResponse['customer'],
    //         customerEphemeralKeySecret: jsonResponse['ephemeralKey'],
    //         style: ThemeMode.light,
    //         testEnv: true,
    //         merchantCountryCode: 'SG',
    //       ),
    //     );

    //     await Stripe.instance.presentPaymentSheet();

    //     ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(content: Text('Payment completed!')),
    //     );
    //   } catch (e) {
    //     if (e is StripeException) {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(
    //           content: Text('Error from Stripe: ${e.error.localizedMessage}'),
    //         ),
    //       );
    //     } else {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(content: Text('Error: $e')),
    //       );
    //     }
    //   }
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Stripe Demo App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () async {
                // await initPaymentSheet(context,
                //     email: "example@gmail.com", amount: 200000);
              },
              child: const Text(
                'Buy Laptop for 2000 USD',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
