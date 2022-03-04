import 'package:flutter/material.dart';
import 'package:mpost/constants.dart';

class TermsOfService extends StatefulWidget {
  const TermsOfService({Key? key}) : super(key: key);

  @override
  _TermsOfServiceState createState() => _TermsOfServiceState();
}

class _TermsOfServiceState extends State<TermsOfService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                  'Terms of Service',
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                TitleWithDesc(
                    title: "Last updated: December 03, 2021\n\n",
                    description:
                        "The following Terms and Conditions (the “Terms”) govern your access and/or use of any of the freight-related applications, websites, content, products, software and services (the “Services”) made available by the MPost Tap A Delivery Group of Companies, and its representatives, affiliates, officers and directors (collectively “MPost Tap A Delivery”). \n\nPLEASE READ THESE TERMS CAREFULLY AS THEY CONTAIN IMPORTANT INFORMATION. BY ENTERING THIS AGREEMENT, YOU EXPRESSLY ACKNOWLEDGE THAT YOU HAVE READ AND YOU UNDERSTAND ALL OF THE TERMS AND HAVE TAKEN TIME TO CONSIDER THE CONSEQUENCES. \n\nIn these Terms, the words \"including\" and \"include\" mean \"including, but not limited to.\" \n\nUse of the Services is conditioned on your agreement to all of the Terms contained herein, the Freight Shipper Agreement, and the policies and terms linked to or otherwise referenced herein (collectively, the “Agreement”). By accessing, using or receiving any Services made available by MPost Tap A Delivery, you expressly acknowledge and confirm your agreement to be bound by the Agreement \n\nIf you do not agree to these Terms, you may not access or use the Services. MPost Tap A Delivery may cease offering or deny access to the Services or any portion thereof, to you at any time for any reason. \n\nMPost Tap A Delivery reserves the right to amend the Terms and or MPost Tap A Delivery policies relating to the Services at any time, without notice to you. Any such amendment will be effective upon posting of the updated Terms on the Services, and you are solely responsible for regularly reviewing the same. Your continued access or use of the Services after any such changes shall constitute your agreement to be bound by such Terms as amended. \n\nPlease refer to our Privacy Policy located at https://www.mpost.co.ke/privacy or information about how we collect, use and disclose personal information in connection with the Services ",
                    italicTitle: true),
                TitleWithDesc(
                    title: "The Services\n",
                    description:
                        "The Services provided by MPost Tap A Delivery enable a shipper registered on the Services (“Shipper”) to connect with a directory of transporters for the transportation of cargo (“Shipment”) subject to terms agreed to between the Shipper and a transporter registered on the Services (“Transporter”).\n\nYOU HEREBY ACKNOWLEDGE THAT YOUR ABILITY TO OBTAIN TRANSPORT SERVICES THROUGH THE USE OF THE SERVICES DOES NOT ESTABLISH MPOST TAP A DELIVERY AS A PROVIDER OF TRANSPORT OR LOGISTICS SERVICES. MPOST TAP A DELIVERY HAS NO RESPONSIBILITY OR LIABILITY FOR ANY TRANSPORTATION OR LOGISTICS SERVICES PROVIDED TO ANY SHIPPER OR ANY OTHER PARTY USING THE SERVICES. \n\nUnless otherwise agreed by MPost Tap A Delivery in a separate written agreement with you, the Services are made available solely for your personal non-commercial use.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "Description of Services",
                    description: "",
                    italicTitle: false),
                TitleWithDesc(
                    title: "Account",
                    description:
                        "\nIn order to use certain features of the Services, you must register for an account with MPost Tap A Delivery (“Account”) and provide certain information as prompted by the applicable registration form. You represent and warrant that: (a) all required registration information you submit is truthful and accurate; and (b) you will maintain the accuracy of such information. You may delete your Account at any time by following the instructions on the Services. You are responsible for maintaining the confidentiality of your Account login credentials and agree to immediately notify MPost Tap A Delivery of any unauthorized use, or suspected unauthorized use of your Account or any other breach of security. You may not authorize others to use your user status, and you may not assign or otherwise transfer your user account to any other person or entity. MPost Tap A Delivery is not liable for any loss or damage arising from your failure to comply with the above requirements.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "Shipment terms",
                    description:
                        "\nShipment terms will be negotiated and agreed between you and the Transporter, independently of the Services. MPost Tap A Delivery is not responsible, and will bear no liability, for any Shipment terms entered into between you and any Transporter. By using the Services you hereby acknowledge and agree to the same.\n\nMPost Tap A Delivery does not guarantee that a Shipment will be accepted by any Transporter. Further, MPost Tap A Delivery will not guarantee, nor in any way bear responsibility, for the actions and/or omissions of Transporters or their drivers in undertaking delivery.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "Shipping documents",
                    description:
                        "\nYou shall not insert “MPost Tap A Delivery” on any receipt, bill of lading, manifest, or other shipping document. Transporters are instructed not to name MPost Tap A Delivery as either a shipper or consignee on any bill of lading. If you do so, such insertion shall be deemed to be due to your oversight, and shall not operate to alter the Transporter’s status as the responsible service provider. The provisions set forth in any shipping document shall not supersede, alter, or modify these Terms or add any liability or responsibility to MPost Tap A Delivery.\n\nOnce a Shipment is completed, the Transporter will be instructed to avail/ upload to the Services a proof of delivery document signed by the authorized recipient, prior to payment. You will have the option to waive this requirement. If you opt to waive this requirement, you hereby undertake to pay full fees in relation to the relevant Shipment without any objection on any ground relating to incomplete or improper delivery.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "License Grant & Restrictions",
                    description:
                        "\nSubject to your compliance with these Terms, MPost Tap A Delivery hereby grants you a non‐exclusive, non‐transferable, revocable right to (a) access and use its applications and related services (the “Applications”) solely in connection with your use of the Services; and (b) access and use of any content, information and related materials that may be made available through the Services solely for your personal, non-commercial use. All rights not expressly granted to you are reserved by MPost Tap A Delivery and its licensors.\n\nYou hereby agree NOT to:\n\na.	License, sublicense, sell, resell, transfer, assign, distribute or otherwise commercially exploit or make available to any third party the Services;\nb.	Remove any copyright, trademark or other proprietary notices from any portion of the Services;\nc.	Reproduce, modify, prepare derivative works based upon, distribute, license, lease, sell, resell, transfer, publicly display, publicly perform, transmit, stream, broadcast or otherwise exploit the Services except as expressly permitted by MPost Tap A Delivery\nd.	Attempt to gain unauthorized access to or impair any aspect of the Services or its related systems or networks;\ne.	Send or store material containing viruses, worms, trojan horses or other harmful computer code, files, scripts, agents or programs;\nf.	Interfere with or disrupt the integrity or performance of the Services or the information or data contained therein; or\ng.	Create internet ‘links’ to, or ‘frame’ or ‘mirror’ the Services, or any portion of the Services;\nh.	Decompile, reverse engineer or disassemble the Services except as may be permitted by applicable law;/ni.	Build a product or service using similar ideas, features, functions or graphics of the Services;\nj.	Copy any ideas, features, functions or graphics of the Services; or\nk.	Cause or launch any program or scripts for the purpose of scraping, indexing, surveying, or otherwise data mining any portion of the Services, or which may make multiple server requests per second, or unduly burden or hinder the operation, performance and/or functionality of the Services.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "Limited Support",
                    description:
                        "\nUsers may contact MPost Tap A Delivery for any support-related issues arising from the use of the Services by following the instructions on the Services.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "Representations and Warranties",
                    description:
                        "\nBy using the Services, you expressly represent and warrant that you are legally permitted to enter into the Agreement. The Services are not available to children (persons under the age of 18). By using the Services, you represent and warrant that you are at least 18 years old.\n\nBy using the Services, you represent and warrant that you have the right, authority and capacity to enter into this agreement and to abide by the Terms. Your access and use of the Services is for your sole, personal use. When using the Services you agree to comply with all applicable laws of the Republic of Kenya. You may only access the Services using authorized means. It is your responsibility to check to ensure you download the correct software for your device. MPost Tap A Delivery is not liable if you do not have a compatible handset or if you have downloaded the wrong version of software for your device. MPost Tap A Delivery reserves the right to terminate this Agreement should you be accessing the Services with an incompatible or unauthorized device or Software.\n\nBy using the Services, you agree that:\n\na.	You will only use the Services for lawful purposes; you will not use the Services for sending or storing any illegal or unlawful material or for fraudulent purposes;\nb.	You will not send spam or otherwise duplicative or unsolicited messages in violation of applicable laws;\nc.	You will not use the Services to cause nuisance, annoyance or inconvenience;\nd.	You will not send or store infringing, obscene, threatening, libelous or otherwise unlawful or tortious material including material that violates third party rights;\ne.	You will not impair the proper operation of the Services;\nf.	You will not try to harm the Transporters or the Services in any way whatsoever;\ng.	You will not copy, or distribute the Services or other content received as a result of access or use of the Services without written permission from MPost Tap A Delivery;\nh.	You will only use the Software and Services for your own personal use and will not resell any portion of the Services to a third party;\ni.	You will keep secure and confidential your account password or any identification we provide you which allows access to the Service;\nj.	You agree to immediately notify MPost Tap A Delivery of any unauthorized use, or suspected unauthorized use of your account or any other breach of security. MPost Tap A Delivery is not liable for any loss or damage arising from your failure to comply;\nk.	You will provide MPost Tap A Delivery with whatever proof of identity we may reasonably request;\nl.	You own, possess, or otherwise have rights to the Shipment;\nm.	You agree that MPost Tap A Delivery will not be liable for loss, damage, theft, destruction, or delayed delivery of any cargo; and\nn.	You acknowledge that MPost Tap A Delivery will never be in possession of any cargo being transported in connection with use of the Service, and that MPost Tap A Delivery will not be responsible for the securement of cargo for transportation.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "Payment Terms",
                    description:
                        "\nFor each Shipment, you will pay MPost Tap A Delivery the charges quoted to you on any invoice sent to you by the Transporter which invoice is accepted by you, plus any additional charges such as applicable platform fees (including transaction fees) charged by MPost Tap A Delivery (altogether the “Charges”).\n\nCharges are exclusive of taxes and levies, are due in accordance with the terms set out on the invoice and are non-refundable, unless otherwise determined by MPost Tap A Delivery. This no-refund policy shall apply at all times regardless of your decision to terminate your usage, our decision to terminate your usage, disruption caused to the Services either planned, accidental or intentional, or any reason whatsoever.\n\nMPost Tap A Delivery may change platform fees charged for the Services (from time to time at its sole discretion) by updating the Services and without notice to users. You understand and agree that Charges quoted to you for a specific transport may be increased or decreased at any time without notice unless and until formally accepted by you as set out on the Services; and that any accepted or quoted Charges shall not apply to any future shipments you might seek to book, as the costs of services evolve over time and are subject to changing market conditions.\n\nYou understand that MPost Tap A Delivery, in its sole discretion, may also vary its fees using any criteria including without limitation, geographical location, time period or quantum of demand. You also understand that such variance may result in different amounts charged for the same or similar services obtained through the use of the Services. We encourage you to check our website periodically if you are interested in how we charge for the Services.\n\nYou agree not to circumvent payments for confirmed Shipments in any way. Payments may be made interest-free for the first 30 days. After those initial 30 days, amounts will accrue interest at a specified predetermined rate, currently set at 2.7% per month. If MPost Tap A Delivery is required to undertake extra measures to collect Charges due from you, you shall be liable for all costs and expenses incurred by MPost Tap A Delivery in connection with collection of the Charges, including legal costs and expenses.\n\nMPost Tap A Delivery, at its sole discretion, may make promotional offers with different features and different rates to any of our customers or groups of our customers. These may result in different amounts charged for the same or similar services or goods obtained through the use of the Services. You agree that these promotional offers, unless made to you, shall have no bearing whatsoever on your contract, your use of the Services or the Charges applicable to you.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "Insurance",
                    description:
                        "\nMPost Tap A Delivery shall require Transporters offering transport and logistics services seeking registration on its platforms, obtain and maintain insurance coverage against loss or damage for goods delivered in connection with the Services.\n\nThe Shipper acknowledges that the Transporter shall retain sole liability for lost, destroyed or damaged Shipments. You understand and agree that MPost Tap A Delivery will bear no responsibility, nor be liable, for any cargo loss or other claim whatsoever.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "Intellectual Property Ownership",
                    description:
                        "\nMPost Tap A Delivery alone (and its licensors, where applicable) shall own all right, title and interest, including all related intellectual property rights, in and to the Services and any suggestions, ideas, enhancement requests, feedback, recommendations or other information provided by you or any other party relating to the Services. These Terms do not convey to you any rights of ownership in or related to the Services, or any intellectual property rights owned by MPost Tap A Delivery. The MPost Tap A Delivery name, MPost Tap A Delivery logo, and the product names associated with the Services are trademarks of MPost Tap A Delivery or third parties, and no right or license is granted to use them.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "Third Party Interactions",
                    description:
                        "\nThe Services may be made available or accessed in connection with third party services and content (including advertising) that MPost Tap A Delivery does not control. During use of the Services, you may, without limitation, enter into correspondence with, purchase goods and/or services from, or participate in promotions of third party providers, advertisers or sponsors. You acknowledge that different terms of use, warranties, representations and privacy policies may apply to your use of such third party services and content and in no event shall MPost Tap A Delivery be responsible or liable for any representations, products or services of such third party providers. You acknowledge that your access and use of the Services in connection with third party services may be subject to terms set forth in the applicable third party’s terms and conditions. You acknowledge that the availability of the products, goods or services of third party providers on the Services is not an endorsement of the same by MPost Tap A Delivery. You hereby further acknowledge that where third party providers of goods and/or services require your agreement to additional or separate terms and conditions prior to your use of or access to such goods or services, MPost Tap A Delivery will have no responsibility nor liability arising from such agreements between you and the third party providers.\n\nAny third party interactions, and any terms, conditions, warranties or representations associated with such activity, are solely between you and the applicable third party. MPost Tap A Delivery and its licensors shall have no liability, obligation or responsibility for any such correspondence, purchase, transaction or promotion between you and any such third party. MPost Tap A Delivery does not endorse any sites on the Internet that\n\nare linked through the Services, and in no event shall MPost Tap A Delivery or its licensors be responsible for any content, products, services or other materials on or available from such sites or third party providers.\n\nMPost Tap A Delivery may rely on third party advertising and marketing supplied through the Services and other mechanisms to subsidize the Services. By agreeing to these Terms you agree to receive such advertising and marketing. MPost Tap A Delivery may compile and release information regarding you and your use of the Services on an anonymous basis as part of a customer profile or similar report or analysis. You agree that it is your responsibility to take reasonable precautions in all actions and interactions with any third party you interact with through the Services.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "Indemnification",
                    description:
                        "\nYou agree that you shall defend, indemnify and hold MPost Tap A Delivery, its licensors and each such party's parent organizations, subsidiaries, affiliates, officers, directors, members, employees and agents harmless from and against any and all claims, costs, damages, demands, losses, liabilities and expenses (including legal fees and costs) arising out of or in connection with: (a) your violation or breach of any of these Terms or any applicable law or regulation, whether or not referenced herein; (b) your violation of any rights of any third party, including providers of logistics or transport services arranged via the Services; (c) your use or misuse of the Services or services or goods obtained through your use of the Services; (d) MPost Tap A Delivery’s use of your data and user content in accordance with these Terms; or (e) your Shipment.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "Disclaimer of Warranties",
                    description:
                        "\nTHE SERVICES ARE PROVIDED TO YOU STRICTLY ON AN \"AS IS\" BASIS. ALL CONDITIONS, REPRESENTATIONS AND WARRANTIES, WHETHER EXPRESS, IMPLIED, STATUTORY OR OTHERWISE, INCLUDING, WITHOUT LIMITATION, ANY IMPLIED WARRANTY OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR NON‐INFRINGEMENT OF THIRD PARTY RIGHTS, ARE HEREBY DISCLAIMED BY MPOST TAP A DELIVERY. MPOST TAP A DELIVERY MAKES NO REPRESENTATION, WARRANTY, OR GUARANTEE AS TO THE RELIABILITY, TIMELINESS, QUALITY, SUITABILITY, AVAILABILITY, ACCURACY OR COMPLETENESS OF THE SERVICES. MPOST TAP A DELIVERY MAKES NO REPRESENTATIONS OR WARRANTIES THAT (A) THE USE OF THE SERVICES WILL BE SECURE, TIMELY, UNINTERRUPTED OR ERROR‐FREE OR OPERATE IN COMBINATION WITH ANY OTHER HARDWARE, SOFTWARE, SYSTEM OR DATA, (B) THE SERVICES WILL MEET YOUR REQUIREMENTS OR EXPECTATIONS, (C) ANY STORED DATA WILL BE ACCURATE OR RELIABLE, (D) THE QUALITY OF ANY PRODUCTS, SERVICES, INFORMATION, OR OTHER MATERIAL PURCHASED OR OBTAINED BY YOU THROUGH THE SERVICES WILL MEET YOUR REQUIREMENTS OR EXPECTATIONS, (E) ERRORS OR DEFECTS IN THE SERVICES WILL BE CORRECTED, OR (F) THE SERVICES OR THE SERVER(S) THAT MAKE THE SERVICES AVAILABLE ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS. MPOST TAP A DELIVERY MAKES NO REPRESENTATION, WARRANTY, OR GUARANTEE AS TO THE RELIABILITY, SAFETY, TIMELINESS, QUALITY, SUITABILITY OR AVAILABILITY OF ANY SERVICES, PRODUCTS OR GOODS SUPPLIED BY THIRD PARTIES THROUGH THE USE OF THE SERVICES. MPOST TAP  A DELIVERY DOES NOT GUARANTEE THE SUITABILITY, LEGALITY, REGULATORY COMPLIANCE, QUALITY OR ABILITY OF A TRANSPORTER, SHIPPER OR SHIPPED ITEMS SCHEDULED THROUGH THE USE OF THE SERVICES. YOU ACKNOWLEDGE AND AGREE THAT THE ENTIRE RISK ARISING OUT OF YOUR USE OF THE SERVICES, AND ANY THIRD PARTY SERVICES OR PRODUCTS REMAINS SOLELY WITH YOU.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "Limitation of Liability",
                    description:
                        "\nMPOST TAP  A DELIVERY AND/OR ITS LICENSORS SHALL NOT BE LIABLE TO ANYONE FOR ANY INDIRECT, PUNITIVE, SPECIAL, EXEMPLARY, INCIDENTAL, CONSEQUENTIAL OR OTHER DAMAGES OF ANY TYPE OR KIND (INCLUDING PERSONAL INJURY, PROPERTY DAMAGE, LOSS OF DATA, LOST REVENUE AND/OR PROFITS, LOSS OF USE OR OTHER ECONOMIC ADVANTAGE) RELATED TO, IN CONNECTION WITH, OR OTHERWISE RESULTING FROM ANY OF THE SERVICES, REGARDLESS OF THE NEGLIGENCE OF MPOST TAP  A DELIVERY, EVEN IF MPOST TAP  A DELIVERY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. MPOST TAP  A DELIVERY AND/OR ITS LICENSORS SHALL NOT BE LIABLE FOR ANY LOSS, DAMAGE OR INJURY WHICH MAY BE INCURRED BY YOU, INCLUDING BUT NOT LIMITED TO LOSS, DAMAGE OR INJURY ARISING OUT OF, OR IN ANY WAY CONNECTED WITH THE SERVICES, INCLUDING BUT NOT LIMITED TO THE USE OR INABILITY TO USE THE SERVICES, ANY RELIANCE PLACED BY YOU ON THE COMPLETENESS, ACCURACY OR EXISTENCE OF ANY ADVERTISING, OR AS A RESULT OF ANY RELATIONSHIP OR TRANSACTION BETWEEN YOU AND ANY THIRD PARTY PROVIDER, ADVERTISER OR SPONSOR WHOSE ADVERTISING APPEARS ON THE WEBSITE OR IS REFERRED BY THE SERVICES, EVEN IF MPOST TAP  A DELIVERY AND/OR ITS LICENSORS HAVE BEEN PREVIOUSLY ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.\n\nMPOST TAP  A DELIVERY SHALL NOT BE LIABLE FOR DELAY OR FAILURE IN PERFORMANCE RESULTING FROM CAUSES BEYOND MPOST TAP  A DELIVERY’S REASONABLE CONTROL. THE SERVICES MAY BE USED BY YOU TO CONNECT WITH THIRD PARTY PROVIDERS, BUT YOU AGREE THAT MPOST TAP  A DELIVERY HAS NO RESPONSIBILITY OR LIABILITY TO YOU RELATED TO ANY PRODUCTS, GOODS AND/OR SERVICES PROVIDED TO YOU BY THIRD PARTY PROVIDERS OTHER THAN AS EXPRESSLY SET FORTH IN THESE TERMS.\n\nMPOST TAP  A DELIVERY WILL NOT BEAR ANY RESPONSIBILITY NOR INCUR ANY LIABILITY TO ASSESS THE SUITABILITY, LEGALITY OR ABILITY OF ANY TRANSPORTERS AND YOU EXPRESSLY WAIVE AND RELEASE MPOST TAP  A DELIVERY FROM ANY AND ALL LIABILITY, CLAIMS OR DAMAGES ARISING FROM OR IN ANY WAY RELATED TO THE TRANSPORTERS. MPOST TAP  A DELIVERY WILL NOT BE A PARTY TO DISPUTES, NEGOTIATIONS OF DISPUTES BETWEEN YOU AND SUCH TRANSPORTERS. RESPONSIBILITY FOR THE DECISIONS YOU MAKE REGARDING SERVICES OFFERED VIA THE SERVICES (WITH ALL ITS IMPLICATIONS) RESTS SOLELY WITH YOU. YOU EXPRESSLY WAIVE AND RELEASE ANY AND ALL RIGHTS AND BENEFITS UNDER THE LAWS OF THE REPUBLIC OF KENYA (OR ANY ANALOGOUS LAW OF ANY OTHER STATE).\n\nTHE QUALITY OF THE LOGISTICS OR TRANSPORT SERVICES OBTAINED THROUGH THE USE OF THE SERVICES IS ENTIRELY THE RESPONSIBILITY OF TRANSPORTER WHO ULTIMATELY PROVIDES SUCH SERVICES TO YOU, AND YOU HEREBY ACKNOWLEDGE AND AGREE THAT YOU USE THE TRANSPORTER SERVICES ENTIRELY AT YOUR OWN RISK.\n\nEXCEPT AS EXPRESSLY STATED HEREIN, MPOST TAP  A DELIVERY WILL NOT BE LIABLE TO YOU FOR ANY CLAIMS ARISING OUT OF ANY LOGISTICS AND/OR TRANSPORT SERVICES PROCURED THROUGH THE SERVICES. IN ANY CASE, MPOST TAP  A DELIVERY’S AGGREGATE LIABILITY SHALL IN NO EVENT EXCEED THE AMOUNTS ACTUALLY PAID BY AND/OR DUE FROM YOU IN THE THREE (3) MONTH PERIOD IMMEDIATELY PRECEDING THE EVENT GIVING RISE TO SUCH CLAIM OF LIABILITY.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "Internet Delays",
                    description:
                        "\nThe Services may be subject to limitations, delays, and other problems inherent in the use of the internet and electronic communication. MPost Tap A Delivery is not responsible for any delays, delivery failures, or any other liability, costs or damage resulting from such problems.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "Notice",
                    description:
                        "\nMPost Tap A Delivery may give notice by means of a general notice on the Services, electronic mail to your email address in your account, telephone or text message to any phone number provided in connection with your account, or by a notification message displayed on your account page. Such notice shall be deemed to have been given upon publication on the Services or upon the expiration of 12 hours after sending (if sent by email or telephone). It shall be your responsibility to keep your contact information (including email address) current and you will be deemed to have received any notice issued based on the contact information in your account, whether or not you actually receive it. You may give notice to MPost Tap A Delivery, with such notice deemed given when received by MPost Tap A Delivery, at any time through the email address info@mpost.co.ke\n\nMPost Tap A Delivery reserves the right to close or suspend your account without prior warning should you contravene any of these Terms or any future amendments and additions thereto.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "Assignment",
                    description:
                        "\nYou may not assign these Terms without the prior written approval of MPost Tap A Delivery. MPost Tap A Delivery may assign these Terms without your consent by MPost Tap A Delivery to (a) a parent, subsidiary or affiliate; (b) an acquirer of MPost Tap A Delivery’s equity, business or assets; or (c) a successor by merger. Any purported assignment in violation of this section shall be void.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "Data Privacy",
                    description:
                        "\nMPost Tap A Delivery’s collection and use of personal information in connection with the Services is described in our Data Privacy Policy located at https://www.mpost.co.ke/privacy the terms of which are incorporated into these Terms. Any data, including personal data, shared with MPost Tap A Delivery will be used in accordance with this Data Privacy Policy.\n\nBy accessing or using the Services, you hereby freely, unequivocally and expressly authorize MPost Tap A Delivery to receive, record, process, store and transfer your data, including personal data, in accordance with the law.\n\nYou hereby freely, unequivocally and expressly consent to the transfer of your data, including personal data, to third parties to be used for credit checks and other verification purposes.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "Data Privacy",
                    description:
                        "\nMPost Tap A Delivery’s collection and use of personal information in connection with the Services is described in our Data Privacy Policy located at https://www.mpost.co.ke/privacy the terms of which are incorporated into these Terms. Any data, including personal data, shared with MPost Tap A Delivery will be used in accordance with this Data Privacy Policy.\n\nBy accessing or using the Services, you hereby freely, unequivocally and expressly authorize MPost Tap A Delivery to receive, record, process, store and transfer your data, including personal data, in accordance with the law.\n\nYou hereby freely, unequivocally and expressly consent to the transfer of your data, including personal data, to third parties to be used for credit checks and other verification purposes.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "Confidentiality",
                    description:
                        "\nBy accessing or using the Services, you hereby agree and undertake not to disclose to any person any confidential information concerning the business, affairs, customers, data, clients or suppliers of MPost Tap A Delivery and the Transporters save as is expressly required by law. You also unequivocally agree not to use any information obtained through the Services for any purpose other than to procure transport services from a Transporter through the Services. Any violation of this provision shall warrant a charge, for each such violation, that shall be determined by MPost Tap A Delivery in its sole discretion, bearing in mind: (1) the loss and expense occasioned by such loss; and (2) any deterrence measures MPost Tap A Delivery may wish to pursue.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "Publication of Information",
                    description:
                        "\nIf you provide MPost Tap A Delivery any feedback, suggestions, or other information or ideas regarding the Service (“Feedback”), you hereby assign to MPost Tap A Delivery all rights in the Feedback and agree that MPost Tap A Delivery has the right to use such Feedback and related information in any manner it deems appropriate. MPost Tap A Delivery will treat any Feedback you provide as non-confidential and non-proprietary. You agree that you will not submit to MPost Tap A Delivery any information or ideas that you consider to be confidential or proprietary.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "Non-Solicitation",
                    description:
                        "\nYou shall not, except with the prior written consent of MPost Tap A Delivery, attempt to solicit or entice away; or solicit or entice away, from the service of MPost Tap A Delivery, the services of any Transporter, for any duration of time however brief. This provision shall continue in force for one (1) year subsequent to termination of usage of the Services. In the event of a violation, you shall be jointly and severally liable with the Transporter to MPost Tap A Delivery and shall be charged, for each such violation, an amount equal to twenty-five percent (25%) of all revenues paid by you to the Transporter.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "Miscellaneous Provisions\n\nResponsibility.",
                    description:
                        " If you authorize, assist, encourage or facilitate another person or entity to take any action related to the subject matter of these Terms with MPost Tap A Delivery, you shall be deemed to have taken the action yourself.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "Severability.",
                    description:
                        " If any portion of these Terms is held by a court of competent jurisdiction to be invalid or unenforceable, the remaining provisions of these Terms will remain in full force and effect, and any invalid or unenforceable portions shall be construed in a manner that most closely reflects the effect and intent of the original language. If such construction is not possible, the provision will be severed from these Terms, and the rest of the Terms shall remain in full force and effect.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "Waivers.",
                    description:
                        " Any failure by MPost Tap A Delivery to enforce any right or provision of these Terms shall in no way be construed to be a present or future waiver of such provision nor in any way affect our right to enforce such provision thereafter. All waivers by us must be acknowledged and agreed in writing.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "Successors and Assigns.",
                    description:
                        " These Terms will be binding upon, and inure to the benefit of MPost Tap A Delivery and any contracting parties and their respective successors and assigns.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "No Agency.",
                    description:
                        " No partnership, contract of employment, agency, joint venture or franchise relationship shall be created between you, MPost Tap A Delivery or any Transporters as a result of these Terms or use of the Services.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "No Third Party Beneficiary.",
                    description:
                        " You acknowledge and agree that, except as otherwise expressly provided in these Terms, there shall be no third party beneficiary to any agreement entered into with MPost Tap A Delivery.",
                    italicTitle: false),
                TitleWithDesc(
                    title:
                        "International Sale of Goods, Export and Import Control.",
                    description:
                        " Services, content, and products derived or obtained from the Services may be subject to Kenya import or export laws, and/or the export or import laws of other countries. You agree to comply strictly with all such laws and, in particular, to: (a) obtain any export, re‐export or import authorizations required by Kenya or your local laws; and (b) not provide services, content, or products from the Services to any prohibited countries and/or prohibited entities as identified in any Kenyan legislation.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "Choice of Law.",
                    description:
                        " These Terms are governed by and construed in accordance with the laws of Kenya without giving effect to any conflict of law principles. The United Nations Convention on Contracts for the International Sale of Goods will not apply to these Terms and are hereby expressly excluded.",
                    italicTitle: false),
                TitleWithDesc(
                    title: "Headings.",
                    description:
                        " Headings are for reference purposes only and in no way define, limit, construe or describe the scope or extent of such section.",
                    italicTitle: false),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TitleWithDesc extends StatelessWidget {
  String title, description;
  bool italicTitle;
  TitleWithDesc(
      {Key? key,
      required this.title,
      required this.description,
      required this.italicTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: RichText(
          text: TextSpan(
              text: title,
              style: TextStyle(
                  color: Colors.black,
                  fontStyle: italicTitle ? FontStyle.italic : null,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
              children: [
            TextSpan(
              text: description,
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontFamily: "Montserrat",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Constants.descriptionColor),
            )
          ])),
    );
  }
}
