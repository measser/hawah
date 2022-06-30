
import 'package:flutter/material.dart';
import 'package:hawwah/modules/home/models.dart';
import 'package:hawwah/shared/components/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pageController = PageController();

  List<Model> experments = [
    //zainab
    Model(
      image: "assets/images/home/zainab.png",
      title: "كلكيعة وسن صغير",
      description:
          "٢٣سنة وعندي سرطان ثدي، ويمكن الدعم والعيلة وقوتي هما اللي ساعدوني اتخطى التجربة دي كل يوم بواجه أسئلة كتيرة زي إيه ده عندك سرطان ثدي ؟ هتتجوزي إزاي ؟",
      info:
          "كلكيعة وسن صغير\n ٢٣سنةوعندي سرطان ثدي، ويمكن الدعم والعيلة وقوتي هما اللي ساعدوني اتخطى التجربة دي كل يوم بواجه أسئلة كتيرة زي إيه ده عندك سرطان ثدي ؟ هتتجوزي إزاي ؟ جالك المرض ده إزاي ؟ وأسئلة غيرهم،،  والإجابة هي  "
          "ربنا بيختبرني من سنتين كنت في منحة لدراسة الهندسة في الصين، وظهرتلي كلكيعة وفي أول أجازة كلمت بهية وعملت التحاليل كلها والنتيجة ظهرت إن عندي سرطان ثدي كل اللي شغلني في مرحلة التعب والعلاج حلمي في الدراسة وإني مش هكون مع صحابي سنتين مروا وأنا أهو مخلصة علاجي، رجعت لدراستي ودلوقتي بعمل مشروع التخرج،، التجربة في سن صغير خلتني أتعلم .. ويكون في قلبي ثقة كبيرة إني هخف وإن تجربة السرطان هتكون محطة من محطات كتير بعدي بيها وبنجح علشان السرطان مرض لكن مش بيلغي الأحلام..السرطان بيخلينا نعرف نحلم أكتر",
    ),
    //Bassma
    Model(
      image: "assets/images/home/bassma.png",
      title: "باسمة يوسف",
      description:
          "كتشفت باسمة إصابتها بسرطان الثدي في الرابع عشر من أبريل هذا العامفي إحدى المرّات، لاحظت باسمة تورمّا في منطقة الثدي ونخزا وتغيّرا في لون الجلد، وعندما هرعت إلى المستشفيات كانت نتيجة الفحص",
      info:
          "بسمة يوسف (36 عاما) \n اكتشفت إصابتها بسرطان الثدي في الرابع عشر من أبريل هذا العامفي إحدى المرّات، لاحظت باسمة تورمّا في منطقة الثدي ونخزا وتغيّرا في لون الجلد، وعندما هرعت إلى المستشفيات كانت نتيجة الفحص أنها مصابة بسرطان في الثدي.  وقع الصدمة كان كبيراالأثر الأكبر الذي غيّر مسار حياة باسمة هو أنها لن تتمكن من الإنجاب على الإطلاق كما أخبرها الأطباءاكتشفت أنني مصابة بالسرطان وبعدها بثلاثة أسابيع تعيّن استئصال الثدي. كان لديّ ثلاثة أسابيع لأستعدّ نفسيا لحقيقة أنني سأفقد جزءا من جسدي واستبداله بجزء مصنوع من السيليكون لتعويض الجزء المفقود من أعضائي الحقيقية. ولذا للأسف لم أكن على استعداد، كنت أعدّ نفسي نفسيا لشيء كبير سيحدث ومررت به وكنت أتعلم كل يوم عن الخطوات التي يجب أن أتخذها لأتعافى.ربنا بيختبرني من سنتين كنت في منحة لدراسة الهندسة في الصين، وظهرتلي كلكيعة وفي أول أجازة كلمت بهية وعملت التحاليل كلها والنتيجة ظهرت إن عندي سرطان ثدي كل اللي شغلني في مرحلة التعب والعلاج حلمي في الدراسة وإني مش هكون مع صحابي سنتين مروا وأنا أهو مخلصة علاجي، رجعت لدراستي ودلوقتي بعمل مشروع التخرج،، التجربة في سن صغير خلتني أتعلم .. ويكون في قلبي ثقة كبيرة إني هخف وإن تجربة السرطان هتكون محطة من محطات كتير بعدي بيها وبنجح علشان السرطان مرض لكن مش بيلغي الأحلام..السرطان بيخلينا نعرف نحلم أكتر",
    ),
    //Maria
    Model(
      image: "assets/images/home/maria.png",
      title: "لم يكن متوقع الاصابة",
      description:
          "سمي ماريا وأنا ناجية من سرطان الثدي. في مايو من عام 2019،حصلت على الماموجرام السنوي الخاص بي ، وفي اليوم التالي تلقيت مكالمة تفيد بأنهم بحاجة لالتقاط المزيد من الصور",
      info: "اسمى ماريا وأناجيه من سرطان الثدى\n في مايو من عام 2019 ، حصلت على الماموجرام السنوي الخاص بي ، وفي اليوم التالي تلقيت مكالمة تفيد بأنهم بحاجة لالتقاط المزيد من الصور.بعد التصوير الشعاعي للثدي والخزعات اللاحقة ، تم تشخيص إصابتي بسرطان الثدي الإيجابي للإستروجين في الثدي والغدد الليمفاوية.لقد صدمت. لم يكن لدى أي من أفراد عائلتي تاريخ من الإصابة بسرطان الثدي. لم أدخن ، وقد نجحت في إرضاع أطفالي الثلاثة رضاعة طبيعية ، وكلاهما كان يجب أن يقلل من مخاطر إصابتي. في الواقع ، كنت أجري نصف ماراثون قبل وقت قصير من الحصول على صورة الثدي الشعاعية! لم يكن سرطان الثدي شيئًا كان على الرادار على الإطلاق.أجريت عملية جراحية في يوليو 2019. أوضح لي أطبائي أنه مع نوع السرطان الذي أصبت به ، لست بحاجة إلى استئصال الثدي لأن استئصال الكتلة الورمية والعلاج الإشعاعي جنبًا إلى جنب مع العلاج الكيميائي سيؤديان إلى نفس النتيجة.بعد الجراحة خضعت للعلاج الكيميائي. "
    ),
    //Elisa
    Model(
      image: "assets/images/home/elissa.jpg",
      title: "معاناة إليسا",
      description: "وكانت إليسا قد اكتشفت إصابتها بسرطان الثدي في 26 ديسمبر 2016، وكانت إصابتها لا تزال في مراحلها المبكرة",
      info: "كانت إليسا قد اكتشفت إصابتها بسرطان الثدي في 26 ديسمبر 2016، وكانت إصابتها لا تزالفي مراحلها المبكرة، وخضعت لعملية بعد رأس السنة وخضعت إليسا على مدى 45 يوماً متواصلاً للعلاج بالأشعة،ولعل أكثر ما آلم إليسا اضطرارها لإخفاء إصابتها عن والدتها، وإصابة شقيقتها بعدها بالسرطان إذ أنها لا تزال تعالج.إليسا عانت بعدها من تبعات العلاج، فاضطرت إلى الخضوع مرتين لعملية في يدها اليمنى، لإزالة الاحتقان منها، بعد تضررها جراء العلاج، ونذرت نفسها لتوعية النساء حول أهمية الفحص المبكر لسرطان الثدي",
    ),
    //Semona
    Model(
      image: "assets/images/home/semona.png",
      title: "السرطان مبيخوفش ",
      description: "المحاربة الجميلة سيمونة عندها ٣١ سنة عملتالعملية من خمس شهور وعرفت بالمرض صدفةوبعدها جت على بهية من غير تفكير خلال يوم عملت كل الفحوصات",
      info: "السرطان مبيخوفش ممكن الناس بتخاف من كلمة سرطان بس لما جالي المرض اتعاملت معاه بهدوء وربنا أداني طاقة علشان أكمل الرحلة بسلام المحاربة الجميلة سيمونة عندها ٣١ سنة عملت العملية من خمس شهور وعرفت بالمرض صدفة وبعدها جت على بهية من غير تفكيرخلال يوم عملت كل الفحوصات وعرفت النتيجة وعملت العملية على طولدلوقتي سيمونة في مرحلة العلاج الهرموني بعد ما خلصت العلاج الإشعاعي بكل قوة وإيمان إن الرحلة هتنتهي بسلام.سيمونه حكتلنا عن دور زوجها في الدعم وقد إيه هي كانت حريصة إنها متحسسش أولادها وأهلها بأي حاجة علشان ميقلقوش أكتر.حاولت اتماسك قدام أهلي وأولادي علشان لسه صغيرين وبعد ما عملت العملية بأسبوع بلغت أهلبعد العملية سيمونه بدأت العلاج الطبيعي وخلال شهر ونص رجعت لحياتها الطبيعية من تانيتجربة المحاربة سيمونة علمتنا إن الهدوء في التعامل مع الأحداث الصعبة في حياتنا بيكون أعظم طريقة للنجاة من أي حاجة صعبة بسرعة",
    ),
  ];

  List<Model> information = [
    Model(
      image: "assets/images/home/info2.jpg",
      title: "ما هو سرطان الثدي؟",
      description: "سرطان الثدي عبارة عن سرطان يتشكل في خلايا الثدي",
      info: "سرطان الثدي عبارة عن سرطان يتشكل في خلايا الثديين. ويأتي سرطان الثدي بعد سرطانَ الجلد من حيث كونه أكثر أنواع السرطانات شيوعًا بين النساء في الولايات المتحدة. قد يصيب سرطان الثدي كلًّا من الرجال والنساء، إلا إنه أكثر شيوعًا بين النسا. قد ساعد الدعم الكبير للتوعية بسرطان الثدي وتمويل الأبحاث على إحداث تقدُّم في تشخيص سرطان الثدي وعلاجه. وزادت معدلات البقاء على قيد الحياة لمرضى سرطان الثدي، كما قلَّ عدد الوفيات المرتبطة بهذا المرض بشكل منتظم، ويرجع ذلكَ بشكلٍ كبيرِ إلى عدد من العوامل، مثل الكشف المبكر، واستخدام طريقة علاج جديدة تراعي الحالة الفردية، والفهم الأفضل لطبيعة هذا المرض.",
    ),
    Model(
      image: "assets/images/home/info1.png",
      title: "ما هى اعراض سرطان الثدي؟",
      description: "يتضمن سرطان الثدي العديد من الاعراض .... ",
      info:"قد تتضمن علامات سرطان الثدي وأعراضه ما يلي:كتلة أو تثخنًا في الثدي يَختلف عن الأنسجة المحيطة تغيُّرًا في حجم الثدي أو شكله أو مظهرهتغيُّرًا في الجلد الموجود على الثدي، مثل الترصُّعالحلمة المقلوبة حديثة الظهورتقشُّرًا أو توسفًا أو تيبسًا أو تساقطًا في المنطقة المصطبغة من الجلد المحيط بالحلمة (الهالة) أو جلد الثدياحمرار جلد الثدي أو تنقيره، مثل جلد البرتقالة",
    ),
    Model(
      image: "assets/images/home/info3.jpg",
      title: "ما هى اسباب سرطان الثدى؟",
      description: "سرطان الثدي له العديد من الأسباب ....",
      info:
          "ما هي أسباب سرطان الثدي؟\n ويعرِّف الأطباء أن سرطان الثدي يحدث عندماتبدأ بعض خلايا الثدي في النموبطريقة غير طبيعية. تنقسم هذه الخلايا بسرعةأكبر من الخلايا السليمة وتستمر لتتراكم، وتشكِّلكتلة أو ورمًا. وقد تنتشر الخلايا (تنتقل) من خلالالثدي إلى العُقَد اللمفية، أو إلى أجزاء أخرىمن جسمك.يبدأ سرطان الثدي عادةً مع الخلايا الموجودةفي القنوات المنتجة للحليب (السرطان اللبني العنيف).يمكن أن يبدأ سرطان الثدي أيضًا في الأنسجةالغُدِّيَّة التي يُطلق عليها اسمالفصيصات (السرطان الفصيصي الغزوي)،أو في خلايا أو أنسجة أخرى داخل الثدي.",
    ),
  ];

  var _expermentsIndex = 0;
  var _informationsIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(248, 157, 185, 1.0),
                Color.fromRGBO(250, 250, 250, 1.0)
              ]),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // EXPERMENT...
                 Text(
                      "التجــارب .",
                      style:  TextStyle(
                          fontSize: 30.0,
                          color: thirdColor,
                          fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: PageView.builder(
                        onPageChanged: (index){
                          setState(() {
                            _expermentsIndex = index;});},
                        controller: pageController,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) =>
                            Container(
                                margin: const EdgeInsets.all(10.0),
                                child: Experments(context, experments[index])),
                        itemCount: experments.length,),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(experments.length, (index) => Indicator(
                           isActive : _expermentsIndex == index ? true : false
                        ))

                      ],
                    ),


                    // INFORMATION...
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "معلومـات.",
                      style: TextStyle(
                          fontSize: 30.0,
                          color: thirdColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: PageView.builder(
                        onPageChanged: (index){
                          setState(() {
                            _informationsIndex = index;
                          });
                        },
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) =>
                            Container(
                                margin: const EdgeInsets.all(10.0),
                                child: Informations(context, information[index])),
                        itemCount: information.length,
                        controller: pageController,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(information.length, (index) => Indicator(
                            isActive : _informationsIndex == index ? true : false
                        ))

                      ],
                    ),

                    //ADVICES...
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 100.0,
                            height: 500.0,
                            width: 370,
                            child: Container(
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage("assets/images/home/home_back.png"),
                                ),
                                color: secondaryColor,
                                  borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(color: thirdColor),
                              ),

                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50.0),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:  [
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                          "- قللى من تناول الكحوليات",
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          color: thirdColor,
                                          shadows: const[
                                            Shadow(
                                                color: Colors.white,
                                                blurRadius: 1.2,
                                                offset: Offset(3, 3)),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "-الاستمرار فى ممارسة الرياضه",
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          color: thirdColor,
                                          shadows:const [
                                            Shadow(
                                                color: Colors.white,
                                                blurRadius: 1.2,
                                                offset: Offset(3, 3)),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "- الرضاعة الطبيعية",
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          color: thirdColor,
                                          shadows:const [
                                            Shadow(
                                                color: Colors.white,
                                                blurRadius: 1.2,
                                                offset: Offset(3, 3)),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "- تناول الأغذيه الصحيه",
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          color: thirdColor,
                                          shadows: const[
                                            Shadow(
                                                color: Colors.white,
                                                blurRadius: 1.2,
                                                offset: Offset(3, 3)),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "- الحد من العلاج الهرمونى بعد انقطاع الحيض",
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          color: thirdColor,
                                          shadows: const[
                                            Shadow(
                                                color: Colors.white,
                                                blurRadius: 1.2,
                                                offset: Offset(3, 3)),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "- وللمدخنات: يجب الابتعاد عن التدخين",
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          color: thirdColor,
                                          shadows: const[
                                            Shadow(
                                                color: Colors.white,
                                                blurRadius: 1.2,
                                                offset: Offset(3, 3)),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0.0,
                            right: 0.0,
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Container(
                              child:  Center(
                                child:  Text(
                                  "نصائح",
                                  style: TextStyle(
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.bold,
                                    color: thirdColor,
                                  ),
                                ),
                              ),
                              decoration: const BoxDecoration(
                                  image:  DecorationImage(
                                      image: AssetImage(
                                        "assets/images/cloud.png",
                                      )
                                  ),

                              ),
                            ),
                          ),
                        ],
                      ),
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


  _background() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(248, 157, 185, 1.0),
              Color.fromRGBO(250, 250, 250, 1.0)
            ]),
      ),
    );
  }
}


//CUSTOM WIDGETS...
class Indicator extends StatelessWidget {
  final bool? isActive;
   const Indicator({
    Key? key,
   this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Container(
        width: isActive!? 20.0 :8.0,
        height: 8.0,
        decoration: BoxDecoration(
          color:isActive!? thirdColor : secondaryColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget Experments(context, Model experments) => Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title..
                  Text(
                    experments.title,
                    style:  TextStyle(
                        fontSize: 25.0,
                        color: thirdColor,
                        fontWeight: FontWeight.bold),
                  ),
                  //Description
                  Text(
                    experments.description,
                    style:  TextStyle(fontSize: 22.0, color: thirdColor),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  GestureDetector(
                    child: Container(
                      width: 100.0,
                      decoration: BoxDecoration(
                        //color: primaryColor,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child:  const Center(
                          child: Text(
                        "قراءة المزيد...",
                        style: TextStyle(fontSize: 18.0, color: Color(-10394479)),
                      )),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.vertical(
                        //         top: Radius.circular(25.0))),
                        isDismissible: false,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        elevation: 0.0,
                        context: context,
                        builder: (context) => DraggableScrollableSheet(
                          initialChildSize: 0.8,
                          maxChildSize: 0.8,
                          minChildSize: 0.4,
                          builder: (_, controller) => Container(
                            decoration: BoxDecoration(
                              color: primaryColor,
                              // image:  DecorationImage(
                              //     image: AssetImage(
                              //       "assets/images/logo.png",
                              //     )
                              // ),
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(25.0)),
                            ),
                            padding: const EdgeInsets.all(16.0),
                            child: ListView(
                              controller: controller,
                              children: [
                                Text(
                                  experments.info,
                                  style:  TextStyle(
                                      fontSize: 25.0,
                                      color: thirdColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          // Image :
          Container(
            height: 230.0,
            width: 160.0,
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                    image: AssetImage(
                      experments.image,
                    ),
                    fit: BoxFit.cover
                )
            ),

          ),

        ],
      ),
    );

Widget Informations(context, Model information) => Container(

      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    information.title,
                    style:  TextStyle(
                        fontSize: 22.0,
                        color: thirdColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    information.description,
                    style:  TextStyle(fontSize: 22.0, color: thirdColor),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  GestureDetector(
                    child: Container(
                      width: 100.0,
                      decoration: BoxDecoration(
                       // color: primaryColor,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child:  const Center(
                          child: Text(
                        "قراءة المزيد...",
                        style: TextStyle(fontSize: 20.0, color: Color(-10394479)),
                      )),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top:  Radius.circular(25.0))),
                        isDismissible: false,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        elevation: 0.0,
                        context: context,
                        builder: (context) => DraggableScrollableSheet(
                          initialChildSize: 0.8,
                          maxChildSize: 0.8,
                          minChildSize: 0.4,
                          builder: (_, controller) => Container(
                            decoration: BoxDecoration(
                              color: primaryColor,
                              image:  DecorationImage(
                                opacity: .2,
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    information.image,
                                  )
                              ),

                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(25.0)),
                            ),
                            padding: const EdgeInsets.all(16.0),
                            child: ListView(
                              controller: controller,
                              children: [
                                Text(
                                  information.info,
                                  style:  TextStyle(
                                      fontSize: 25.0,
                                      color: thirdColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          // Image :
          Container(
            height:  MediaQuery.of(context).size.height * 0.32,
            width: 145.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: AssetImage(
                  information.image,
                ),
                fit: BoxFit.cover
              )
            ),
          ),
        ],
      ),
    );



