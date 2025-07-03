import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:vcyberiz/bloc/contact_us_bloc/contact_us_bloc.dart';
import 'package:vcyberiz/bloc/events_bloc/events_bloc.dart';
import 'package:vcyberiz/bloc/footer_bloc/footer_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_bloc.dart';
import 'package:vcyberiz/bloc/home_video_bloc/home_video_bloc.dart';
import 'package:vcyberiz/bloc/login/login_bloc.dart';
import 'package:vcyberiz/bloc/methodology_bloc/methodology_bloc.dart';
import 'package:vcyberiz/bloc/news_bloc/news_bloc.dart';
import 'package:vcyberiz/bloc/our_service_bloc/our_service_bloc.dart';
import 'package:vcyberiz/bloc/partners_bloc/partners_bloc.dart';
import 'package:vcyberiz/bloc/resources_bloc/resources_bloc.dart';
import 'package:vcyberiz/bloc/slider_bloc/slider_bloc.dart';
import 'package:vcyberiz/bloc/solutions_bloc/solutions_bloc.dart';
import 'package:vcyberiz/bloc/video_player_bloc/video_player_bloc.dart';
import 'package:vcyberiz/bloc/what_we_do_bloc/what_we_do_bloc.dart';
import 'package:vcyberiz/bloc/why_work_with_us_bloc.dart/why_work_with_us_bloc.dart';
import 'package:vcyberiz/data/data_source/banner_info_data_source.dart';
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
import 'package:vcyberiz/data/data_source/what_we_do_data_source.dart';
import 'package:vcyberiz/data/data_source/why_work_with_us_data_source.dart';
import 'package:vcyberiz/data/repositories/banner_info_repo.dart';
import 'package:vcyberiz/data/repositories/contact_us_repo.dart';
import 'package:vcyberiz/data/repositories/events_repo.dart';
import 'package:vcyberiz/data/repositories/footer_repo.dart';
import 'package:vcyberiz/data/repositories/home_video_repo.dart';
import 'package:vcyberiz/data/repositories/methodology_repo.dart';
import 'package:vcyberiz/data/repositories/news_repo.dart';
import 'package:vcyberiz/data/repositories/our_services_repo.dart';
import 'package:vcyberiz/data/repositories/partners_repo.dart';
import 'package:vcyberiz/data/repositories/resources_repo.dart';
import 'package:vcyberiz/data/repositories/solutions_repo.dart';
import 'package:vcyberiz/data/repositories/what_we_do_repo.dart';
import 'package:vcyberiz/data/repositories/why_work_with_us_repo.dart';

import '../bloc/about_us_bloc/about_us_bloc.dart';
import '../bloc/blogs_bloc/blogs_bloc.dart';
import '../bloc/careers_bloc/careers_bloc.dart';
import '../bloc/cookies_bloc/cookies_bloc.dart';
import '../bloc/headers_bloc/headers_bloc.dart';
import '../bloc/hover_bloc/hover_bloc.dart';
import '../bloc/our_approach_bloc/our_approach_bloc.dart';
import '../bloc/our_solutions_bloc/our_solutions_bloc.dart';
import '../bloc/privacy_bloc/privacy_bloc.dart';
import '../data/data_source/about_us_data_source.dart';
import '../data/data_source/blogs_data_source.dart';
import '../data/data_source/careers_data_source.dart';
import '../data/data_source/cookies_data_source.dart';
import '../data/data_source/header_data_source.dart';
import '../data/data_source/our_approach_data_source.dart';
import '../data/data_source/our_solutions_data_source.dart';
import '../data/data_source/privacy_data_source.dart';
import '../data/repositories/about_us_repo.dart';
import '../data/repositories/blogs_repo.dart';
import '../data/repositories/careers_repo.dart';
import '../data/repositories/cookies_repo.dart';
import '../data/repositories/header_repo.dart';
import '../data/repositories/home_repo.dart';
import '../data/repositories/our_approach_repo.dart';
import '../data/repositories/our_solution_repo.dart';
import '../data/repositories/privacy_repo.dart';

List<SingleChildWidget> providerList = <SingleChildWidget>[
  //*--------(Home bloc)
  BlocProvider<HomeBloc>(
      create: (context) =>
          HomeBloc(HomeRepository(dataSource: HomeDataSource()))),
  BlocProvider<HoverViewBloc>(
    create: (context) => HoverViewBloc(),
  ),
  BlocProvider<SliderBloc>(
    create: (context) => SliderBloc(BannerInfoRepository(
      dataSource: BannerInfoDataSource(),
    )),
  ),
  BlocProvider<WhatWeDoBloc>(
    create: (context) =>
        WhatWeDoBloc(WhatWeDoRepository(dataSource: WhatWeDoDataSource())),
  ),
  BlocProvider<AboutUsBloc>(
    create: (context) =>
        AboutUsBloc(AboutUsRepository(dataSource: AboutUsDataSource())),
  ),
  BlocProvider<VideoPlayerBloc>(
    create: (context) => VideoPlayerBloc(),
  ),
  BlocProvider<EventsBloc>(
    create: (context) =>
        EventsBloc(EventsRepository(dataSource: EventsDataSource())),
  ),
  BlocProvider<OurSolutionsBloc>(
    create: (context) => OurSolutionsBloc(
        OurSolutionsRepository(dataSource: OurSolutionsDataSource())),
  ),
  BlocProvider<MethodologyBloc>(
    create: (context) => MethodologyBloc(
        MethodologyRepository(dataSource: MethodologyDataSource())),
  ),
  BlocProvider<BlogsBloc>(
    create: (context) =>
        BlogsBloc(BlogsRepository(dataSource: BlogsDataSource())),
  ),
  BlocProvider<NewsBloc>(
    create: (context) => NewsBloc(NewsRepository(dataSource: NewsDataSource())),
  ),
  BlocProvider<HeadersBloc>(
    create: (context) => HeadersBloc(
        HeaderRepository(dataSource: HeaderDataSource()),
        context.read<HomeBloc>()),
  ),
  BlocProvider<HomeVideoBloc>(
    create: (context) => HomeVideoBloc(
      HomeVideoRepository(dataSource: HomeVideoDataSource()),
    ),
  ),
  BlocProvider<OurApproachBloc>(
    create: (context) => OurApproachBloc(
        OurApproachRepository(dataSource: OurApproachDataSource())),
  ),

  //*--------(why work with us bloc)
  BlocProvider<WhyWorkWithUsBloc>(
      create: (context) => WhyWorkWithUsBloc(
          WhyWorkWithUsRepository(dataSource: WhyWorkWithUsDataSource()))),
  BlocProvider<FooterBloc>(
      create: (context) =>
          FooterBloc(FooterRepository(dataSource: FooterDataSource()))),
  //*-------Our service bloc
  BlocProvider<OurServiceBloc>(
      create: (context) => OurServiceBloc(
          OurServiceRepository(dataSource: OurServiceDataSource()))),
  //*-------Solutions bloc
  BlocProvider<SolutionsBloc>(
      create: (context) => SolutionsBloc(
          SolutionsRepository(dataSource: SolutionsDataSource()))),
  //*-----------Partners bloc
  BlocProvider<PartnersBloc>(
      create: (context) =>
          PartnersBloc(PartnersRepository(dataSource: PartnersDataSource()))),
  //*-----------Careers bloc
  BlocProvider<CareersBloc>(
      create: (context) =>
          CareersBloc(CareersRepository(dataSource: CareersDataSource()))),
//*-----------contact us bloc
  BlocProvider<ContactUsBloc>(
      create: (context) => ContactUsBloc(
          ContactUsRepository(dataSource: ContactUsDataSource()))),
  //*-----------Cookies bloc
  BlocProvider<CookiesBloc>(
      create: (context) =>
          CookiesBloc(CookiesRepository(dataSource: CookiesDataSource()))),
  //*-----------Privacy bloc
  BlocProvider<PrivacyBloc>(
      create: (context) =>
          PrivacyBloc(PrivacyRepository(dataSource: PrivacyDataSource()))),
  BlocProvider<ResourcesBloc>(
      create: (context) => ResourcesBloc(
          ResourcesRepository(dataSource: ResourcesDataSource()))),
  BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
];
