import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Terms and Conditions'),
    ),
    body: SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
    Text(
    'Introduction',
    style: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 16.0),
    Text(
    'These Website Standard Terms and Conditions written on this'
        ' webpage shall manage your use of our website, Webiste Name accessible'
        ' at Website.com.',
    style: TextStyle(
    fontSize: 16.0,
    ),
    ),
    SizedBox(height: 16.0),
    Text(
    'Intellectual Property Rights',
    style: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 16.0),
    Text(
    'Unless otherwise stated, we or our licensors own the intellectual '
        'property rights in the website and material on the website. '
        'Subject to the license below, all these intellectual property '
        'rights are reserved.',
    style: TextStyle(
    fontSize: 16.0,
    ),
    ),
    SizedBox(height: 16.0),
    Text(
    'License to Use Website',
    style: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 16.0),
    Text(
    'You may view, download for caching purposes only, '
        'and print pages from the website for your own personal use, '
        'subject to the restrictions set out below and elsewhere in these terms'
        ' and conditions.',
    style: TextStyle(
    fontSize: 16.0,
    ),
    ),
    SizedBox(height: 16.0),
    Text(
    'Restrictions',
    style: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 16.0),
    Text(
    'You must not:',
    style: TextStyle(
    fontSize: 16.0,
    ),
    ),
    SizedBox(height: 8.0),
    Text(
    '1. Republish material from this website (including republication on another website);',
    style: TextStyle(
    fontSize: 16.0,
    ),
    ),
    SizedBox(height: 8.0),
    Text(
    '2. Sell, rent or sub-license material from the website;',
    style: TextStyle(
    fontSize: 16.0,
    ),
    ),
    SizedBox(height: 8.0),
    Text(
    '3. Show any material from the website in public;',
    style: TextStyle(
    fontSize: 16.0,
    ),
    ),
    SizedBox(height: 8.0),
    Text(
    '4. Reproduce, duplicate, copy or otherwise exploit material on our '
        'website for a commercial purpose;',
    style: TextStyle(
    fontSize: 16.0,
    ),
    ),
    SizedBox(height: 8.0),
    Text(
    '5. Edit or otherwise modify any material on the website; or',
    style: TextStyle(
    fontSize: 16.0,
    ),
    ),
    SizedBox(height: 8.0),
    Text(
    '6. Redistribute material from this website except for content '
        'specifically and expressly made available for redistribution.',
    style: TextStyle(
    fontSize: 16.0,
    ),
    ),
    SizedBox(height: 16.0),
    Text(
    'Variation',
    style: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 16.0),
    Text(
    'We may revise these terms and conditions from time-to-time. '
        'The revised terms and conditions shall apply to the use of our '
        'website from the date of publication of the revised terms and '
        'conditions on our website.',
    style: TextStyle(
    fontSize: 16.0,
    ),
    ),
    SizedBox(height: 16.0),
    Text(
    'Entire Agreement',
    style: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 16.0),
    Text(
    'These terms and conditions, together with our privacy policy, '
        'constitute the entire agreement between you and us in relation to '
        'your use of our website, and supersede all previous agreements in'
        ' respect of your use of this website.',
    style: TextStyle(
    fontSize: 16.0,
    ),
    ),
      ]
    )
    )
    )
    );
    }
}
