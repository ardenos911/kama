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
                          fontSize: 20.0,
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
                          fontSize: 19.0,
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
                          fontSize: 19.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Unless otherwise stated, we or our licensors own the intellectual '
                        'property rights in the App and ALL material within Kama app. '
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
                        'Granted License to Use Kama App',
                        style: TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Kama app grants you a personal, worldwide, royalty-free, non-assignable,non-exclusive, revocable, and non-sublicensable '
                        'license to access and use the Service. This license is for the sole purpose of letting you use and enjoy Kama App\'s benefits as '
                        'intended by Kama app and permitted by this Agreement. This license and any authorization to access the '
                        'Service are automatically revoked in the event that you do any of the following:'
                        'use the Service or any content contained in the Service for any commercial purposes without our written'
                        'consent, copy, modify, transmit, create any derivative works from, make use of, or reproduce'
                        'in any way, any copyrighted material, images, trademarks, trade names, service marks, or other intellectual property,'
                        'content or proprietary information accessible through the Service without Kama app’s'
                        'prior written consent,expressed permission or imply that any statements'
                        'you make are endorsed by Kama app. Use any robot, bot, spider, crawler, scraper, site search'
                        'retrieval application, or other manual or automatic device, method or process to access, retrieve, index,'
                        'data mine, or in any way reproduce or circumvent the navigational structure or presentation of the Service or its contents.'
                        'use the Service in any way that could interfere with, disrupt or negatively affect the Service provided by Kama App, or the servers or networks connected to the Service.'
                        'upload viruses or other malicious code or otherwise compromise the security of the Service.'
                        'forge headers or otherwise manipulate identifiers in order to disguise the origin of any information transmitted to or through the Service.'
                        'frame or mirror any part of the Service without Kama apps prior written authorization.'
                        'use meta tags or code or other devices containing any reference to Kama app'
                        'or the Service (or any trademark, trade name, service mark, logo or slogan of Kama app) to'
                        ' direct any person to any other website for any purpose. modify, adapt, sublicense, translate, sell, reverse engineer,'
                        'decipher, decompile or otherwise disassemble any portion of the Service, or cause others to do so.'
                        'use or develop any third party applications that interact with Kama App or other'
                        'members’ Content or information without our written consent. Use, access, or publish'
                        'the Kama app application programming interface without our written consent. Probe, scan or'
                        'test the vulnerability of our Service or any system or network without prior written consent from Kama App.'
                        'Encourage, promote, or agree to engage in any activity that violates this Agreement.Kama app may investigate and take any available legal action in'
                        'response to illegal and / or unauthorized uses of the Services we provide,'
                        ' including termination of your account. Any software that we provide you may automatically download and'
                        'install upgrades, updates, or other new features. You may be able to adjust these'
                        'automatic downloads through your device\'s settings.',
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
                        '1. Republish material from Kama App (including republication on another website);',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Arial Narrow',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '2. Sell, rent or sub-license material from Kama App;',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Arial Narrow',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '3. Show any material from Kama App in public without our expressed consent;',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Arial Narrow',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '4. Reproduce, duplicate, copy or otherwise exploit material on our'
                        'App for a commercial purpose;',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Arial Narrow',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '5. Edit or otherwise modify any material on the App; or',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Arial Narrow',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '6. Redistribute material from Kama App, except for content'
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
                        'App from the date of publication of the revised terms and '
                        'conditions on our App.',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Arial Narrow',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Community Guidelines/Rules',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'By using the Service, you agree that you will not:  '
                        '(1).use the Service for any purpose that is illegal or prohibited by this Agreement '
                        '(2).use the Service for any harmful or nefarious purpose. '
                        '(3).use the Service in such a way as to damage Kama App or it\'s reputation '
                        '(4).Violate any of the aforementioned Community guidelines expressed herein '
                        '(5).spam or solicit money or other items of value from another member, whether as a gift, loan, or other form of compensation, or otherwise defraud any other user of Kama App. '
                        '(6).impersonate any person or entity or post any images of another person without his or her permission '
                        '(7).bully, “stalk,” intimidate, assault, harass, mistreat or defame, or otherwise mistreat any person '
                        '(8).post any Content that violates or infringes anyone’s rights, including rights of publicity, privacy, copyright, trademark or other intellectual property or contract right '
                        '(9).post any Content that is hate speech, threatening, sexually explicit or pornographic; incites violence; or contains nudity or graphic or excessive violence '
                        '(10).post any Content that promotes racism, bigotry, hatred or physical harm of any kind against any group, race, political organization or individual '
                        '(11).use another person\'s account, share an account with another user, or maintain multiple accounts at any given time '
                        '(12).misrepresent your identity, age, current or previous professional positions, qualifications, or affiliations with a person or regulated entity '
                        '(13).create another account if any previous account owned by you has been terminated, unless you have our expressed consent ',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Arial Narrow',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Privacy Policy',
                        style: TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'With Kama, your privacy is very important to us. Your privacy is at the core of the way'
                        'we design and build our services and products,'
                        'so that you can fully trust them and focus on building meaningful connections or relationships..',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Arial Narrow',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Privacy application & information we may collect',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'In order to forge any sort of connection with another person, we need '
                        'to collect some information about you, '
                        'such as basic profile and demographic details and the types of people you’d like to'
                        'connect with. We also collect information about your use of our services '
                        'such as access logs, as well as information from third parties,'
                        'like when you access our services through your social media account. Additional '
                        'information you provide us when accessing our services include but are not limited to the following: '
                        '(1) your phone number and email address, as well as some basic details necessary for the service to work, such as your gender, date of birth, and who you’d like to connect with'
                        '(2) your sexual orientation with us. Where you provide such info  to us, '
                        'you consent Kama App to using it for the purposes identified and as laid out in '
                        'this Privacy Policy. You can also share additional information with us, '
                        'such as details on your bio and your interests, as well as content such as '
                        'photos and videos. To add certain content, like pictures or videos, you may '
                        'allow us to access naitive device features such as your camera or photo album.',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Arial Narrow',
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 16.0),
                    ]))));
  }
}
