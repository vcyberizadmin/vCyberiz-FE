import 'package:vcyberiz/data/data_source/banner_info_data_source.dart';
import 'package:vcyberiz/data/data_source/careers_data_source.dart';
import 'package:vcyberiz/data/data_source/contact_us_data_source.dart';
import 'package:vcyberiz/data/data_source/events_data_source.dart';
import 'package:vcyberiz/data/data_source/footer_data_source.dart';
import 'package:vcyberiz/data/data_source/home_data_source.dart';
import 'package:vcyberiz/data/data_source/home_video_data_source.dart';
import 'package:vcyberiz/data/data_source/methodology_data_source.dart';
import 'package:vcyberiz/data/data_source/news_data_source.dart';
import 'package:vcyberiz/data/data_source/our_service_data_source.dart';
import 'package:vcyberiz/data/data_source/partners_data_source.dart';
import 'package:vcyberiz/data/data_source/resources_data_source.dart';
import 'package:vcyberiz/data/data_source/solutions_data_source.dart';
import 'package:vcyberiz/data/data_source/why_work_with_us_data_source.dart';
import 'package:vcyberiz/data/repositories/banner_info_repo.dart';
import 'package:vcyberiz/data/repositories/contact_us_repo.dart';
import 'package:vcyberiz/data/repositories/events_repo.dart';
import 'package:vcyberiz/data/repositories/footer_repo.dart';
import 'package:vcyberiz/data/repositories/home_repo.dart';
import 'package:vcyberiz/data/repositories/home_video_repo.dart';
import 'package:vcyberiz/data/repositories/methodology_repo.dart';
import 'package:vcyberiz/data/repositories/news_repo.dart';
import 'package:vcyberiz/data/repositories/our_services_repo.dart';
import 'package:vcyberiz/data/repositories/partners_repo.dart';
import 'package:vcyberiz/data/repositories/resources_repo.dart';
import 'package:vcyberiz/data/repositories/solutions_repo.dart';
import 'package:vcyberiz/data/repositories/why_work_with_us_repo.dart';
import 'package:vcyberiz/data/services/banner_info_service.dart';
import 'package:vcyberiz/data/services/careers_service.dart';
import 'package:vcyberiz/data/services/contact_us_service.dart';
import 'package:vcyberiz/data/services/cookies_service.dart';
import 'package:vcyberiz/data/services/events_service.dart';
import 'package:vcyberiz/data/services/footer_service.dart';
import 'package:vcyberiz/data/services/home_service.dart';
import 'package:vcyberiz/data/services/home_video_service.dart';
import 'package:vcyberiz/data/services/methodology_service.dart';
import 'package:vcyberiz/data/services/news_service.dart';
import 'package:vcyberiz/data/services/our_service_service.dart';
import 'package:vcyberiz/data/services/partner_service.dart';
import 'package:vcyberiz/data/services/resources_service.dart';
import 'package:vcyberiz/data/services/solutions_service.dart';
import 'package:vcyberiz/data/services/why_work_with_us_service.dart';

import '../data/data_source/about_us_data_source.dart';
import '../data/data_source/blogs_data_source.dart';
import '../data/data_source/cookies_data_source.dart';
import '../data/data_source/header_data_source.dart';
import '../data/data_source/our_approach_data_source.dart';
import '../data/data_source/our_solutions_data_source.dart';
import '../data/data_source/privacy_data_source.dart';
import '../data/data_source/what_we_do_data_source.dart';
import '../data/repositories/about_us_repo.dart';
import '../data/repositories/blogs_repo.dart';
import '../data/repositories/careers_repo.dart';
import '../data/repositories/cookies_repo.dart';
import '../data/repositories/header_repo.dart';
import '../data/repositories/our_approach_repo.dart';
import '../data/repositories/our_solution_repo.dart';
import '../data/repositories/privacy_repo.dart';
import '../data/repositories/what_we_do_repo.dart';
import '../data/services/about_us_service.dart';
import '../data/services/blogs_service.dart';
import '../data/services/header_service.dart';
import '../data/services/our_approach_service.dart';
import '../data/services/our_solution_service.dart';
import '../data/services/privacy_service.dart';
import '../data/services/what_we_do_service.dart';
import '../main.dart';

void autoInjectInitializer() => autoInjector
  //*------home
  ..add(HomeDataSource.new)
  ..add(HomeRepository.new)
  ..add(HomeServices.new)
  //*------BannerInfoSection
  ..add(BannerInfoDataSource.new)
  ..add(BannerInfoRepository.new)
  ..add(BannerInfoServices.new)
  //*------what_we_do
  ..add(WhatWeDoDataSource.new)
  ..add(WhatWeDoRepository.new)
  ..add(WhatWeDoServices.new)
  //*------About Us
  ..add(AboutUsDataSource.new)
  ..add(AboutUsRepository.new)
  ..add(AboutUsServices.new)
  //*------Our Solutions
  ..add(OurSolutionsDataSource.new)
  ..add(OurSolutionsRepository.new)
  ..add(OurSolutionsServices.new)
  //*------Events
  ..add(EventsDataSource.new)
  ..add(EventsRepository.new)
  ..add(EventsServices.new)
  //*------Methodology
  ..add(MethodologyDataSource.new)
  ..add(MethodologyRepository.new)
  ..add(MethodologyServices.new)
  //*------HomeVideo

  ..add(HomeVideoDataSource.new)
  ..add(HomeVideoRepository.new)
  ..add(HomeVideoServices.new)
  //*------resources

  ..add(ResourcesDataSource.new)
  ..add(ResourcesRepository.new)
  ..add(ResourcesServices.new)

  //*------blogs
  ..add(BlogsDataSource.new)
  ..add(BlogsRepository.new)
  ..add(BlogsServices.new)
  //*------News
  ..add(NewsDataSource.new)
  ..add(NewsRepository.new)
  ..add(NewsServices.new)
  //*------OurApproach

  ..add(OurApproachDataSource.new)
  ..add(OurApproachRepository.new)
  ..add(OurApproachServices.new)
  //*------Header

  ..add(HeaderDataSource.new)
  ..add(HeaderRepository.new)
  ..add(HeaderServices.new)
  //*------why work with us

  ..add(WhyWorkWithUsDataSource.new)
  ..add(WhyWorkWithUsRepository.new)
  ..add(WhyWorkWithUsServices.new)

//*------Footer
  ..add(FooterDataSource.new)
  ..add(FooterRepository.new)
  ..add(FooterServices.new)

  //*------Our Services

  ..add(OurServiceDataSource.new)
  ..add(OurServiceRepository.new)
  ..add(OurServiceServices.new)

  //*------Our Services
  ..add(SolutionsServices.new)
  ..add(SolutionsDataSource.new)
  ..add(SolutionsRepository.new)

  //*------Career
  ..add(CareersServices.new)
  ..add(CareersDataSource.new)
  ..add(CareersRepository.new)

  //*------Our Partners
  ..add(PartnersServices.new)
  ..add(PartnersDataSource.new)
  ..add(PartnersRepository.new)
  //*------Contact Us
  ..add(ContactUsDataSource.new)
  ..add(ContactUsRepository.new)
  ..add(ContactUsServices.new)
  //*------Contact Us
  ..add(CookiesDataSource.new)
  ..add(CookiesRepository.new)
  ..add(CookiesServices.new)
  //*------Contact Us
  ..add(PrivacyDataSource.new)
  ..add(PrivacyRepository.new)
  ..add(PrivacyServices.new)
  //!-----( need to initialize before commiting)
  ..commit();
