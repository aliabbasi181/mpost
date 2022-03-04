import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';
import 'package:mpost/mpost/terms_of_service.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                child: SingleChildScrollView(
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(
                                      Icons.arrow_back_rounded,
                                      size: 25,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Privacy Policy',
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                              TitleWithDesc(
                                  title: "I. Introduction\n\n",
                                  description:
                                      "When you use MPost, you trust us with your personal data. We’re committed to keeping that trust. That starts with helping you understand our privacy practices.\n\nThis privacy policy describes the personal data we collect, how it’s used and shared, and your choices regarding this data. We recommend that you read this along with our privacy overview, which highlights key points about our privacy practices.",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title: "II. Overview\n\nA. Scope\n\n",
                                  description:
                                      "This privacy policy applies to users of MPost services anywhere in the world, including users of MPost apps, websites, features, or other services.\n\nThis privacy policy describes how MPost uses personal data. This private policy applies to all users of our apps, websites, features, or other services anywhere in the world, unless covered by a separate privacy notice.",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title: "B. Data controller and transfer\n\n",
                                  description:
                                      "MPost and Taz Technologies Inc. are the data controllers for the personal data collected in connection with use of MPost services in Kenya.\n\nTaz Technologies Inc. is the data controller for the personal data collected in connection with use of MPost services everywhere else.\n\nMPost operates, and processes personal data, globally. We may also inter-transfer such data between MPost services and Taz Technologies. We do so in order to fulfill our agreements with users, such as our Terms of Use, or based on users’ prior consent, adequacy decisions for the relevant counties within the country, or other transfer mechanisms as may be available under applicable law, such as the Standard Contractual Clauses.",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title:
                                      "III. Data collections and uses\n\nA. The data we collect\n\n",
                                  description:
                                      "MPost collects personal data provided by users to all MPost platforms, such as during account creation and during use of our services, such as location, app usage, and device data from other sources, such as other users or account owners, business partners, vendors, insurance and financial solution providers, and governmental authorities.\n\nThe following personal data is collected by or on behalf of MPost:",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title: "1. Data provided by users.\n\n",
                                  description:
                                      "This includes:\n\na)	User profile: We collect data when users create or update their MPost accounts. This may include their name, email, phone number, login name and password, address, profile picture, payment or banking information (including related payment verification information) and other government identification documents (which may indicate document numbers as well as birth date, gender, and photo). This also includes delivery persons, emergency contact information, and user settings.\n\nb)	Demographic data: We may collect demographic data about users, including through user surveys. We may also receive demographic data about users from third parties. We may also infer demographic data from other data collected from users. For example, where necessary to enable features that allow women to provide or receive services from other women, we may infer gender using their first name. In such cases, we enable users to change their gender if necessary via in-app settings.\n\nc)	User content: We collect the data submitted by users when they contact MPost customer support, provide ratings or compliments for other users, restaurants or merchants, or otherwise contact Taz Technologies. This also includes metadata relating to the method you use to utilize MPost services.\n\nd)	Delivery information: We collect deliveries request information, including the times and dates and delivery locations.  We collect such information when users manually input their information into an MPost delivery request.",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title:
                                      "2. Data created during use of our services.\n\n",
                                  description:
                                      "This includes: \n\na)	Location data (Pick and delivery contact person). MPost collects this data when the MPost platform is running in the foreground (app open and on-screen) or background (app open but not on-screen) of their mobile device. MPost collects such data from the time a delivery is requested until it is finished (and may indicate such collection via an icon or notification on your mobile device depending on your device’s operating system), and any time the app is running in the foreground (app open and on-screen) of their mobile device.\n\nb)	Transaction information: We collect transaction information related to the use of our services, including the type of services requested or provided, order details, payment transaction information (such as a restaurant’s or merchant's name and location and amount of transaction), delivery information, date and time the service was provided, amount charged, distance traveled, and payment method. \n\nc)	Usage data: We collect data about how users interact with our services. This includes data such as access dates and times, app features or pages viewed, app crashes and other system activity, and type of browser. We may also collect data regarding the third-party sites or services used before interacting with our services, which we use for marketing. In some cases, we collect this data through cookies, pixels, tags, and similar tracking technologies that create and maintain unique identifiers. \n\nd)	Device data: We may collect data about the devices used to access our services, including the hardware models, device IP address or other unique device identifiers, operating systems and versions, software, preferred languages, advertising identifiers, device motion data, and mobile network data.",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title: "3. Data from other sources. \n\n",
                                  description:
                                      "These include:\n\na. Users participating in our referral programs. For example, when a user refers to another person, we receive the referred person’s personal data from that user. MPost business partners in connection with debit or credit cards issued by a financial institution in partnership with MPost to the extent disclosed in the terms and conditions for the card.",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title: "B. How we use personal data\n\n",
                                  description:
                                      "MPost uses personal data to enable reliable and convenient transportation, delivery, and other products and services. We also use such data:\n\n*	to enhance the safety and security of our users and services\n*	for customer support  \n*	for research and development  \n*	to enable communications between users \n*	to send marketing and non-marketing communications to users in connection with legal proceedings\n\nMPost does not sell or share user personal data with third parties for their direct marketing, except with user's consent.\n\nWe use personal data we collect:",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title: "1. ",
                                  description:
                                      "To provide our services. MPost uses data to provide, personalize, maintain, and improve our services.\n\nThis includes using data to:\n\nb) Create/Update accounts to enable delivery services (such as using location data to facilitate a pick up or delivery), features that involve data sharing (such as cost splitting, ETA sharing, and ratings and compliments), and accessibility features to facilitate use of our services by those with disabilities.\n\nc) Process payments to track and share the progress of deliveries and offer related services.\nFacilitate insurance, vehicle, invoicing, or financing solutions\n\nMPost performs the above activities, including the collection and use of location data for purposes of these activities, on the grounds that they are necessary to fulfill our obligations to users under our Terms of Use or other agreements with users.",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title: "2. ",
                                  description:
                                      "Safety and security. We use personal data to help maintain the safety, security, and integrity of our services and users. \n\nThis includes:\n\na) Verifying users' identity and eligibility to provide deliveries, including through reviews of background checks, where permitted by law, to help prevent use of our services by unsafe riders.\n\nMPost performs the above activities on the grounds that they are necessary to fulfill our obligations to users under our Terms of Use or other agreements with users, and/or for purposes of the legitimate safety and security interests of MPost or other parties, including users and members of the general public.",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title: "3. ",
                                  description:
                                      "Customer support. MPost uses the information we collect (which may include call recording) to provide customer support, including to investigate and address user concerns and to monitor and improve our customer support responses and processes.\n\nMPost performs the above activities on the grounds that they are necessary to fulfill our obligations to users under our Terms of Use or other agreements with users.",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title: "4. ",
                                  description:
                                      "Research and development. We may use personal data for testing, research, analysis, product development, and machine learning to improve the user experience. This helps us make our services more convenient and easy-to-use, enhance the safety and security of our services, and develop new services and features.\n\nMPost performs the above activities on the grounds that they are necessary to fulfill our obligations to users under our Terms of Use or other agreements with users in improving our existing services and features, or for purposes of MPost’s legitimate interests developing new services and features.",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title: "5. ",
                                  description:
                                      "Enabling communications between users. For example, a rider may message or call a rider to confirm a pickup location, a rider may contact a driver to retrieve a lost item, or a restaurant or delivery person may call a delivery recipient with information about their order.\n\nMPost performs the above activities on the grounds that they are necessary to fulfill our obligations to users under our Terms of Use or other agreements with users.",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title: "6. ",
                                  description:
                                      "Marketing. MPost may use personal data to market our services to our users. This includes sending users communications about MPost services, features, promotions, sweepstakes, studies, surveys, news, updates, and events. We may do so through various methods, including email, text messages, push notifications, in app communications and ads, and ads on third party platforms.\n\nWe may use the data we collect, including in combination with advertising partners’ data, to personalize and improve the marketing communications (including ads) that we send on and off MPost apps and websites, including based on user location, use of MPost services, and user preferences and settings. \n\nWe may also send users communications regarding elections, ballots, referenda, and other political and notice processes that relate to our services. \n\nMPost performs the above activities on the grounds that they are necessary for purposes of MPost legitimate interests in informing users about MPost services and features or those offered by MPost partners, or on the basis of user consent. ",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title: "7. ",
                                  description:
                                      "Non-marketing communications. MPost may use personal data to generate and provide users with receipts; inform them of changes to our terms, services, or policies; or send other communications that aren’t for the purpose of marketing the services or products of MPost or its partners.",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title: "8. ",
                                  description:
                                      "Legal proceedings and requirements. We may use personal data to investigate or address claims or disputes relating to use of MPost services, to satisfy requirements under applicable laws, regulations, or operating licenses or agreements, or pursuant to legal process or governmental request, including from law enforcement.\n\nMPost performs the above activities on the grounds that they are necessary for purposes of MPost legitimate interests in investigating and responding to claims and disputes relating to use of MPost’s services and features, and/or necessary for compliance with applicable legal requirements.",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title: "9. ",
                                  description:
                                      "Automated decision-making\n\nWe use personal data to make automated decisions relating to use of our services. \n\nThis includes:\n\na)	Enabling dynamic pricing, in which the price of a delivery fee for MPost, is determined based on constantly varying factors such as the estimated time and distance, the predicted route, estimated traffic, and the number of riders and drivers using MPost at a given moment.\n\nb)	Using rider data (such as location, rating and gender) and rider data (such as rating, origin and destination) to help avoid pairings of users that may result in increased risk of conflict.\n\nMPost performs the above activities on the grounds that they are necessary to fulfill our obligations to users under our Terms of Use or other agreements with users, or on the grounds that they are necessary for purposes of the legitimate interests of MPost, its users and others.",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title:
                                      "C. Cookies and third-party technologies\n\n",
                                  description:
                                      "MPost and its partners use cookies and other identification technologies on our apps, websites, emails, and online ads for purposes described in this notice, and MPost’s Cookie Notice.\n\nCookies are small text files that are stored on browsers or devices by websites, apps, online media, and advertisements. MPost uses cookies and similar technologies for purposes such as:\n\nWe may also allow others to provide audience measurement and analytics services for us, to serve advertisements on our behalf across the Internet, and to track and report on the performance of those advertisements. These entities may use cookies, web beacons, SDKs, and other technologies to identify the devices used by visitors to our websites, as well as when they visit other online sites and services.\n\nPlease see our Cookie Notice for more information regarding the use of cookies and other technologies described in this section.",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title: "D. Data sharing and disclosure\n\n",
                                  description:
                                      "Some of MPost services and features require that we share personal data with other users or at a user’s request. We may also share such data with our affiliates, subsidiaries, and partners, for legal reasons or in connection with claims or disputes.\n\nMPost may share personal data:",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title: "1. ",
                                  description:
                                      "With other users\n\nThis includes sharing:\n\na)	delivery recipients’ first name, delivery address, and order information with their delivery person and restaurant or merchant. \n\nb) We may also share ratings and feedback, or other information to the extent required by law, with the restaurant partner and delivery person. For rider and delivery persons, we may share data with the rider(s), delivery recipient(s) including compliments and other feedback submitted by past users. \n\nWe also provide riders and delivery recipients with receipts containing information such as a breakdown of amounts charged, driver or delivery person first name, photo, and route map. We also include other information on those receipts if required by law. ",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title: "2. ",
                                  description:
                                      "At the user’s request\n\nThis includes sharing data with:\n\na) Example, if a user requests a service through a partnership or promotional offering made by a third party, MPost may share certain data with those third parties. This may include, for example, other services, platforms, apps, or websites that integrate with our APIs; motorbike suppliers or services; those with an API or service with which we integrate; or restaurants, merchants or other MPost business partners and their users in connection with promotions, contests, or specialized services.\n\nb) Emergency services: We offer features that enable users to share their data with police, fire, and ambulance services in the event of an emergency or after certain incidents. ",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title: "3. ",
                                  description:
                                      "With the MPost account owner\n\nIf a user requests a delivery using an account owned by another party, we may share their information, including location data, with the owner of that account. ",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title: "4. ",
                                  description:
                                      "With MPost subsidiaries and affiliates\n\nWe share personal data with our subsidiaries and affiliates to help us provide our services or conduct data processing on our behalf. ",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title: "5. ",
                                  description:
                                      "With MPost service providers and business partners\n\nMPost provides personal data to vendors, consultants, marketing partners, research firms, and other service providers or business partners. \n\nThese include:\n\na)	Payment processors and facilitators\nb)	Background check and identity verification providers\nc)	Cloud storage providers\nd)	Google, in connection with the use of Google Maps in MPost’s apps (see Google’s privacy policy for information on their collection and use of data)\ne)	Social media companies, including Facebook and TikTok, in connection with MPost’s use of their tools in MPost’s apps and websites (see Facebook’s and TikTok’s privacy policies for information on their collection and use of data)\nf)	Marketing partners and marketing platform providers, including social media advertising services, advertising networks, third-party data providers, and other service providers to reach or better understand our users and measure advertising effectiveness research partners, including those performing surveys or research projects in partnership with MPost  or on MPost  behalf.",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title: "6. ",
                                  description:
                                      "For legal reasons or in the event of a dispute\n\nMPost may share users’ personal data if we believe it’s required by applicable law, regulation, operating license or agreement, legal process or governmental request, or where the disclosure is otherwise appropriate due to safety or similar concerns.\n\nThis includes sharing personal data with law enforcement officials, public health officials, other government authorities, airports (if required by the airport authorities as a condition of operating on airport property), or other third parties as necessary to enforce our Terms of Service, user agreements, or other policies; to protect MPost’s rights or property or the rights, safety, or property of others; or in the event of a claim or dispute relating to the use of our services. In the event of a dispute relating to use of another person’s credit card, we may be required by law to share your personal data, including trip or order information, with the owner of that credit card.\n\nThis also includes sharing personal data with others in connection with, or during negotiations of, any merger, sale of company assets, consolidation or restructuring, financing, or acquisition of all or a portion of our business by or into another company.",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title: "7. ",
                                  description:
                                      "With consent\n\nMPost may share a user’s personal data other than as described in this notice if we notify the user and they consent to the sharing.",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title: "E. Data retention and deletion\n\n",
                                  description:
                                      " MPost retains user data for as long as necessary for the purposes described above.\n\nUsers may request deletion of their accounts at any time. MPost may retain user data after a deletion request due to legal or regulatory requirements or for reasons stated in this policy.\n\nFollowing an account deletion request, MPost deletes the user’s account and data, unless they must be retained due to legal or regulatory requirements, for purposes of safety, security, and fraud prevention, or because of an issue relating to the user’s account such as an outstanding credit or an unresolved claim or dispute. ",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title: "IV. Choice and transparency\n\n",
                                  description:
                                      "MPost  enables users to access and/or control data that MPost collects, including through: \n\n1)	privacy settings\n2)	device permissions\n3)	in-app ratings pages\n4)	marketing choices \n\nMPost also enables users to request access to or copies of their data, changes or updates to their accounts, or deletion of their accounts, or that MPost restricts its processing of user personal data.",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title: "V. Notifications.\n\n",
                                  description:
                                      "account and updates\n\nMPost provides users with notifications and updates related to activity on their account. These notifications are a necessary part of using the MPost app and cannot be disabled. ",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title: "VI. Device permissions\n\n",
                                  description:
                                      "Most mobile device platforms (iOS, Android, etc.) have defined certain types of device data that apps cannot access without the device owner’s permission, and these platforms have different methods for how that permission can be obtained. Please check the available settings on your device or check with your provider.",
                                  italicTitle: false),
                              TitleWithDesc(
                                  title:
                                      "VII. Updates to this privacy policy\n\n",
                                  description:
                                      "We may occasionally update this policy. If we make significant changes, we will notify users in advance of the changes through the MPost apps or through other means, such as email. We encourage users to periodically review this notice for the latest information on our privacy practices.\n\nUse of our services after an update constitutes consent to the updated notice to the extent permitted by law.",
                                  italicTitle: false),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
