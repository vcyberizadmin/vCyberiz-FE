class ApiConst {
  // ReCaptcha Key
  static const String reCaptchaKey = "6LeR0ZUpAAAAAIcZQMkqm_eFBHyw6oWXsH0j8NGu";
//--------------home ----------------------------
  static const String bannerInfoSectionEndPoint =
      "/api/banner?populate=carousel&populate=InfoSection";
  static const String whatWeDoEndPoint = "/api/what-we-do?populate=sec_gif";

  static const String aboutUsEndPoint = "/api/about-us?populate=*";
  static const String aboutUsOurValuesEndPoint =
      "/api/our-value?populate=sec_card.logo_img";
  static const String aboutUsHeaderEndPoint =
      '/api/about-us?populate[sec_bg]=true';
  static String relatedBlogsEndPoint =
      "/api/blog-posts?where[\$or][0][blog_categories][cid][\$in][0]=cyber-crime&where[\$or][1][blog_tags][tid][\$in][0]=...";
  static const String blogArticle1EndPoint = '/api/blog-posts/';
  static const String blogArticle2EndPoint =
      '?populate[sec_img]=true&populate[blog_author]=true&populate[blog_tags]=true&populate[blog_categories]=true&populate[sec_cta]=true&populate[blog_section][populate]=*';
  static const String popUpEndPoint =
      '/api/homepage-popups?populate[sec_links]=true';
  static const String aboutUsShieldEndPoint =
      '/api/about-us-shield?populate[sec_bg]=true';
  static const String aboutUsSecretEndPoint = '/api/our-secret';
  static const String aboutUsOurVisionEndPoint =
      '/api/our-mission-vision?populate=sec_bg&populate=sec_writings&populate=know_more_about_our_service&populate=know_more_about_our_service.cta_bg_img&populate=know_more_about_our_service.cta_link';
  static const String homeVideoEndPoint = "/api/video-section";
  static const String homeSectionsEndPoint = "/api/home-page?populate=sections";
  static const String searchEndPoint = "/multi-search";
  static const String blogsEndPoint =
      "/api/blog?populate=buttonLink&populate=blogs.img_url";
  static const String ourApproachEndPoint =
      "/api/our-approach?populate[approachHeader]=true&populate[cardList][populate][approach_card]=true&populate[card_navs]=true&populate[sec_bg]=true";
  static const String headerLoadingPoint = "/api/header-marquees";
  static const String methodologyEndPoint =
      "/api/methodology?populate=section_header&populate=methodologies";
  static const String ourSolutionsEndPoint =
      '/api/our-solution?populate=solutionAccordian.cta&populate=solutionAccordian.sectionLogo&populate=solutionAccordian.img_url';
  static const String headerEndPoint =
      "/api/header?populate=navs.navigations&populate=navs.cta&populate=navs.nav_with_inner_page&populate=navs.nav_with_inner_page.nav_sub_card&populate=navs.nav_with_inner_page.nav_sub_card.sec_sub_card&populate=navs.nav_with_inner_page.nav_sub_card.sec_sub_card.sec_cta&populate=brand_logo";
  static const String whyWorkWithUsEndPoint =
      "/api/why-work-with-us?populate=cards.card_img";
  static const String footerEndPoint =
      '/api/footer-area?populate[tryUs][populate][cta]=true&populate[tryUs][populate][sec_logo]=true&populate[siteMap][populate][brand][populate][link]=true&populate[siteMap][populate][brand][populate][sec_logo]=true&populate[siteMap][populate][connect][populate][link]=true&populate[siteMap][populate][connect][populate][sec_logo]=true&populate[siteMap][populate][platform][populate][referencesMap][populate][references]=true&populate[siteMap][populate][platform][populate][cta]=true&populate[siteMap][populate][company][populate][referencesMap][populate][references]=true&populate[siteMap][populate][company][populate][cta]=true&populate[siteMap][populate][withUs][populate][references]=true&populate[termsAndPolicies][populate][references]=true&populate[subscribe]=true';
  static const String ourServicesEndPoint =
      '/api/service?populate=titleSection&populate=achieves&populate=achieves.stats&populate=mainSection.services&populate=mainSection.services.sec_logo&populate=mainSection.services.cta&populate=mainSection.services.service_bg';
  static const String subscribeEndPoint = '/api/subscriptions';
  static const String contactUsHeaderEndPoint =
      '/api/contact-us?populate[text_area]=true&populate[sec_bg]=true&populate[sec_cta]=true';
  static const String contactUsBannerEndPoint =
      "/api/contact-us-banner?populate=sec_bg";
  static const String contactUsOurLocationsEndPoint =
      '/api/Contact-us-around-the-globe?populate[sec_card][populate]=sec_body';
  static const String contactUsSubmitEndPoint = '/api/form-submissions';
  static const String partnersHeaderEndPoint =
      '/api/partner-banner?populate[sec_bg]=true';
  static const String partnerstechnologyEndPoint =
      '/api/technology-partner?populate=sec_img';
  static const String partnersSecuringstrongerfutureEndPoint =
      '/api/securing-stronger-future?populate=sec_background&populate=partner_card&populate=partner_card.tab_head&populate=partner_card.tab_body&populate=partner_card.tab_body.sec_logo&populate=partner_card.tab_body.sec_cta';
  static const String blogsHeaderEndPoint =
      "/api/blog-banner?populate[sec_header][populate][sec_bg]=true";
  static const String blogsListEndPoint =
      '/api/blog-posts?populate=blog_tags&populate=blog_author&populate=blog_categories&populate=sec_cta&populate=sec_img&populate=thumbnail_img';
  static const String categoryEndPoint =
      '/api/category-blog?populate=blog_categories&populate=list_indicator';
  static const String tagsEndPoint = '/api/tag-blog?populate=blog_tags';
  static const String blogMarketingEndPoint =
      '/api/marketing-element?populate=sec_card&populate=sec_card.sec_img&populate=sec_card.sec_cta&populate=sec_popup_card&populate=sec_popup_card.sec_cta&populate=sec_popup_card.sec_logo';
  //--------------solutions----------------------------
  static const String solutionsWhatWeHaveDoneEndPoint =
      '/api/what-we-have-done?populate[body][populate][solution_card][populate][logo_img]=true';
  static const String solutionsWeOfferEndPoint =
      '/api/solutions-we-offer?populate[sec_button]=true&populate[solutions][populate][details]=true&populate[solutions][populate][sec_bg]=true&populate[solutions][populate][sec_logo]=true';
  static const String solutionsHeaderEndPoint =
      '/api/solution-header?populate[bg_img]=true';
  static const String solutionsHeaderDataEndPoint =
      '/api/cybersecurity-solution?populate=sec_banner&populate=sec_banner.sec_cta&populate=sec_banner.sec_img';
  static const String microsoftSecurityEndPoint =
      '/api/microsoft-security-solution?populate=sec_card&populate=sec_card.sec_img&populate=sec_card.sec_cta';
  static const String emergencyResponceEndPoint =
      '/api/emergency-response-solution?populate=sec_card&populate=sec_card.sec_img&populate=sec_card.sec_cta';
  static const String needHelpEndPoint =
      '/api/need-help-choosing?populate=section&populate=section.sec_cta&populate=section.sec_img';

  //--------------resources----------------------------
  static const String resourcesHeaderEndPoint =
      '/api/resource-hub-banner?populate=sec_bg_img';

  //--------------events----------------------------
  static const String eventsHeaderEndPoint =
      '/api/events-banner?populate=sec_body.sec_bg';
  static const String registerEventEndPoint = '/api/event-registration-forms';
  static const String registedDetailsEndPoint =
      '/api/event-registration?populate=sec_cta';
  static const String eventsListEndPoint =
      '/api/event-posts/?populate=sec_cta&populate=sec_img&populate=blog_author&populate=blog_categories&populate=blog_tags';
  static const String upcomingEventsListEndPoint =
      '/api/upcoming-event?populate[sec_body][populate][sec_bg]=true&populate[sec_body][populate][sec_cta]=true&populate[sec_body][populate][date_box]=true';
  static const String eventDetailsEndPoint =
      "?populate=sec_cta&populate=sec_img&populate=blog_author&populate=blog_categories&populate=blog_tags&populate=share_with_friends&populate=share_with_friends.sec_body.link&populate=share_with_friends.sec_body.sec_logo&populate=event_content.sec_img&populate=event_content.sec_cta";

  //--------------privacy policy----------------------------
  static const String privacyEndPoint =
      "/api/privacy-policy?populate[Privacy_Policy][populate][Priv_Policy_Points_List]=true&populate[Privacy_Policy][populate][Priv_Policy_Sub_Points][populate][Priv_Policy_Sub_List]=true";

  //--------------career----------------------------
  static const String careersHeaderEndPoint =
      '/api/career-lobby?populate[page_banner][populate][sec_bg]=true';
  static const String careerFilterEndPoint =
      '/api/job-posting-header?populate[sec_headerLogo]=true&populate[form_field_icons][populate][field_icon]=true&populate[sec_body][populate][sec_items]=true&populate[sec_body][populate][sec_logo]=true&populate[sec_buttons]=true';
  static const String careerListEndPoint =
      '/api/career-pages?populate[employment_types]=true&populate[skills]=true&populate[function]=true&populate[sec_cta]=true&populate[countries]=true&populate[zip_code]=true';

  static const String careerDetails1EndPoint = '/api/career-pages/';
  static const String careerDetails2EndPoint =
      '?populate[job_details][on][career.additional-info][populate][content_block]=true&populate[job_details][on][career.content-block][populate][bodyText]=true&populate[job_details][on][career.content-block-short][populate][items]=true&populate[job_details][on][global.content][populate]=true&populate[skills]=true&populate[employment_types]=true&populate[zip_code][populate][state][populate][country]=true';

  static const String uploadPdfEndPoint = "/api/upload";
  static const String submitResumeEndPoint = "/api/career-form-submissions";

  //--------------cookies policy----------------------------
  static const String cookiesEndPoint =
      "/api/cookie-policy?populate[cookies_content][populate][Cookies_sub_Points]=true";

  //--------------our service details----------------------------
  static const String serviceDetailsEndPoint =
      '?populate[inner_page][on][m365.banner][populate][0]=sec_banner.sec_cta&populate[inner_page][on][m365.banner][populate][1]=sec_banner.sec_img&populate[inner_page][on][m365.scope-of-service][populate][0]=sec_img&populate[inner_page][on][m365.scope-of-service][populate][1]=sec_accordion&populate[inner_page][on][m365.key-focus-areas][populate][0]=sec_bg_img&populate[inner_page][on][m365.key-focus-areas][populate][1]=sec_card.logo_img&populate[inner_page][on][m365.why-you-need-this-service][populate][0]=bg_img&populate[inner_page][on][m365.why-you-need-this-service][populate][1]=sec_card.sec_logo&populate[inner_page][on][m365.what-you-will-get][populate][0]=sec_bg_img&populate[inner_page][on][m365.what-you-will-get][populate][1]=sec_card.sec_logo&populate[inner_page][on][global.section-with-banner][populate][0]=sec_cta&populate[inner_page][on][global.section-with-banner][populate][1]=sec_img';
  static const String serviceOfferingsEndPoint =
      '/api/service-offering-card?populate=sec_card&populate=sec_card.sec_sub_card&populate=sec_card.sec_sub_card.sec_logo';
  static const String cyberMutinityEndPoint =
      '/api/service-offering-card-cma?populate=sec_card&populate=sec_card.sec_sub_card&populate=sec_card.sec_sub_card.sec_logo';

//--------------our services----------------------------
  static const String serviceheaderEndPoint =
      '/api/services-banner?populate=sec_bg';
  static const String directApproachEndPoint =
      '/api/the-direct-approach?populate=sec_card&populate=sec_card.logo_img&populate=bg_img';
  static const String ourServiceTabsEndPoint =
      '/api/our-services-tab-section?populate=section.tab_head&populate=section.tab_body&populate=section.tab_body.img_url&populate=section.tab_body.sub_section&populate=section.tab_body.sub_section.sec_cta';
//--------------news----------------------------
  static const String ebookList =
      '/api/e-book?populate=e_book_card&populate=e_book_card.sec_img&populate=e_book_card.sec_link';
  //--------------news----------------------------
  static const String newsHeaderEndPoint =
      '/api/news-banner?populate=sec_bg_img';
  static const String newsListEndPoint =
      '/api/news-posts?populate=blog_author&populate=blog_categories&populate=blog_tags&populate=sec_img&populate=sec_cta';
  static const String newsArticle1EndPoint = '/api/news-posts/';
  static const String newsArticle2EndPoint =
      '?populate[sec_img]=true&populate[blog_author]=true&populate[blog_tags]=true&populate[blog_categories]=true&populate[sec_cta]=true&populate[news_section][populate]=*';
}
