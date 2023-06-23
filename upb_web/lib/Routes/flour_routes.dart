import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../Pages/about-us/about_us_page.dart';
import '../Pages/events/events_page.dart';
import '../Pages/home/home_page.dart';
import '../Pages/login/login_page.dart';
import '../Pages/login/registration_page.dart';
import '../Pages/membership_agreements/membership_agreements_page.dart';
import '../Pages/news/news_detail_page.dart';
import '../Pages/news/news_page.dart';
import '../Pages/programs/programs_page.dart';
import '../Pages/management/management_content.dart';

import '../Components/details pages/company_details_page.dart';

class Routes {
  static void defineRoutes(FluroRouter router) {
    router.define("/", handler: _homeHandler);
    router.define('/login', handler: _loginPage);
    router.define('/registration', handler: _registrationPage);
    router.define('/events', handler: _eventsPage);
    router.define('/programs', handler: _programsPage);
    router.define('/member-agreements', handler: _memberAgreementsPage);
    router.define('/news', handler: _newsPage);
    router.define("/news/:id", handler: _newsDesPage);
    router.define('/about-us', handler: _aboutUsPage);
    router.define('/management-content', handler: _managementContentPage);

    router.define("/company/:id", handler: _companyDesPage);
  }

  static final Handler _homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          MyHomePage());

  static final Handler _loginPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          LoginPage());

  static final Handler _registrationPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          RegistrationPage());

  static final Handler _eventsPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          EventsPage());

  static final Handler _programsPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          ProgramsPage());

  static final Handler _memberAgreementsPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          MemberAgreementsPage());

  static final Handler _newsPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          NewsPage());

  static final Handler _newsDesPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          NewsDetailPage(params["id"][0]));

  static final Handler _aboutUsPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          AboutUsPage());

  static final Handler _companyDesPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          CompanyDetailPage(params["id"][0]));

  static final Handler _managementContentPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          ManagementContent());
}
