import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:screen_test/core/theming/font_family.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart'
    as inset_shadow;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFFFF3E5),
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        top: true,
        bottom: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                color: const Color(0xFFFFF3E5),
                child: Column(
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 16),
                    _buildSearchBar(),
                    const SizedBox(height: 16),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(28),
                          topRight: Radius.circular(28),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                              height: 196,
                              child: ListView.builder(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16, top: 16),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 2,
                                  itemBuilder: (context, index) => Padding(
                                      padding: EdgeInsets.only(
                                        right: index == 0 ? 8 : 0,
                                       left: index == 1 ? 0 : 0,
                                      ),
                                      child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              32,
                                          child: _buildPromoBanner())))),
                          const SizedBox(height: 16),
                          _buildServicesSection(),
                          const SizedBox(height: 16),
                          _buildNearbyTechniciansSection(),
                          const SizedBox(height: 16),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              left: 0,
              right: 0,
              child: _buildFloatingNotification(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 25, bottom: 16),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFFFFFFFF),
                  const Color(0xFFFFFFFF).withOpacity(0.8),
                  const Color(0xFFFFF3E5).withOpacity(0.5),
                ],
              ),
              boxShadow: const [
                inset_shadow.BoxShadow(
                  inset: true,
                  offset: Offset(0, 0),
                  blurRadius: 8,
                  spreadRadius: 0,
                  blurStyle: BlurStyle.inner,
                  color: Color.fromRGBO(255, 163, 58, 0.32),
                ),
              ],
            ),
            child: SvgPicture.asset(
              "assets/svgs/notificationsIcon.svg",
              width: 20,
              height: 20,
              fit: BoxFit.scaleDown,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFFFFFFFF),
                  Color(0xFFFFFFFF).withOpacity(0.9),
                  const Color(0xFFFFF3E5).withOpacity(0.5),
                ],
              ),
              boxShadow: const [
                inset_shadow.BoxShadow(
                  inset: true,
                  offset: Offset(0, 0),
                  blurRadius: 8,
                  spreadRadius: 0,
                  blurStyle: BlurStyle.inner,
                  color: Color.fromRGBO(255, 163, 58, 0.32),
                ),
              ],
            ),
            child: SvgPicture.asset(
              "assets/svgs/message_icon.svg",
              width: 20,
              height: 20,
              fit: BoxFit.scaleDown,
            ),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "محمد منجي",
                style: TextStyle(
                  fontFamily: FontFamilies.ibmPlexSansArabic,
                  fontSize: 16,
                  height: 1.5,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF0F0D0B),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    "assets/svgs/arrowDown.svg",
                    width: 10,
                    height: 10,
                  ),
                  const SizedBox(width: 2.5),
                  const Text(
                    'الكردة ، بغداد',
                    style: TextStyle(
                      fontFamily: FontFamilies.ibmPlexSansArabic,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF999999),
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(width: 4),
                  SvgPicture.asset(
                    "assets/svgs/location.svg",
                    width: 14,
                    height: 14,
                  )
                ],
              ),
            ],
          ),
          const SizedBox(width: 8),
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              // color: Color(0xFFD9A45C),
              gradient: LinearGradient(
                  colors: [Color(0xffE6B045), Color(0xffDC8230)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              image: DecorationImage(
                image: AssetImage("assets/images/mohamedImage.png"),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFF3E5),
              Color(0xFFFFFFFF),
              Color(0xFFFFFFFF),
              Color(0xFFFFF3E5),
            ],
            stops: [0.0, 0.35, 0.65, 1.0],
          ),
          boxShadow: const [
            inset_shadow.BoxShadow(
              inset: true,
              offset: Offset(0, 0),
              blurRadius: 12,
              spreadRadius: -6,
              blurStyle: BlurStyle.inner,
              color: Color.fromRGBO(255, 224, 194, 0.6),
            ),
            inset_shadow.BoxShadow(
              inset: true,
              offset: Offset(0, 0),
              blurRadius: 8,
              spreadRadius: 0,
              blurStyle: BlurStyle.inner,
              color: Color.fromRGBO(0, 0, 0, 0.04),
            ),
          ],
          border: Border.all(
            color: Color(0xFFFFFFFFF),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            const Expanded(
              child: Text(
                'ابحث عن الخدمات والفنيين والعروض',
                style: TextStyle(
                  fontFamily: FontFamilies.ibmPlexSansArabic,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                  color: Color(0xFFB3B3B3),
                ),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(width: 12),
            SvgPicture.asset(
              "assets/svgs/search.svg",
              width: 24,
              height: 24,
              // fit: BoxFit.scaleDown,
            ),
            const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 165,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFD9A45C).withOpacity(0.18),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                Positioned(
                  bottom: -60,
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Image.asset(
                    "assets/images/promoImage.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          const Color(0xFFFFA33A).withOpacity(0.8),
                          Color(0xff00000000),
                        ],
                      ),
                    ),
                  ),
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(right: 16, left: 225),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          " %71خصم",
                          style: TextStyle(
                            fontFamily: FontFamilies.ibmPlexSansArabic,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFFFFFF),
                            height: 1.3,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'احصل على خصم على اول خدمة لك',
                          style: TextStyle(
                            fontFamily: FontFamilies.ibmPlexSansArabic,
                            fontSize: 12,
                            height: 1.3,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 149,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: const Border(
                    top: BorderSide(color: Color(0xFFFFA33A), width: 1),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 9,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Text(
                    "اطلب خدمة الان",
                    style: TextStyle(
                      fontFamily: FontFamilies.ibmPlexSansArabic,
                      fontSize: 12,
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFFA33A),
                    ),
                  ),
                )),
          ),
        ),
      ],
    );
  }

  Widget _buildServicesSection() {
    final services = [
      {
        'name': 'الطلي',
        'imagePath': "assets/images/painting.png",
      },
      {
        'name': 'السباكة',
        'imagePath': "assets/images/plumbing.png",
      },
      {
        'name': 'الكهرباء',
        'imagePath': "assets/images/electrical.png",
      },
      {
        'name': 'التكييفات',
        'imagePath': "assets/images/air_conditioning.png",
      },
      {
        'name': 'صالون',
        'imagePath': "assets/images/salon.png",
      },
      {
        'name': 'التجميل',
        'imagePath': "assets/images/beauty.png",
      },
      {
        'name': 'أجهزة',
        'imagePath': "assets/images/electronics.png",
      },
      {
        'name': 'التنظيف',
        'imagePath': "assets/images/cleaning.png",
      },
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/svgs/leftArrow.svg",
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    "عرض الكل",
                    style: TextStyle(
                      fontFamily: FontFamilies.ibmPlexSansArabic,
                      fontSize: 14,
                      height: 1.3,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF999999),
                    ),
                  ),
                ],
              ),
              const Text(
                "الفئات",
                style: TextStyle(
                  fontFamily: FontFamilies.ibmPlexSansArabic,
                  fontSize: 20,
                  height: 1.5,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0F0D0B),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 20,
              childAspectRatio: 0.85,
            ),
            itemCount: services.length,
            itemBuilder: (context, index) {
              return _buildServiceItem(
                services[index]['name'] as String,
                services[index]['imagePath'] as String,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildServiceItem(
    String title,
    String imagePath,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                const Color(0xFFFFFFFF),
                Color(0xFFFFFFFF).withOpacity(0.9),
                const Color(0xFFFFF3E5).withOpacity(0.5),
              ],
            ),
            boxShadow: const [
              inset_shadow.BoxShadow(
                inset: true,
                offset: Offset(0, 0),
                blurRadius: 8,
                spreadRadius: 0,
                blurStyle: BlurStyle.inner,
                color: Color.fromRGBO(255, 163, 58, 0.32),
              ),
            ],
          ),
          child: Center(
              child: Image.asset(
            imagePath,
            height: 28,
            width: 28,
          )),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontFamily: FontFamilies.ibmPlexSansArabic,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0F0D0B),
            height: 1.3,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildNearbyTechniciansSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/svgs/leftArrow.svg",
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    "عرض الكل",
                    style: TextStyle(
                      fontFamily: FontFamilies.ibmPlexSansArabic,
                      fontSize: 14,
                      height: 1.3,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF999999),
                    ),
                  ),
                ],
              ),
              const Text(
                "فنيين بالقرب منك",
                style: TextStyle(
                  fontFamily: FontFamilies.ibmPlexSansArabic,
                  fontSize: 20,
                  height: 1.5,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1.4,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return _buildTechnicianCard();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTechnicianCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBF5),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 2,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(3),
                child: Container(
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFA33A),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: Opacity(
                      opacity: 0.95,
                      child: Image.asset(
                        "assets/images/backGround2.png",
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -24,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/ahmedImage.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/svgs/Star_fill.svg",
                width: 9,
                height: 9,
              ),
              const SizedBox(width: 4),
              const Text(
                '4.5',
                style: TextStyle(
                  fontFamily: FontFamilies.ibmPlexSansArabic,
                  fontSize: 10,
                  height: 1.2,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF0F0D0B),
                ),
              ),
              const SizedBox(width: 4),
              const Text(
                'أحمد عامر',
                style: TextStyle(
                  fontFamily: FontFamilies.ibmPlexSansArabic,
                  fontSize: 14,
                  height: 1.3,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF010C19),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Container(
            height: 20,
            width: 59,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xFFFFF3E5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'التكييفات',
                  style: TextStyle(
                    fontFamily: FontFamilies.ibmPlexSansArabic,
                    fontSize: 10,
                    height: 1.2,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF143146),
                  ),
                ),
                const SizedBox(width: 4),
                Image.asset(
                  "assets/images/air.png",
                  height: 10,
                  width: 12,
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "الكردة ، بغداد",
                style: TextStyle(
                  fontFamily: FontFamilies.ibmPlexSansArabic,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                  color: Color(0xFF0F0D0B),
                ),
              ),
              const SizedBox(width: 4),
              SvgPicture.asset(
                "assets/svgs/Vector.svg",
                width: 9,
                height: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingNotification() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF143146),
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            const Text(
              "أحمد عامر",
              style: TextStyle(
                fontFamily: FontFamilies.ibmPlexSansArabic,
                fontSize: 14,
                height: 1.3,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(
                  "assets/images/ahmedImage.png",
                  fit: BoxFit.cover,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.5, vertical: 16),
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem("assets/svgs/user.svg", 'الملف', false),
              _buildNavItem("assets/svgs/time.svg", 'المواعيد', false),
              _buildNavItem("assets/svgs/users.svg", 'الخدمات', false),
              _buildNavItem("assets/svgs/setting.svg", 'المزيد', false),
              _buildNavItem("assets/svgs/essential.svg", 'الرئيسية', true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String iconPath, String label, bool isActive) {
    if (isActive) {
      return Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xffFFA33A),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontFamily: FontFamilies.ibmPlexSansArabic,
                fontSize: 14,
                height: 1.3,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 3),
            SvgPicture.asset(
              iconPath,
              width: 24,
              height: 24,
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(
                isActive ? Colors.white : Color(0xff999999),
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            const Color(0xFFFFFFFF),
            const Color(0xFFFFFFFF).withOpacity(0.8),
            const Color(0xFFFFF3E5).withOpacity(0.5),
          ],
        ),
        boxShadow: const [
          inset_shadow.BoxShadow(
            inset: true,
            offset: Offset(0, 0),
            blurRadius: 8,
            spreadRadius: 0,
            blurStyle: BlurStyle.inner,
            color: Color.fromRGBO(255, 163, 58, 0.32),
          ),
        ],
      ),
      child: SvgPicture.asset(
        iconPath,
        width: 24,
        height: 24,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
