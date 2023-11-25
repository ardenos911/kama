import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          elevation: 6,
          title: const Text(
            'Privacy Policy/Terms and Conditions',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Introduction',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'This Kama App\'s Standard Terms and Conditions written on this'
                        'page shall manage your use of our App..By creating a Kama account '
                        'or by using any Kama service, whether through a mobile device, '
                        'mobile application or computer (collectively, the “Service”) you'
                        ' agree to be bound by (i) these Terms of Use, (ii) our Privacy Policy, '
                        'Cookie Policy, Safety Tips, and Community Guidelines, each of which '
                        'is incorporated by reference into this Agreement, and (iii) any terms '
                        'disclosed to you if you purchase or have purchased additional features, '
                        'products or services that we offer on the Service (collectively, this “Agreement”).'
                        'If you do not accept and agree to be bound by all of the terms of this Agreement, '
                        'you should not access or utilize the Services we provide.',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Arial Narrow',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Eligibility',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'You must be at least 18 years of age to create an account on Kama App and '
                        'use the Service. By creating an account and using the Service, you '
                        'represent and warrant that:'
                        'you can form a legal and binding contract with Kama, you are not a person '
                        'who is barred from using the Service under the laws of the United '
                        'States or any other applicable jurisdiction (for example, you do'
                        ' not appear on the U.S. Treasury Departments list of Specially Designated Nationals or face any other similar prohibition),'
                        'you will comply with this Agreement and all applicable local, state, '
                        'national and international laws, rules and regulations, including without limitation,'
                        'privacy laws, intellectual property laws, anti-spam laws, and regulatory'
                        'requirements, you have not committed, been convicted of, or pled no contest to'
                        'a felony, a sex crime, or any crime involving violence or a threat of violence, '
                        'unless you have received clemency for a non-violent crime and we have determined '
                        'that you are not likely to pose a threat to other users of our Service, and that you'
                        'are not required to register as a sex offender with any state, federal or local '
                        'sex offender registry, you will use the latest version of our Services'
                        '(via app), you do not have more than one account on the Service,'
                        'and you have not previously been removed or barred from the Service by us, unless you have '
                        'our express written permission to create a new or additional account.If at any time you cease '
                        'to meet these requirements, all permissions/authorizations to access our Service or systems is automatically revoked, and you must immediately delete your account.',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Arial Narrow',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Intellectual Property Rights',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Unless otherwise stated, we or our licensors own the intellectual '
                        'property rights in the website and material on the website. '
                        'Subject to the license below, all these intellectual property '
                        'rights are reserved.',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Arial Narrow',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'License to Use Website',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'You may view, download for caching purposes only, '
                        'and print pages from the website for your own personal use, '
                        'subject to the restrictions set out below and elsewhere in these terms'
                        ' and conditions.',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Arial Narrow',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Restrictions',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'You must not:',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Arial Narrow',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '1. Republish material from this website (including republication on another website);',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Arial Narrow',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '2. Sell, rent or sub-license material from the website;',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Arial Narrow',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '3. Show any material from the website in public;',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Arial Narrow',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '4. Reproduce, duplicate, copy or otherwise exploit material on our '
                        'website for a commercial purpose;',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Arial Narrow',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '5. Edit or otherwise modify any material on the website; or',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Arial Narrow',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '6. Redistribute material from this website except for content '
                        'specifically and expressly made available for redistribution.',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Arial Narrow',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Variation',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'We may revise these terms and conditions from time-to-time. '
                        'The revised terms and conditions shall apply to the use of our '
                        'website from the date of publication of the revised terms and '
                        'conditions on our website.',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Arial Narrow',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Entire Agreement',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'These terms and conditions, together with our privacy policy, '
                        'constitute the entire agreement between you and us in relation to '
                        'your use of our website, and supersede all previous agreements in'
                        ' respect of your use of this website.',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Arial Narrow',
                          fontSize: 14.0,
                        ),
                      ),
                    ]))));
  }
}
