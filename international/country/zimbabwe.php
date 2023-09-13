<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="Lovely Professional University" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<link rel="preconnect" href="css/images/bhutan/breadcrumbmask.png" />
<link rel="dns-prefetch" href="css/images/bhutan/breadcrumbmask.png" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../../assets/css/bootstrap.css" />
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

<link rel="stylesheet" href="../../assets/style.css" />
<link rel="stylesheet" href="../../assets/css/dark.css" />
<link rel="stylesheet" href="../../assets/css/swiper.css" />
<link rel="stylesheet" href="../../assets/css/font-icons.css" />
<link rel="stylesheet" href="../../assets/css/fonts/montserrat/Montserrat.css" />
<link rel="stylesheet" href="../../assets/css/animate.css" />
<link rel="stylesheet" href="../../assets/css/magnific-popup.css" />
<link rel="stylesheet" href="../../assets/css/responsive.css" />
<link rel="stylesheet" href="../../assets/css/custom.css" />
<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="css/country-specific-custom.css">
<script src="../../assets/js/lazysizes.min.js" async></script>

<script type="text/javascript" src="../../assets/js/jquery.js"></script>
<script type="text/javascript" src="../../assets/js/plugins.js" async></script>
<script async src="https://www.googletagmanager.com/gtag/js?id=G-WKLQCVXZ47"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  //gtag('config', 'G-WKLQCVXZ47');
  gtag('config', 'G-WKLQCVXZ47',{ 'debug_mode':true });
</script>
<meta name="facebook-domain-verification" content="d74i0evfzxh0cwgidur9wie8r8f84t" />
<meta name="facebook-domain-verification" content="4j6ls5p9jvwsbb177etbiga8sgf1tu" />

<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-P8ZP9K2');
function gtag(){dataLayer.push(arguments);}
</script>
<script>

	
	//Log UTM per session
	ps_GTMLogUTM();

	$(document).ready(function(){
		
		if(String(window.location.pathname).startsWith('/programmes/')){
			$(document).ajaxSuccess(function( event, request, settings ) {
				if(String(settings.url).endsWith('api/programsearch/GetProgramDetail')){
					
					window.dataLayer.push(function() {
						this.reset();
					});
					
					ps_GTMInit();
				}
			});
			
			//allow dataLayer to reset
			setTimeout(()=>{
				//setup programme pages GTM events
				ps_GTMProgramPages();
			},500);
		}else{
			ps_GTMInit();
		}
			
		//setup general GTM events
		ps_GTMGeneralPages();
		
	});
	
	function ps_GTMInit(){
		//Page view GTM
		ps_GTMLogView();
			
		//Log Device per session
		ps_GTMLogDevice();
	}
	
	function ps_GTMProgramPages(){
		var sections = [
			{name:'Programme Details',id:'#areaPD'},
			{name:'Career Overview',id:'#ps-curriculum'},
			{name:'Curriculum',id:'#curr'},
			{name:'Fee',id:'#ps-fee'},
			{name:'Scholarships',id:'#ps-scholarships'},
			{name:'Programme Outcomes',id:'#ps-career-prospects'},
			{name:'How to Apply',id:'#ps-how-to-apply'},
			{name:'Important Dates',id:'#ps-important-dates'}
		];
		
		/*
		https://stackoverflow.com/a/14092859
		https://stackoverflow.com/a/31223774
		*/
		var lastScrollTop = window.pageYOffset || document.documentElement.scrollTop;
		$(window).scroll(function() {
			let searchSections= sections.slice();
			
			//reverse the search array so that the section currently being viewed is identified correctly.
			var st = window.pageYOffset || document.documentElement.scrollTop;/* https://github.com/qeremy/so/blob/master/so.dom.js#L426 */
			if (st > lastScrollTop){
				// downscroll 
				searchSections = searchSections.reverse();
			} 
			lastScrollTop = st <= 0 ? 0 : st;
			
			//detect when scroll stops
			clearTimeout($.data(this, 'scrollTimer'));
			$.data(this, 'scrollTimer', setTimeout(function() {
				// scroll stop
				for(let x of searchSections){
					if(ps_ElementInView(x.id,false)){
						ps_GTMClick('Programme Details','Section Viewed',x.name,'Scroll');
						//console.log(x.name);
						break;
					}
				}
			}, 250));
		});
		
		//Program Menu
		$('#course-filter a[ddl]').click(function(e){
			let title = $(this).text().replace(/\s+/g, ' ').trim(); 
			
			ps_GTMClick('Programme Details','Section Viewed',title,'Click');
		});
		
		//Career Overview
		$('#pathwaydiv .career-pros-circle,#ps-curriculum-mobile .career-pros-circle').click(function(e){
			let title = $(this).closest('.FlipPanel').attr('title').trim();
			
			ps_GTMClick('Career Overview','Tab Viewed',title,'Click');
		});
		
		//Curriculum Year
		$('#degree_year a[role=tab]').click(function(e){
			let title = $(this).text().replace(/\s+/g, ' ').trim(); 
			//alert(title);
			
			ps_GTMClick('Curriculum','Year Tab Viewed',title,'Click');
		});
		
		//Curriculum Term
		$('#corecourse').on('click','.toggle[data-value]',function(e){
			let title = $(this).find('.togglet').text().replace(/\s+/g, ' ').trim(); 
			let code = $(this).attr('data-value');
			let term = $($(this).parent('div').find('h4')[0]).text().replace(/\s+/g, ' ').trim();
			
			ps_GTMClick('Curriculum',`Accordian Viewed | ${term} | ${code}`,title,'Click');
		});
		
		//Curriculum Electives Offered In Curriculum
		$('#elect').on('click','.tabs-title>a',function(e){
			let title = $(this).text().replace(/\s+/g, ' ').trim();
			
			ps_GTMClick('Curriculum','Elective Tab Viewed',title,'Click');
		});
		
		//Fee Tab
		$('#example-tabs1 a[role=tab]').click(function(e){
			let title = $(this).text().replace(/\s+/g, ' ').trim();
			
			ps_GTMClick('Fee Details','Phase Viewed',title,'Click');
		});
		
		//Scholarships
		$('#scholarship1').on('click','>.toggle',function(e){
			let title = $(this).find('.togglet').text().replace(/\s+/g, ' ').trim();
			
			ps_GTMClick('Scholarships','Scholarship detail toggle',title,'Click');
		});
		
		//Programme Outcomes Tabs
		$('#features a[role=tab]').click(function(e){
			let title = $(this).text().replace(/\s+/g, ' ').trim();
			
			ps_GTMClick('Programme Outcomes','Tab Viewed',title,'Click');
		});
		
		//How to apply now
		$('#Apply').on('click','#Launchh',function(e){
			ps_GTMClick('How to apply','Apply Now','Apply Now','Click');
		})
	}

	/* https://stackoverflow.com/a/488073 */
	function ps_ElementInView(element, fullyInView) {
		if($(element).length < 1){
			return false;
		}
		
        var pageTop = $(window).scrollTop();
        var pageBottom = pageTop + $(window).height();
        var elementTop = $(element).offset().top;
        var elementBottom = elementTop + $(element).height();

        if (fullyInView === true) {
            return ((pageTop < elementTop) && (pageBottom > elementBottom));
        } else {
            return ((elementTop <= pageBottom) && (elementBottom >= pageTop));
        }
    }

	function ps_GTMClick(section,eventCategory,eventLabel,eventAction){
		let obj = {event:section,eventCategory:eventCategory,eventLabel:eventLabel,eventAction:eventAction};
		//alert(JSON.stringify(obj))
		dataLayer.push(obj);
	}
	
	function ps_GTMLogView(){
		let ref = document.referrer;
		let hostName = window.location.hostname;
		let pageAddress = window.location.pathname;
		
		let pageTitle = $('head title').text().trim();
		
		dataLayer.push({pageview:{pageTitle:pageTitle,pageReferrer:ref,hostName:hostName,pageAddress:pageAddress}});
	}
	
	function ps_GTMLogUTM(){
		
		const urlParams = new URLSearchParams(window.location.search);
		const ref = document.referrer;
		
		let source= urlParams.get('utm_source');
		let medium= urlParams.get('utm_medium');
		let campaign= urlParams.get('utm_campaign');
		let term= urlParams.get('utm_keyword');
		
		if(sessionStorage.getItem('ps_gtm_utm') == null){
		
			if(source == null){
				if(ref.trim()==''){
					source = 'Direct';
				} else {
					source = 'Organic';
				}
			}
			
			const traffic = {trafficSource:source,trafficMedium:medium,trafficCampaign:campaign,trafficTerm:term};
			
			sessionStorage.setItem('ps_gtm_utm',JSON.stringify(traffic));
			
			dataLayer.push({traffic:traffic});
		}
	}
	
	/* http://detectmobilebrowser.com/mobile */
	function ps_GTMCheckMobile(){
		const a = navigator.userAgent||navigator.vendor||window.opera;
		
		const isMobile = (/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4)));
		
		return isMobile;
	}
	
	function ps_GTMLogDevice(){
		
		'use strict';
		
		const pushInfo = (geoLat,geoLong)=>{
			
			let connection = navigator.connection || navigator.mozConnection || navigator.webkitConnection;
			
			$.getJSON('https://api64.ipify.org/?format=json',function(d){
				
				const user = {
					userDevice:(navigator.maxTouchPoints>0 && ps_GTMCheckMobile()?'Mobile':'Desktop'),
					userViewPort:`${window.innerWidth} x ${window.innerHeight}`,
					userIP:d.ip,
					userLang:navigator.language,
					userAgent:navigator.userAgent,
					network:(connection?connection.effectiveType:'unknown'),
					geoLat:geoLat,
					geoLong:geoLong
				};
				sessionStorage.setItem('ps_gtm_device',JSON.stringify(user));
				dataLayer.push({user:user});
			});
		};
		
		const geoSuccess = (position)=>{
			const latitude  = position.coords.latitude;
			const longitude = position.coords.longitude;
			
			pushInfo(latitude,longitude);
		};
		
		const geoError = ()=>pushInfo(null,null);
		
		if(sessionStorage.getItem('ps_gtm_device') == null){
			
			if(!navigator.geolocation) {
				geoError();
			} else {
				navigator.geolocation.getCurrentPosition(geoSuccess, geoError);
			}
			
		}
	}
	
	function ps_GTMGeneralPages(){
		
		console.log('GTM init '+ (new Date()).toString());
		
		//Main Menu GTM Click
		$("#primary-menu a").click(function() {
			let mlink = $(this).text().trim();
			
			let section = '';
			if($(this).closest('.mega-menu-title').length>0 &&
			$(this).closest('.mega-menu-title').find('>.mhead').length > 0
			){
				section=$($(this).closest('.mega-menu-title').find('>.mhead')[0]).text().trim();
			}
			
			let header = '';
			if($(this).closest('[data-gtm-title]').length > 0){
			header=$(this).closest('[data-gtm-title]').attr('data-gtm-title').trim();
			}
			
			let sep = (header!=''&&section!='')?' | ':'';
			
			//console.log(`${header}${sep}${section} | ${mlink}`);
			
			ps_GTMClick('Header Click',`Header | ${header}${sep}${section}`,mlink,'Click');
		});
		
		//Footer GTM Click
		$(".ps-main-footer-menu a").click(function() {
			let mlink = $(this).text().trim();
			
			let section = '';
			if($(this).closest('section').find('>.ps-menu-title').length > 0
			){
				section=$($(this).closest('section').find('>.ps-menu-title')[0]).text().trim();
			}
			
			let sep = (section!='')?' | ':'';
			
			//console.log(`Footer${sep}${section} | ${mlink}`);
			
			ps_GTMClick('Footer Click',`Footer${sep}${section}`,mlink,'Click');
		});
		
		//Footer Copyright GTM Click
		$(".copyrights-menu.fc-menu a").click(function() {
			let mlink = $(this).text().trim();
			
			ps_GTMClick('Footer Click',`Secondary Menu`,mlink,'Click');
		});
		
		//Banner click
		$('[data-gtm-section="banner"]').click(function(){
			let type=$(this).attr('data-gtm-type');
			let title=$(this).attr('data-gtm-title');
			
			ps_GTMClick('Banner Click',`Banner ${type}`,title,'Click');
		});
		
		//Banner apply button click
		$('.apply-now-button a[data-gtm-title]').click(function(){
			let title=$(this).attr('data-gtm-title');
			
			ps_GTMClick('Banner Click',`Think Big`,title,'Click');
		});
		
		//All pages apply button click
		$('[data-gtm-ps-applynow]').click(function(){
			let title=$(this).attr('data-gtm-ps-applynow');
			
			ps_GTMClick('Apply Now Click','Apply Now',title,'Click');
		});
		
		//Sticky click
		$('[data-gtm-section="sticky"]').click(function(){
			let title=$(this).text().trim();
			
			ps_GTMClick('Sticky Click',`Sticky Menu`,title,'Click');
		});
		
		//Read More/See More click
		$('[data-gtm-section="readmore"]').click(function(){
			let title=$(this).closest('.entry').find('.entry-title');
			title = title.length>0?$(title[0]).text().trim():'';
			
			let header=$(this).attr('data-gtm-title').trim();
			
			ps_GTMClick('Readmore Click',header,title,'Click');
		});
		
		//Happening portfolio
		$('[data-gtm-section="A HAPPENING CAMPUS"]').click(function(){
			let type=$(this).attr('data-gtm-type');
			let title=$(this).attr('data-gtm-title');
			
			ps_GTMClick('A HAPPENING CAMPUS',`Happening ${type}`,title,'Click');
		});
		
		//campus portfolio
		$('[data-gtm-section="Campus Portfolio"]').click(function(){
			let type=$(this).attr('data-gtm-type');
			let title=$(this).attr('data-gtm-title');
			
			ps_GTMClick('Campus Portfolio',`Campus ${type}`,title,'Click');
		});
		
		//Testimonials
		$('[data-gtm-section="Student Testimonials"]').click(function(){
			let type=$(this).attr('data-gtm-type');
			let title=$(this).attr('data-gtm-title');
			
			ps_GTMClick('Student Testimonials',`Testimonial ${type}`,title,'Click');
		});
		
		//Event notifications
		$('[data-gtm-section="Event Notification"]').click(function(){
			let title=$(this).attr('data-gtm-title');
			
			ps_GTMClick('Event Notification',`Event Notification`,title,'Click');
		});
		
		//Newsletter subscription
		$("#widget-subscribe-form").bind('ps_gtm_subscribe_email',function(e,email){
			ps_GTMClick('Newsletter',`Subscribe email`,email,'Submit');
		});
		
		//Toast notification click
		$('#bt-notification').bind('ps_gtm_toast_click',function(e,title){
			ps_GTMClick('Toast Notification',`Toast Link`,title,'Click');
		});
		
	}
</script>



<script>
!function(f,b,e,v,n,t,s)
{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};
if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];
s.parentNode.insertBefore(t,s)}(window, document,'script',
'https://connect.facebook.net/en_US/fbevents.js');
fbq('init', '507132620377537');
fbq('track', 'PageView');
</script>
<noscript><img height=""1"" width=""1"" style=""display:none""
src=""https://www.facebook.com/tr?id=507132620377537&ev=PageView&noscript=1""
/></noscript>




<script src="https://cdnt.netcoresmartech.com/smartechclient.js">
</script>
<script>       
 smartech('create', 'ADGMOT35CHFLVDHBJNIG50K9689MO9BEINHG654A27UKHE5JMR0G' );       
 smartech('register', 'd4eadf31baacc32de5e71b5db339e514');      
 smartech('identify', '');    
</script>
<script type="text/javascript">
    (function(c,l,a,r,i,t,y){
        c[a]=c[a]||function(){(c[a].q=c[a].q||[]).push(arguments)};
        t=l.createElement(r);t.async=1;t.src="https://www.clarity.ms/tag/"+i;
        y=l.getElementsByTagName(r)[0];y.parentNode.insertBefore(t,y);
    })(window, document, "clarity", "script", "h9c6eqysbs");
</script>
<script type="text/javascript">(function(c,l,a,r,i,t,y){c[a]=c[a]||function(){(c[a].q=c[a].q||[]).push(arguments)};t=l.createElement(r);t.async=1;t.src="https://www.clarity.ms/tag/"+i+"?ref=gtm2";y=l.getElementsByTagName(r)[0];y.parentNode.insertBefore(t,y);})(window,document,"clarity","script","h9c6eqysbs");</script> 
<title>Best University to Study in India for Zimbabwe Students - LPU</title>
<meta name="description" content="LPU is a private university, situated in Punjab, India. LPU offers various internation courses for Zimbabwe Students Diploma, Bachelor, Master, PhD with upto 90% scholarship.LPU International students team facilitate Study in india Visa and provides world class facilities in India Campus for Zimbabwe students." />
</head>
<body class="page-transition stretched home-bg" data-loader="2" data-animation-in="fadeIn" data-speed-in="1500" data-animation-out="fadeOut" data-speed-out="800">

<div id="wrapper" class="clearfix">

<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-P8ZP9K2" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>


<style>
	.lpu-hello-bar {
		background-color: #fccb92;
		color: #000000;
		padding: 9px 10px;
		text-align: center;
	}

	.facebook-messenger {
		width: 14px;
		margin-top: 9px;
		color: #666
	}

	.facebook-messenger:hover {
		color: filter: invert(27%) sepia(51%) saturate(2878%) hue-rotate(346deg) brightness(104%) contrast(97%);
	}

	.font18 {
		font-size: 18px;
	}

	.section-mt40 {
		margin-top: 40px !important;
	}

	.font15b {
		font-size: 16px;
		font-weight: bold !important;
	}
#top-bar .top-bar-apply {
        display: none;
        transition: all .3s ease-in-out;
    }
	@media(max-width:430px) {
		.font18 {
			font-size: 16px;
		}

		.font15b {
			font-size: 14px;
			font-weight: bold !important;
		}
	}

	@media(max-width:800px) {
#top-bar .top-bar-apply {
        display: inline-block;
    }
		.lpu-hello-bar {
			position: static !important;
		}

		#top-bar {
			margin-top: 0;
		}

		.section-mt40 {
			margin-top: 0 !important;
		}

	}



	#header.sticky-header #header-wrap {
		top: 0 !important;
	}

	#page-menu.sticky-page-menu #page-menu-wrap,
	.main-nav-scrolled {
		top: 60px !important;
	}
 
</style>
<div class="lpu-hello-bar" id="lpu-bar">
<div class="lpu-bar-grid">
<div class="lpu-top-bar col-lg-11 pa0">
<div class="oc-item">
<div class="font-f" id="topbartext">
<i class="icon icon-bullhorn" aria-hidden="true"></i>
<span>Secure your admission with maximum scholarship</span> <b class="font15b">
<a class="hide-on-lp" href="https://admit.lpu.in/" style="color:#000000 !important;" target="_blank"> Apply Now</a></b>
<br>
</div>
</div>
</div>
<div class="lpu-social-logo col-lg-1 pa0">
<a href="css/images/bhutan/breadcrumbmask.png"><img src="../../images/logo/social-logo-lpu-big.svg" /></a>
</div>
</div>
</div>

<div id="top-bar" class="ps-top-bar slider-top-link">
<div class="container-fluid clearfix">
<div class="col_half nobottommargin mr0 fright">
<div class="top-links dark">
<ul>
<li class="hidden-xs hidden-xxs hidden-sm hidden-md"><a href="https://ums.lpu.in/lpuums" target="_blank">Parent's Login</a></li>
<li class="hidden-xs hidden-xxs hidden-sm hidden-md"><a href="../../jobs/index.html" class="nest-result-old applylnk">Jobs at LPU</a></li>
<li class="hidden-xs hidden-xxs hidden-sm"><a href="http://happenings.lpu.in/" target="_blank">Happenings</a></li>
<li class="hidden-xs hidden-xxs hidden-sm"><a href="https://conferences.lpu.in/" target="_blank">
Conferences </a> </li>
<li class="hidden-xs hidden-xxs hidden-sm"><a href="../../international-opportunities.php" target="_blank">Study Abroad</a></li>
<li class="hidden-xs hidden-xxs hidden-sm"><a class="nest-result-old applylnk" href="https://nest.lpu.in/main.aspx" target="_blank">LPUNEST</a>
</li>
<li class="hidden-xs hidden-xxs hidden-sm"><a href="../index.html" target="_blank">International Admissions </a></li>
<li class="hidden-xs hidden-xxs hidden-sm"><a href="https://www.lpuonline.com/" target="_blank">Online Education</a></li>
<li class="hidden-xs hidden-xxs hidden-sm"><a href="https://www.lpude.in/" target="_blank">Distance
Education</a></li>
<li class="hidden-lg hidden-md"><a href="../../academics/index.html">Academics</a></li>
<li class="hidden-lg hidden-md"><a href="../../admission/admissions.php" target="_blank">Admissions</a></li>
<li class="hidden-lg hidden-md"><a href="../../placements.php">Placements</a></li>
<li class="top-bar-apply"><a href="https://admission.lpu.in/" class="nest-result-old" target="_blank">Apply Now</a></li>

<li class="hidden-xs hidden-xxs hidden-sm"><a href="../contact-us.php">Contact Us</a></li>

</ul>
</div>
</div>

</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$("#oc-posts-top-bar").owlCarousel({
			margin: 20,
			autoplayTimeout: 5000,
			loop: true,
			nav: false,
			navText: ['<i class="icon-angle-left"></i>', '<i class="icon-angle-right"></i>'],
			autoplay: true,
			autoplayHoverPause: true,
			dots: false,
			responsive: {
				0: {
					items: 1
				},
				600: {
					items: 1
				},
				1000: {
					items: 1
				},
				1200: {
					items: 1
				}
			}
		});

	});
</script><style>
    .sp-active {
        color: #f68121;
    }

    .sticky-bar {
        display: none !important;
    }

    #header.sticky-header:not(.static-sticky) #primary-menu>ul>li>.mega-menu-content,
    #header.sticky-header:not(.static-sticky) #primary-menu>ul>li.mega-menu>.mega-menu-content {
        top: 120px;
    }


    #logo img {
        height: 120px;
    }

    #logo {
        background: #fff;
        margin-top: -34px;
    }

    #top-bar {
        /* margin-top: 54px; */
        border-bottom: 1px solid #EEE !important;
        z-index: 9 !important;
        height: 35px;
        line-height: 17px;
    }

    #header.sticky-header:not(.static-sticky),
    #header.sticky-header:not(.static-sticky) #header-wrap,
    #header.sticky-header:not(.static-sticky):not(.sticky-style-2):not(.sticky-style-3) #logo img {
        height: 120px;
    }

    #header.sticky-header:not(.static-sticky) #primary-menu>ul>li>a {
        padding-top: 50px;
        padding-bottom: 48px;
    }

    #header.sticky-header:not(.static-sticky) #top-search,
    #header.sticky-header:not(.static-sticky) #top-cart,
    #header.sticky-header:not(.static-sticky) #side-panel-trigger {
        margin-top: 50px !important;
    }

    #header.sticky-header #logo {
        margin-top: 0;
    }

    .lpu-bar-grid {
        display: flex;
        align-items: center;

    }

    .lpu-social-logo {
        display: flex;
        justify-content: end;
    }

    .lpu-social-logo img {
        width: 120px;
    }

    .academics-border-right ul:first-child {
        border-right: 1px solid #F68121 !important;
    }

    #page-menu.sticky-page-menu #page-menu-wrap,
    .main-nav-scrolled {
        top: 120px !important;
    }

    @media(max-width:1370px) {
        .lpu-top-bar .font15b {
            font-size: 14px;
        }
    }



    @media(max-width:1200px) {
        /* #top-bar {
            margin-top: 61px;
        } */
    }

    @media(max-width:991px) {
        .lpu-social-logo {
            display: none;
        }

        .lpu-top-bar {
            width: 100%;
        }

        .top-links-mobile {
            text-align: center;
            float: none !important;
            display: inline-block;
            width: 100% !important;
        }

        .top-links-mobile .top-links {
            float: none;
        }

        .top-links-mobile .top-links ul li {
            float: none;
            display: inline-block;
        }

        #logo {
            height: 120px;
        }

        #top-search a,
        #top-cart,
        #side-panel-trigger {
            margin: 52px 0;
        }
    }

    @media (max-width: 770px) {
        #top-bar {
            margin-top: 0;
        }
    }

    @media (max-width: 580px) {

        #top-search a,
        #top-cart,
        #side-panel-trigger {
            margin: 42px 0;
        }
    }

    .academics-border-right ul:first-child {
        border-right: 1px solid #F68121 !important;
    }

    #primary-menu ul ul li>a {
        font-size: 13px;
        line-height: 18px !important;
    }

    .sp-active {
        color: #f68121;
    }

    #primary-menu ul li .mega-menu-content.style-2 ul.mega-menu-column>li.mega-menu-title>a.gc-menu-title:hover {
        color: #444 !important;
    }

    .navi-logo {
        height: 16px;
        width: auto;
    }

    #top-search,
    #top-cart {
        float: left !important
    }

    .invertbody {
        -webkit-filter: invert(100%);
        -moz-filter: invert(100%);
        -o-filter: invert(100%);
        -ms-filter: invert(100%);
    }
    .invertbody img {
        -webkit-filter: invert(100%);
        -moz-filter: invert(100%);
        -o-filter: invert(100%);
        -ms-filter: invert(100%);
    }

    .invertbody #logo img {
        -webkit-filter: invert(100%);
        -moz-filter: invert(100%);
        -o-filter: invert(100%);
        -ms-filter: invert(100%);
    }

    .invertbody #slider {
        filter: invert(100%);
    }

    #top-cart a i {
        line-height: 0;
    }

    #top-cart .invert-img {
        width: 18px !important;
        margin-top: -22px;
        cursor: pointer;
    }

    .sticky-header #top-cart .invert-img {
        margin-top: -4px;
    }

    .apply-now-menu {
        background: #f68220;
        display: block;
    }

    .border-menu-desktop {
        border-bottom: 2px solid #F68121 !important;
    }

    .border-menu-mobile {
        border-bottom: 2px solid transparent !important;
    }

    .apply-now-menu a {
        color: #fff !important;
    }

    @media (max-width: 991px) {
        .academics-border-right ul:first-child {
            border-right: transparent !important;
        }

        .border-menu-desktop {
            border-bottom: 2px solid transparent !important;
        }

        .border-menu-mobile {
            border-bottom: 2px solid #F68121 !important;
        }

        #primary-menu ul li .mega-menu-content.style-2>ul>li.mega-menu-title>a {
            height: 100% !important;
        }

        #primary-menu ul li a,
        #primary-menu ul li .main-links {
            padding: 30px 2px;
        }
    }
</style>
<script src="../../js/speak.js"></script>
<header id="header" class="full-header ps-header" data-responsive-class="not-dark">
<div id="header-wrap">
<div class="container clearfix">
<div id="primary-menu-trigger"><i class="icon-reorder"></i>
</div>
<div id="logo">
<a href="css/images/bhutan/breadcrumbmask.png" class="standard-logo" data-sticky-logo="//www.lpu.in/images/logo/logo-media.svg" data-dark-logo="//www.lpu.in/images/logo/logo-dark.svg" data-mobile-logo="//www.lpu.in/images/logo/logo-media.svg"><img src="../../images/logo/logo.svg" alt="LPU Logo" width="auto" height="auto" /></a>
<a href="css/images/bhutan/breadcrumbmask.png" class="retina-logo" data-sticky-logo="//www.lpu.in/images/logo/logo-media@2x.svg" data-dark-logo="//www.lpu.in/images/logo/logo-dark.svg" data-mobile-logo="//www.lpu.in/images/logo/logo-media@2x.svg"><img width="auto" height="auto" src="../../images/logo/logo-media@2x.svg" alt="LPU Logo"></a>
</div>
<nav id="primary-menu">
<ul>
<li><a href="zimbabwe.php#">
<div>Home</div>
</a>
</li>
<li class="mega-menu"><a href="zimbabwe.php#" class="border-menu-mobile">
<div class="border-menu-desktop">International Admissions</div>
</a>
<div class="mega-menu-content style-2 clearfix">
<ul class="mega-menu-column col-lg-3">
<li class="mega-menu-title">
<a class="gc-menu-title">
<div>Get Started</div>
</a>
<ul>
<li>
<a href="../how_to_apply.php">
<div>How to Apply</div>
</a>
</li>
<li>
<a href="https://admit.lpu.in">
<div>Apply Online</div>
</a>
</li>
<li>
<a href="../scholarship.php">
<div>Scholarship</div>
</a>
</li>
<li>
<a href="../study-in-india-scholarship.php">
<div>Govt. of India Scholarship </div>
</a>
</li>
<li>
<a href="../english-language-requirement.php">
<div>English Language Requirement</div>
</a>
</li>
<li>
<a href="../how_to_pay.php">
<div>How to Pay</div>
</a>
</li>
<li>
<a href="../../events/freshmeninduction/reporting.aspx" target="_blank">
<div class="sp-active">Reporting and Induction </div>
</a>
</li>
<li>
<a href="../booklet_and_forms.php">
<div>Admission Guidelines</div>
</a>
</li>
<li>
<a href="../across_globe.php">
<div>Our Global Representatives</div>
</a>
</li>
<li>
<a href="../../OnlineAdmission/LetterAuthentication.aspx">
<div>Admission Letter Authentication</div>
</a>
</li>
<li><a href="../admission_related_faqs.php">
<div>Admission Related FAQs</div>
</a> </li>
</ul>
</li>
</ul>
<ul class="mega-menu-column col-lg-3">
<li class="mega-menu-title">
<a>
<div>Regular Programme</div>
</a>
<ul>
<li>
<a href="../programmes/all/Grade&#32;10th&#32;(O&#32;Level)">
<div>Diploma (after O level)</div>
</a>
</li>
<li>
<a href="../programmes/all/Grade&#32;12th&#32;(A&#32;Level)">
<div>Bachelor Degree (after A level)</div>
</a>
</li>
<li>
<a href="../programmes/all/Graduation">
<div>Master Degree (after Graduation)</div>
</a>
</li>
<li>
<a href="../programmes/all/Graduation">
<div>Ph.D. (after Post Graduation)</div>
</a>
</li>

</ul>
</li>
</ul>
<ul class="mega-menu-column col-lg-3">
<li class="mega-menu-title">
<a>
<div>Short Term Programme</div>
</a>
<ul>
<li><a href="../english-language-programme.php">
<div>English Language Programmes</div>
</a></li>
<li>
<a href="../study_india_programme.php">
<div>Study India Programmes</div>
</a>
</li>
<li>
<a href="../study_abroad_programme.php">
<div>Term Exchange Programmes</div>
</a>
</li>
<li>
<a href="../summer_school/index.php">
<div>International Summer School Programmes</div>
</a>
</li>

</ul>
</li>
</ul>
<ul class="mega-menu-column col-lg-3">
<li class="mega-menu-title">
<a>
<div>Other Links</div>
</a>
<ul>
<li><a href="../country.php">
<div>Country-Specific Information</div>
</a></li>
<li><a href="../accommodation.php">
<div>Residential Facilities</div>
</a></li>
<li><a href="../general-faq.php">
<div>Joining Related FAQs</div>
</a> </li>
<li><a href="../visa-frro-faq.php">
<div>VISA/FRRO Related FAQs</div>
</a> </li>
<li><a href="../general_information_related_to_visa.php">
<div>Visa Requirement and Guidelines</div>
</a> </li>
<li><a href="../visa_extensions.php">
<div>Visa Extensions</div>
</a> </li>
<li><a href="../downloads/international-booklet.pdf">
<div>Download International Booklet</div>
</a> </li>
<li><a href="../downloads/refund_policy.pdf">
<div>Refund Policy </div>
</a> </li>
<li><a href="../contact-us.php">
<div>Contact us</div>
</a> </li>
</ul>
</li>
</ul>
</div>
</li>
<li class="mega-menu"><a href="zimbabwe.php#">
<div>Academics</div>
</a>
<div class="mega-menu-content style-2 clearfix academics-border-right">
<ul class="mega-menu-column col-lg-4">
<li class="mega-menu-title">
<a class="gc-menu-title">
<div>Highlights</div>
</a>
<ul>
<li>
<a href="https://www.lpu.in/academics">
<div>Overview</div>
</a>
</li>
<li>
<a href="../../academics/live-projects.php">
<div>Live projects</div>
</a>
</li>
<li>
<a href="../../academics/industry-immersion.php">
<div>Industry Immersion</div>
</a>
</li>
<li>
<a href="../../academics/Interdisciplinary-minors.php">
<div>Interdisciplinary Minors</div>
</a>
</li>
<li>
<a href="../../academics/curriculum-innovations.php">
<div>Curriculum innovations</div>
</a>
</li>
<li>
<a href="../../academics/guest-lectures.php">
<div>Guest lectures / Workshops</div>
</a>
</li>
<li>
<a href="../../academics/assessment-and-evaluation.php">
<div>Assessment and Evaluation</div>
</a>
</li>
<li>
<a href="../../academics/mentoring-advising.php">
<div>Mentoring and advising</div>
</a>
</li>
<li>
<a href="../../academics/stakeholder-feedback.php">
<div>Stakeholder Feedback</div>
</a>
</li>
<li>
<a href="../../academics/faculty-development.php">
<div>Human Resource Development Center</div>
</a>
</li>
<li>
<a href="../../corporate-training.php">
<div>Corporate Training</div>
</a>
</li>
<li>
<a href="../../academics/libraries-laboratories.php">
<div>Libraries</div>
</a>
</li>
<li>
<a href="../../academics/laboratories.php">
<div>Laboratories</div>
</a>
</li>
<li>
<a href="../../academics/calendar_regular_programmes.php">
<div>Academic Calendar</div>
</a>
</li>
<li>
<a href="../../academics/holiday-list.php">
<div>Holiday List</div>
</a>
</li>
</ul>
</li>
</ul>
<ul class="noleftborder mega-menu-column col-lg-4">
<li class="mega-menu-title">
<a class="gc-menu-title">
<div>Disciplines</div>
</a>
<ul>
<li><a href="https://schools.lpu.in/computer-science-engineering/" target="_blank">Computer
Science & Engineering</a></li>
<li><a href="https://schools.lpu.in/agriculture/" target="_blank">Agriculture</a></li>
<li><a href="https://schools.lpu.in/computer-applications/" target="_blank">Computer
Applications</a></li>
<li><a href="https://schools.lpu.in/electronics-electrical-engineering/" target="_blank">Electronics & Electrical
Engineering</a></li>
<li><a href="https://schools.lpu.in/mechanical-engineering/" target="_blank">Mechanical
Engineering</a></li>
<li><a href="https://schools.lpu.in/bioengineering-and-biosciences/" target="_blank">Bioengineering &
Biosciences</a></li>
<li><a href="https://schools.lpu.in/physical-sciences/" target="_blank">Chemical Engineering
& Physical Sciences</a></li>
<li><a href="https://schools.lpu.in/civil-engineering/" target="_blank">Civil Engineering
</a></li>
<li><a href="https://schools.lpu.in/interior-and-furniture/" target="_blank">Interior & Furniture Design, Product & Industrial Design & Interaction Design</a></li>
<li><a href="https://schools.lpu.in/fashion/" target="_blank">Fashion Design</a></li>
<li><a href="https://schools.lpu.in/animation-and-multimedia/" target="_blank">Animation & Multimedia</a></li>
<li><a href="https://schools.lpu.in/film-tv-production/" target="_blank">Film & Television</a></li>
<li><a href="https://schools.lpu.in/architecture-design/" target="_blank">Architecture & Planning</a></li>
<li><a href="https://schools.lpu.in/education/" target="_blank">Education</a></li>
<li><a href="https://schools.lpu.in/physical-education/" target="_blank">Physical Education</a></li>
</ul>
</li>
</ul>
<ul class="mega-menu-column col-lg-4">
<li class="mega-menu-title">
<div class="mhead">&nbsp;</div>
<ul>
<li><a href="https://schools.lpu.in/business/" target="_blank">Business</a></li>
<li><a href="https://schools.lpu.in/management-and-commerce/" target="_blank">Commerce & Economics</a></li>
<li><a href="https://schools.lpu.in/hotel-management-and-tourism/" target="_blank">Hotel
Management & Tourism</a></li>
<li><a href="https://schools.lpu.in/law/" target="_blank">Law</a></li>
<li><a href="https://schools.lpu.in/physiotherapy-and-paramedical-sciences/" target="_blank">Medical Laboratory Sciences & Physiotherapy</a></li>
<li><a href="https://schools.lpu.in/pharmaceutical-sciences/" target="_blank">Pharmaceutical
Sciences</a></li>
<li><a href="https://schools.lpu.in/social-sciences/" target="_blank">Social Sciences & Languages</a></li>
<li><a href="https://schools.lpu.in/performing-arts/" target="_blank">Theatre & Music</a></li>
<li><a href="https://schools.lpu.in/fine-arts/" target="_blank">Fine Arts</a></li>
<li><a href="https://schools.lpu.in/journalism-film-production/" target="_blank">Journalism & Mass Communication</a></li>
<li><a href="https://schools.lpu.in/polytechnic/" target="_blank">Polytechnic</a></li>
</ul>
</li>
</ul>
</div>
</li>
<li><a href="zimbabwe.php#">
<div>Incredible India Program</div>
</a>
<ul class="single-menu">
<li class="mega-menu-title">
<div>Get Started</div>
</li>
<li>
<a href="../summer_school/index.php">
<div>Programmes</div>
</a>
</li>
<li>
<a href="../summer_school/SummerSchoolApplicationForm.aspx">
<div>Apply Now</div>
</a>
</li>
<li>
<a href="../summer_school/int_eligibility.php">
<div>Eligibility</div>
</a>
</li>
<li>
<a href="../summer_school/int_registeration_and_fee_structure.php">
<div>Registration & Fee</div>
</a>
</li>
<li>
<a href="../summer_school/int_proposed_schedule.php">
<div>Schedule and Details</div>
</a>
</li>
<li>
<a href="../summer_school/int_accommodation_and_facilities.php">
<div>Accomodation and Other Facilities</div>
</a>
</li>
<li>
<a href="../summer_school/int_visa_requirement_and_guidelines.php">
<div>Visa Requirement and Guidelines</div>
</a>
</li>
<li><a href="../summer_school/int_gallery.php">
<div>Gallary</div>
</a></li>
<li><a href="../summer_school/int_faq.php">
<div>FAQ's</div>
</a></li>
<li><a href="../summer_school/int_contact.php">
<div>Contact Us</div>
</a></li>
</ul>
</li>
<li><a href="zimbabwe.php#">
<div>Student Facilities</div>
</a>
<ul class="single-menu">
<li class="mega-menu-title">
<div>Get Started</div>
</li>
<li><a href="../reporting-schedule-pickup-services.php">
<div>Pick-up Facility</div>
</a></li>
<li><a href="../reporting-schedule-pickup-services.php">
<div>Reporting Schedule </div>
</a></li>
<li><a href="../pre_arrival.php">
<div>Pre Arrival Information</div>
</a></li>
<li><a href="../post_arrival.php">
<div>Post Arrival Information</div>
</a> </li>
<li><a href="../after_you_graduate.php">
<div>After You Graduate</div>
</a> </li>
<li><a href="../returning_back.php">
<div>Returning Back Home</div>
</a> </li>
<li><a href="../international_student_experience.php">
<div>Students Testimonials</div>
</a> </li>
<li><a href="../contact-us.php">
<div>Contact Us</div>
</a></li>
</ul>
</li>

<li class="mega-menu"><a href="zimbabwe.php#">
<div>Campus Life</div>
</a>
<div class="mega-menu-content style-2 clearfix">
<ul class="mega-menu-column col-lg-6">
<li class="mega-menu-title">
<a class="gc-menu-title">
<div>Campus Life</div>
</a>
<div class="row">
<ul class="col-lg-6">
<li>
<a href="../../campus_life/entrepreneurship.php">
<div>Entrepreneurship</div>
</a>
</li>
<li>
<a href="../../campus_life/sports.php">
<div>Sports</div>
</a>
</li>
<li>
<a href="../../campus_life/art-and-culture.php">
<div>Art and Culture</div>
</a>
</li>
<li>
<a href="../../campus_life/campus-events.php">
<div>Campus Events</div>
</a>
</li>
<li>
<a href="../../campus_life/student-organisations.php">
<div>Student Organizations</div>
</a>
</li>
<li>
<a href="../../campus_life/community-services.php">
<div>Community Service</div>
</a>
</li>
</ul>
<ul class="col-lg-6">
<li>
<a href="../../campus_life/visitors.php">
<div>Visitors</div>
</a>
</li>
<li>
<a href="../../campus_life/diversity.php">
<div>Diversity</div>
</a>
</li>
<li>
<a href="../../campus_life/on-campus-jobs.php">
<div>On Campus Jobs</div>
</a>
</li>
<li>
<a href="../../campus_life/fun-zone.php">
<div>Fun Zone</div>
</a>
</li>
<li>
<a href="../../campus_life/career-enhancement-initiatives.php">
<div>Career Enhancement Initiatives</div>
</a>
</li>
</ul>
</div>
</li>
</ul>
<ul class="mega-menu-column col-lg-6">
<li class="mega-menu-title"> <a class="gc-menu-title">
<div>Student Services</div>
</a>
<div class="row">
<ul class="col-lg-6">
<li>
<a href="../../student_services/security.php">
<div>Campus Security</div>
</a>
</li>
<li>
<a href="../../student_services/healthcare.php">
<div>Uni Health Centre</div>
</a>
</li>
<li>
<a href="../../student_services/ums.php">
<div>University Management System</div>
</a>
</li>
<li>
<a href="../../student_services/residence.php">
<div>Residential Facilities</div>
</a>
</li>
<li>
<a href="../../student_services/transport.php">
<div>Transportation Facilities</div>
</a>
</li>
<li>
<a target="_blank" href="../../student_services/lovely-world.php">
<div>Lovely World</div>
</a>
</li>
</ul>
<ul class="col-lg-6">
<li>
<a href="../../student_services/shopping-dining.php">
<div>Shopping and Dining</div>
</a>
</li>
<li>
<a href="../../student_services/banking-postal-services.php">
<div>Banking and Postal Services</div>
</a>
</li>
<li>
<a href="../../student_services/education-loan-assistance.php">
<div>Education Loan Assistance</div>
</a>
</li>
<li>
<a href="../../placements.php">
<div>Placements</div>
</a>
</li>

</ul>
</div>
</li>
</ul>
</div>
</li>
<li class="scroll-menu">
<a href="https://admit.lpu.in/" target="_blank">
<div>Apply Now</div>
</a>
</li>
</ul>

<div id="top-search">
<a href="zimbabwe.php#" id="top-search-trigger"><i class="icon-search3"></i><i class="icon-line-cross"></i></a>
<form action="https://www.lpu.in/result.php" name="form2" id="form2">
<input type="hidden" name="cx" value="partner-pub-016589675364233558975:gl7zrlhae3u" />
<input type="hidden" name="cof" value="FORID:11" />
<input type="hidden" name="ie" value="ISO-8859-1" />
<input type="text" name="q" onclick="make_blank();" class="form-control" placeholder="Type &amp; Hit Enter.." />
</form>
</div>
<div class="hidden-xs hidden-sm" id="top-cart">
<a data-toggle="tooltip" title="Increase font size" style="width:30px;cursor: pointer;font-size:15px;" class="increase"><b>A+</b></a>
<a data-toggle="tooltip" title="Decrease font size" style="width:30px;font-size:11px;cursor: pointer;padding-top: 1px;" class="decrease"><b>A-</b></a>
<a data-toggle="tooltip" title="Reset font size" style="width:30px;cursor: pointer" class="reset resetfont"><b>A</b></a>
<a style="width:30px;cursor: pointer;" data-toggle="tooltip" onclick="enableSpeakVerification();" title="Sound on" id="von"><i class="fa fa-volume-off"></i></a>
<a style="width:30px;cursor: pointer;" data-toggle="tooltip" onclick="disableSpeakVerification();" class="dhide" id="voff" title="Sound off"><i class="fa fa-volume-up"></i></a>
<img src="../../images/toggleCol-grey.png" class="invert-img" id="in-grey" data-toggle="tooltip" title="Invert Color" />
<img src="../../images/toggleCol.png" class="invert-img dhide" id="in-color" data-toggle="tooltip" title="Invert Color" />
</div>

</nav>

</div>
</div>
</header>
<div class="clearfix"></div>
<script>
    function fun_setupDarkMenuIcons() {
        if ($("#header").hasClass("dark")) {
            //alert();
            $.each($(".navi-logo"), function(i, it) {
                const dataImg = $(it).attr('data-img');
                console.log(dataImg);
                dataImg && $(it).prop('src', dataImg);
            });
        }
    }
    /*
    $(document).ready(function(){
    	if ($(window).width() < 768) {
    		$(".related-links").addClass('hide');
    	   $(".related-menu").click(function(){
    			$(".related-links").removeClass('hide');
    		});
    		$(".mclose").click(function(){
    			$(".related-links").addClass('hide');
    		});
    	}
    	else {
    		$(".related-links").removeClass('hide');
    	}
    });*/
</script>
<div class="npf_chatbots" data-w="287c1a2428384c4eaa8308629b3dc6e0" style="display:none;"></div>
<script type="text/javascript">
    var s = document.createElement("script");
    s.type = "text/javascript";
    s.async = true;
    s.src =
        "https://chatbot.in8.nopaperforms.com/en-gb/backend/bots/niaachtbtscpt.js/568463edc4d731fbe/287c1a2428384c4eaa8308629b3dc6e0";
    document.body.appendChild(s);
</script> 
<div class="clearfix"></div>
<section class="space-section slider" style="border-top: 2px solid #f58220;">
<div class="container">
<div class="heading-block">
<h1 class="mb20">Information for students<br>from Zimbabwe </h1>
<img src="images/zimbabwe/hero.jpg" width="100%" />
</div>
</div>
</section>
<section class="section space-section blue-bg">
<div class="container clearfix">
<div class="row align-items-center">
<div class="col-md-5">
<div class="slider-image">
<img src="images/zimbabwe/staying-india.jpg" />
</div>
</div>
<div class="col-md-6 breather-head">
<div class="heading-block mb-0 ">
<h2>Most favourite place of
Higher studies for students from Zimbabwe</h2>
</div>
<p class="mt-0 mb-0">India is one of the most progressive countries in the world. Its education system is the second-largest education system globally and many of the top leaders of the world including CEOs of Microsoft, Google and more have been nurtured in the Indian education system. The University campus includes more than 35,000 students from 70+ countries including Zimbabwe, a vibrant, multicultural and the most favorable destination for international students to pursue their Higher Education in India.
</p>
</div>
</div>
</div>
</section>
<section class="space-section section admission">
<div class="container">
<div class="heading-block mb-0">
<h2>Admissions Requirements</h2>
</div>
<div class="row">
<div class="col-md-5">
<ul class="tabs">
<li class="active" rel="tab1">
<div class="title_tab">
<p class="sub-title-main">
<span class="acc_no">01</span>
Diploma (after grade 10/O level)
<span class="icon"></span>
</p>
</div>
</li>
<li rel="tab2">
<div class="title_tab">
<p class="sub-title-main">
<span class="acc_no">02</span>
Bachelor Degree (after grade 12/A level)
<span class="icon"></span>
</p>
</div>
</li>
<li rel="tab3">
<div class="title_tab">
<p class="sub-title-main">
<span class="acc_no">03</span>
Master Degree
<span class="icon"></span>
</p>
</div>
</li>
<li rel="tab4">
<div class="title_tab">
<p class="sub-title-main">
<span class="acc_no">04</span>
Doctoral (PhD)
<span class="icon"></span>
</p>
</div>
</li>
</ul>

</div>
<div class="col-md-7 breather-head">
<div class="tab_container">
<h3 class="d_active tab_drawer_heading" rel="tab1">
<div class="title_tab">
<p class="sub-title-main">
<span class="acc_no">01</span>
Diploma (after grade 10/O level)
<span class="icon"></span>
</p>
</div>
</h3>
<div id="tab1" class="tab_content">
<img src="images/zimbabwe/diploma.jpg" />
<p>Pass in Zimbabwe General Certificate of Education at Ordinary Level or equivalent to Grade 10 in India.</p>
<h3>English Language Requirements (ELR)</h3>
<p>The language of instruction in the university is English and it is recommended that
all international students applying for admission in the regular programme should be
proficient in the English Language.
For more information please click here.</p>
</div>

<h3 class="tab_drawer_heading" rel="tab2">
<div class="title_tab">
<p class="sub-title-main">
<span class="acc_no">02</span>
Bachelor Degree (after grade 12/A level)
<span class="icon"></span>
</p>
</div>
</h3>
<div id="tab2" class="tab_content">
<img src="images/zimbabwe/bachelor.jpg" />
<p>Pass in Zimbabwe General Certificate of Education (Advanced Level) or equivalent to Grade 12 in India.</p>
<h3>English Language Requirements (ELR)</h3>
<p>The language of instruction in the university is English and it is recommended that
all international students applying for admission in the regular programme should be
proficient in the English Language.
For more information please click here.</p>
</div>

<h3 class="tab_drawer_heading" rel="tab3">
<div class="title_tab">
<p class="sub-title-main">
<span class="acc_no">03</span>
Master Degree
<span class="icon"></span>
</p>
</div>
</h3>
<div id="tab3" class="tab_content">
<img src="images/zimbabwe/master.jpg" />
<p>Bachelor's Degree (in relevant field) from a recognized University with minimum
percentage required for the applied programme.</p>
<h3>English Language Requirements (ELR)</h3>
<p>The language of instruction in the university is English and it is recommended that
all international students applying for admission in the regular programme should be
proficient in the English Language.
For more information please click here.</p>
</div>

<h3 class="tab_drawer_heading" rel="tab4">
<div class="title_tab">
<p class="sub-title-main">
<span class="acc_no">04</span>
Doctoral (PhD)
<span class="icon"></span>
</p>
</div>
</h3>
<div id="tab4" class="tab_content">
<img src="images/zimbabwe/phd.jpg" />
<p>For PhD Full-time: Master's Degree (in relevant field) from a recognized University
with minimum percentage required for the applied programme. Recommendation of
Research Proposal (minimum 8 to 10 pages) and qualifying an online interview.</p>
<p>For PhD Part-time: Master's Degree (in relevant field) from a recognized University
with minimum percentage required for the applied programme. Experience certificate
minimum 2 years in the teaching or industry. Recommendation of Research Proposal
(minimum 8 to 10 pages) and qualifying an online interview.</p>
</div>

</div>
</div>
</div>
</div>
</section>
<section class="space-section">
<div class="container">
<div class="heading-block center ">
<h2>Important dates</h2>
</div>
<table class="table table-striped table-bordered">
<thead>
<tr>
<th>Admissions open for Batch 2023</th>
<td>1st January 2023</th>
</tr>
</thead>
<tbody>
<tr>
<th>Last date to apply with scholarship</th>
<td>10th September 2023</td>
</tr>
<tr>
<th>Last date to apply</th>
<td>10th September 2023</td>
</tr>
<tr>
<th>Commencement of session</th>
<td>As per Reporting Schedule. <a href="../reporting-schedule-pickup-services.php" target="_blank">Know More</a> </td>
</tr>
</tbody>
</table>
</div>
</section> <style>
    .accordion .table td:nth-child(1) {
        width: 30%;
    }

    .accordion .table td:nth-child(2) {
        width: 70%;
    }
</style>
<section class="space-section section">
<div class="container clearfix">
<div class="row align-items-center">
<div class="col-md-4">
<div class="slider-image">
<img src="images/scholarship-aid.jpg" />
</div>
</div>
<div class="col-md-8 breather-head">
<div class="heading-block mb-0 ">
<h2>SCHOLARSHIP OPPORTUNITY</h2>
</div>
<p class="mt-0">LPU is known for its diverse and brilliant student population who goes on to
achieve wonders. We attract the best minds from across the globe by offering scholarships upto 90% to hundreds of top international students.
</p>
</div>
</div>
<div class="accordion accordion-bg clearfix mt50">
<div class="accordion-grid">
<div class="acctitle"><i class="acc-closed icon-chevron-down1"></i><i class="acc-open icon-chevron-up1"></i>
Diploma Programme (After O level)</div>
<div class="acc_content clearfix">
<div class="table-responsive">
<table class="table table-striped table-bordered">
<tr>
<th>Scholarship on tuition fee</th>
<th>Scholarship eligibility criteria</th>
</tr>
<tr>
<td>50% (Per Semester)</td>
<td>60% and above marks in grade 10/O level or equivalent in India.</td>
</tr>
<tr>
<td>30% (Per Semester)</td>
<td>50% to 59.99% marks in grade 10/O level or equivalent in India.</td>
</tr>

</table>
</div>
</div>
</div>
<div class="accordion-grid">
<div class="acctitle"><i class="acc-closed icon-chevron-down1"></i><i class="acc-open icon-chevron-up1"></i>Bachelor Degree Programme (After A level)</div>
<div class="acc_content clearfix">
<div class="table-responsive">
<table class="table table-striped table-bordered">
<tr>
<th>Scholarship on tuition fee</th>
<th>Scholarship eligibility criteria</th>
</tr>
<tr>
<td>50% (Per Semester)</td>
<td>60% and above marks in grade 12/A level or equivalent in India.</td>
</tr>
<tr>
<td>30% (Per Semester)</td>
<td>50% to 59.99% marks in grade 12/A level or equivalent in India.</td>
</tr>

</table>
</div>
</div>
</div>
<div class="accordion-grid">
<div class="acctitle"><i class="acc-closed icon-chevron-down1"></i><i class="acc-open icon-chevron-up1"></i>Master Degree Programme</div>
<div class="acc_content clearfix">
<div class="table-responsive">
<table class="table table-striped table-bordered">
<tr>
<th>Scholarship on tuition fee</th>
<th>Scholarship eligibility criteria</th>
</tr>
<tr>
<td>50% (Per Semester)</td>
<td>60% and above marks in Bachelor Degree or equivalent in India.</td>
</tr>
<tr>
<td>30% (Per Semester)</td>
<td>50% to 59.99% marks in Bachelor Degree or equivalent in India.</td>
</tr>

</table>
</div>
</div>
</div>
<div class="accordion-grid">
<div class="acctitle"><i class="acc-closed icon-chevron-down1"></i><i class="acc-open icon-chevron-up1"></i>
PhD Programme (Part-Time)</div>
<div class="acc_content clearfix">
<div class="table-responsive">
<table class="table table-striped table-bordered">
<tr>
<th>Scholarship on tuition fee</th>
<th>Scholarship eligibility criteria</th>
</tr>
<tr>
<td>70% (Per Semester)</td>
<td>80% and above marks in Master Degree or equivalent in India.</td>
</tr>
<tr>
<td>50% (Per Semester)</td>
<td>65% to 79.99% marks in Master Degree or equivalent in India.</td>
</tr>
<tr>
<td>30% (Per Semester)</td>
<td>55% to 64.99% marks in Master Degree or equivalent in India.</td>
</tr>
</table>
</div>
</div>
</div>
<div class="accordion-grid">
<div class="acctitle"><i class="acc-closed icon-chevron-down1"></i><i class="acc-open icon-chevron-up1"></i>
PhD Programme (Full Time)</div>
<div class="acc_content clearfix">
<div class="table-responsive">
<table class="table table-striped table-bordered">
<tr>
<th>Scholarship on tuition fee</th>
<th>Scholarship eligibility criteria</th>
</tr>
<tr>
<td>90% (Per Semester)</td>
<td>80% and above marks in Master Degree or equivalent in India.</td>
</tr>
<tr>
<td>70% (Per Semester)</td>
<td>65% to 79.99% marks in Master Degree or equivalent in India.</td>
</tr>
<tr>
<td>50% (Per Semester)</td>
<td>55% to 64.99% marks in Master Degree or equivalent in India.</td>
</tr>
</table>
</div>
</div>
</div>
</div>
</div>
</section> <style>
    .gc-pulse-btn {
        width: 60px;
        height: 60px;
        line-height: 58px;
        background-color: #f58220 !important;
        position: absolute;
        left: 45%;
        top: 45%;
        z-index: 1;
        border-radius: 100%;
        box-shadow: 0 0 40px rgb(14 16 48 / 7%);
        text-align: center;
        transition: all .3s;
        display: inline-block;
        padding-left: 6px;
    }

    .gc-pulse-btn:after,
    .gc-pulse-btn:before {
        position: absolute;
        content: '';
        top: -25px;
        left: -25px;
        bottom: -25px;
        right: -25px;
        background-color: rgba(234, 81, 84, .2);
        -webkit-border-radius: 50%;
        -moz-border-radius: 50%;
        border-radius: 50%;
        -webkit-animation: play-button-pulse 1.8s linear infinite;
        -moz-animation: play-button-pulse 1.8s linear infinite;
        animation: play-button-pulse 1.8s linear infinite;
        opacity: 0;
        z-index: -1;
    }

    .gc-pulse-btn:after {
        -webkit-animation-delay: .6s;
        -moz-animation-delay: .6s;
        animation-delay: .6s;
    }

    @-webkit-keyframes play-button-pulse {
        0% {
            -webkit-transform: scale(.5);
            -moz-transform: scale(.5);
            -ms-transform: scale(.5);
            -o-transform: scale(.5);
            transform: scale(.5);
            opacity: 0
        }

        50% {
            opacity: 1
        }

        100% {
            -webkit-transform: scale(1.2);
            -moz-transform: scale(1.2);
            -ms-transform: scale(1.2);
            -o-transform: scale(1.2);
            transform: scale(1.2);
            opacity: 0
        }
    }

    @-moz-keyframes play-button-pulse {
        0% {
            -webkit-transform: scale(.5);
            -moz-transform: scale(.5);
            -ms-transform: scale(.5);
            -o-transform: scale(.5);
            transform: scale(.5);
            opacity: 0
        }

        50% {
            opacity: 1
        }

        100% {
            -webkit-transform: scale(1.2);
            -moz-transform: scale(1.2);
            -ms-transform: scale(1.2);
            -o-transform: scale(1.2);
            transform: scale(1.2);
            opacity: 0
        }
    }

    @-ms-keyframes play-button-pulse {
        0% {
            -webkit-transform: scale(.5);
            -moz-transform: scale(.5);
            -ms-transform: scale(.5);
            -o-transform: scale(.5);
            transform: scale(.5);
            opacity: 0
        }

        50% {
            opacity: 1
        }

        100% {
            -webkit-transform: scale(1.2);
            -moz-transform: scale(1.2);
            -ms-transform: scale(1.2);
            -o-transform: scale(1.2);
            transform: scale(1.2);
            opacity: 0
        }
    }

    @-o-keyframes play-button-pulse {
        0% {
            -webkit-transform: scale(.5);
            -moz-transform: scale(.5);
            -ms-transform: scale(.5);
            -o-transform: scale(.5);
            transform: scale(.5);
            opacity: 0
        }

        50% {
            opacity: 1
        }

        100% {
            -webkit-transform: scale(1.2);
            -moz-transform: scale(1.2);
            -ms-transform: scale(1.2);
            -o-transform: scale(1.2);
            transform: scale(1.2);
            opacity: 0
        }
    }

    @keyframes play-button-pulse {
        0% {
            -webkit-transform: scale(.5);
            -moz-transform: scale(.5);
            -ms-transform: scale(.5);
            -o-transform: scale(.5);
            transform: scale(.5);
            opacity: 0
        }

        50% {
            opacity: 1
        }

        100% {
            -webkit-transform: scale(1.2);
            -moz-transform: scale(1.2);
            -ms-transform: scale(1.2);
            -o-transform: scale(1.2);
            transform: scale(1.2);
            opacity: 0
        }
    }

    @keyframes blink {
        50% {
            opacity: 1
        }
    }
</style>
<section class="space-section blue-bg">
<div class="container clearfix">
<div class="row align-items-center">
<div class="col-md-5 order-lg-2">
<div class="slider-image">
<img src="images/accommodation-1.jpg">
<a href="https://www.youtube.com/watch?v=OHu6COPkSDw?autoplay=1&amp;rel=0" data-lightbox="iframe" class="gc-pulse-btn">
<img src="../../images/icons/play-btn.png" />
</a>
</div>
</div>
<div class="col-md-7 breather-head order-lg-1">
<div class="heading-block mb-0 ">
<h2>World’s largest student accommodation</h2>
</div>
<p class="mt-0">We provide you with a safe and comfortable home-away-from-home that is excellent
value for
money and is right within the campus. We have a range of room types to suit your needs and
budget.
Ranging
from single-seater to multi-seater rooms and apartments are readily available for
international
students.
All residential facilities have dining halls that provide good quality and hygienic food
four times a
day.
Over 1 Lakh meals are prepared each day
</p>
<ul class="pl20">
<li>24x7 Library Access</li>
<li>Access to Indoor Sports Stadium</li>
<li>Safe & Secure</li>
<li>Medical Assistance</li>
<li>Gym Facility</li>
</ul>
</div>
</div>
</div>
</section>
<style>
    .usd-brochure,
    .inr-brochure {
        display: none;
    }
</style>
<section class="space-section cif-bg">
<div class="container clearfix">
<div class="row align-items-center">
<div class="col-md-5 order-md-2">
<div class="slider-image">
<img src="images/launch-advancedprogramme.jpg" />
</div>
</div>
<div class="col-md-7 breather-head order-md-1">
<div class="heading-block mb-0 ">
<h2>Launch your career
with advanced
programs</h2>
</div>
<p class="mt-0">LPU is known for its diverse and brilliant student population who goes on to
achieve
wonders. We attract the best minds from across the globe by offering scholarships upto 50%
to hundreds
of
top international students.
</p>
<div class="row">
<div class="col-md-4 col-4">
<h3 class="inter-medium">
150+<br>
<small class="inter-regular">Programmes</small>
</h3>
</div>
<div class="col-md-4 col-4">
<h3 class="inter-medium">
40+<br>
<small class="inter-regular">Disciplines</small>
</h3>
</div>

</div>
<a href="../programmes/ProgramSearch.php" class="button button-border button-border-thin" target="_blank">Explore Programmes</a>
<a href="../downloads/international-booklet.pdf" class="button button-border button-border-thin usd-brochure" target="_blank">Download
Brochure</a>
<a href="../downloads/international-booklet-INR.pdf" class="button button-border button-border-thin inr-brochure" target="_blank">Download
Brochure</a>
</div>
</div>
</div>
</section> <section class="space-section section">
<div class="container">
<div class="heading-block">
<h2 class="mb50">Alumni from Zimbabwe</h2>
</div>
</div>
<div class="outer row align-items-end testi-carousel">
<div class="col-md-4 gc-thumb">
<div id="thumbs" class="owl-carousel owl-theme">
<div class="item">
<img src="images/zimbabwe/alumni-testi-4.jpg" style="width:200px;margin-right:10px;" />
</div>
<div class="item">
<img src="images/zimbabwe/alumni-testi-5.jpg" style="width:200px;margin-right:10px;" />
</div>
<div class="item">
<img src="images/zimbabwe/alumni-testi-1.jpg" style="width:200px;margin-right:10px;" />
</div>
<div class="item">
<img src="images/zimbabwe/alumni-testi-2.jpg" style="width:200px;margin-right:10px;" />
</div>
<div class="item">
<img src="images/zimbabwe/alumni-testi-3.jpg" style="width:200px;margin-right:10px;" />
</div>
</div>
</div>
<div id="big" class="owl-carousel owl-theme col-md-6">
<div class="item">
<div class="row align-items-end">
<div class="col-md-7"> <img src="images/zimbabwe/alumni-testi-1.jpg" /></div>
<div class="col-md-5">
<p class="mb10">Lovely Professional University has offered me an ideal study environment, giving professional and standard education. Professors provide full support to the students with full dedication. The lush green campus always refreshes my mind. LPU is really a benchmark in the field of higher education.
</p>
<div class="testimonial-author testimonial-author-diff">
<h3 class="mb5">Tendai Thelma Satambara</h3>
<p class="mb0">Diploma in Civil engineering (2021 Batch)
</p>
</div>
</div>
</div>
</div>
<div class="item">
<div class="row align-items-end">
<div class="col-md-7"> <img src="images/zimbabwe/alumni-testi-2.jpg" /></div>
<div class="col-md-5">
<p class="mb10">My experience at LPU is really nice. I Iove the part there is no racial segregation in the campus and everyone is treated equally. The learning environment is very good. Having scholars from all over the world helps in cultural and knowledge exchange. LPU is like a dream come true.
</p>
<div class="testimonial-author testimonial-author-diff">
<h3 class="mb5">Shamiso Shalom Nyagato</h3>
<p class="mb0">Psychology (2021 Batch)
</p>
</div>
</div>
</div>
</div>
<div class="item">
<div class="row align-items-end">
<div class="col-md-7"> <img src="images/zimbabwe/alumni-testi-3.jpg" /></div>
<div class="col-md-5">
<p class="mb10">I once thought that studying abroad was going to be a little bit challenging but with Lovely Professional University, the journey has been so easy and enjoyable. My lecturers are like my parents, they are so patient enough to make me feel at home. They are always there to help me in my studies. Being part of the LPU family has been a dream fulfilled.</p>
<div class="testimonial-author testimonial-author-diff">
<h3 class="mb5">Memory Mbombe</h3>
<p class="mb0">Human resources (2021 Batch)
</p>
</div>
</div>
</div>
</div>
<div class="item">
<div class="row align-items-end">
<div class="col-md-7"> <img src="images/zimbabwe/alumni-testi-4.jpg" /></div>
<div class="col-md-5">
<p class="mb10">At LPU, I feel like I am at home. The university is filled with different cultures and talents which is helping me to learn and discover my own talents. The conducive learning environment has helped me in scoring good grades in my subjects. The environment here is so good that I easily became friendly with everyone. Proud to be a member of LPU Family! </p>
<div class="testimonial-author testimonial-author-diff">
<h3 class="mb5">Chishakwe Micollin</h3>
<p class="mb0">B Tech Mechanical Engineering (2021 Batch)
</p>
</div>
</div>
</div>
</div>
<div class="item">
<div class="row align-items-end">
<div class="col-md-7"> <img src="images/zimbabwe/alumni-testi-5.jpg" /></div>
<div class="col-md-5">
<p class="mb10">The beauty of the University, the greener flowers, tall and beautiful buildings, new friendly faces of India and others of Africa welcomed me with open arms. My welcoming at LPU was so friendly that helped me to quickly settle down even having Indian friends within my first week. Even with this pandemic the University managed to put in some excellent measures to prevent covid 19 outbreaks. The big school grounds are well maintained. From food, clothes to entertainment, everything is within the University. The campus is one of the security tight places meaning everyone is safe. My experience up to now is priceless and I'm still yet to discover other beautiful things of our beloved Lovely Professional University. </p>
<div class="testimonial-author testimonial-author-diff">
<h3 class="mb5">Abdel M Pamire</h3>
<p class="mb0">BBA (2021-2022 Batch)
</p>
</div>
</div>
</div>
</div>
</div>
</div>
</section>
<section class="space-section">
<div class="container clearfix">
<div class="heading-block center ">
<h2>GLIMPSES OF VARIOUS VISITS</h2>
</div>
<div id="oc-images" class="owl-carousel image-carousel carousel-widget achieve-widget" data-margin="20" data-nav="true" data-pagi="false" data-items-xs="1" data-items-sm="2" data-items-lg="4" data-items-xl="4" data-loop="true" data-autoplay="1000">
<div class="oc-item">
<figure>
<img src="images/zimbabwe/delegation-1.jpg">
<figcaption>
<p>Dr. Godfrey Majoni Chipare, High Commissioner, Zimbabwe to India visited Lovely Professional University.</p>
</figcaption>
</figure>
</div>
<div class="oc-item">
<figure>
<img src="images/zimbabwe/delegation-2.jpg">
<figcaption>
<p>Dr. Godfrey Majoni Chipare with Chancellor Mr. Ashok MIttal and Mr. Aman Mittal (Head, Division of International Affairs).</p>
</figcaption>
</figure>
</div>
<div class="oc-item">
<figure>
<img src="https://www.lpu.in/international/country/images/zimbabwe/delegation-3.jpg">
<figcaption>
<p>Mr. Vijay Khanduja, High Commissioner of India to Zimbabwe with Mr. Manish Aery, Senior Officer, LPU.</p>
</figcaption>
</figure>
</div>
<div class="oc-item">
<figure>
<img src="images/zimbabwe/delegation-4.jpg">
<figcaption>
<p>Mr. Manish Aery, Senior Officer, LPU at education Fair at Harare, Zimbabwe.</p>
</figcaption>
</figure>
</div>
<div class="oc-item">
<figure>
<img src="images/zimbabwe/delegation-5.jpg">
<figcaption>
<p>Mr. Manish Aery, Senior Officer, LPU meeting With the prospective students at Harare, Zimbabwe.</p>
</figcaption>
</figure>
</div>
<div class="oc-item">
<figure>
<img src="images/zimbabwe/delegation-6.jpg">
<figcaption>
<p>Mr. Manish Aery conducting student counseling sessions at Harere, Zimbabwe.</p>
</figcaption>
</figure>
</div>
<div class="oc-item">
<figure>
<img src="images/zimbabwe/delegation-7.jpg">
<figcaption>
<p>Mr. Manish Aery counseling the students at Harere, Zimbabwe.</p>
</figcaption>
</figure>
</div>
<div class="oc-item">
<figure>
<img src="images/zimbabwe/delegation-8.jpg">
<figcaption>
<p>Mr. Manish Aery handing over the admission letter to students.</p>
</figcaption>
</figure>
</div>
</div>
</div>
</section>
<section class="space-section">
<div class="container clearfix">
<div class="row align-items-center">
<div class="col-md-4">
<div class="slider-image">
<img src="images/visa-requirements.jpg" />
</div>
</div>
<div class="col-md-8 breather-head">
<div class="heading-block mb-0 ">
<h2>
Visa requirements and guidelines</h2>
</div>
<p class="mt-0">International students coming to study in India are required to possess a valid passport and a valid Indian student visa. The Visa should be endorsed to Lovely Professional University by the visa issuing authority. Visa can be applied at the nearest Indian High Commission. <a href="zimbabwe.php#embassy">Click here</a> to know more.
</p>
</div>
</div>
</div>
</section> <section class="space-section cif-bg">
<div class="container clearfix">
<div class="row align-items-center">
<div class="col-md-4 order-lg-2">
<div class="slider-image">
<img src="images/freshmen-induction.jpg">
</div>
</div>
<div class="col-md-8 breather-head order-lg-1">
<div class="heading-block mb-0 ">
<h2>Reporting schedule and Freshmen Induction</h2>
</div>
<p class="mt-0">
Freshmen Induction is an initiative to make students acquainted with the culture and norms
of the
institution. Freshmen Induction will introduce a student to life at the university, the
academic
procedures, and various platforms and opportunities that will be made available to students
during their
time in the university.
The induction will start in the 3rd week of July 2023. Take this induction as an opportunity
to meet
your
faculty and familiarize yourself with your department/school, before your teaching begins.
<a href="../reporting-schedule-pickup-services.php" target="_blank">Click here</a> to
know more.
</p>
</div>
</div>
</div>
</section> <section class="section space-section">
<div class="container clearfix">
<div class="row align-items-center">
<div class="col-md-4">
<div class="slider-image">
<img src="images/complimentary.jpg" />
</div>
</div>
<div class="col-md-8">
<div class="heading-block mb-0 ">
<h2>
Complimentary Pick up facilities</h2>
</div>
<p class="mt-0">University provides complimentary pick-up to its new students,
interested
students can avail this complimentary pickup facility by Login to the admission portal
<a href="https://admit.lpu.in/" target="_blank">admit.lpu.in</a>
using
their email ID and Password and fill up the arrival details at least one week before the
date of arrival
in India. <a href="../reporting-schedule-pickup-services.php" target="_blank">Click here</a> to know more
</p>
</div>
</div>
</div>
</section>
<section class="space-section" id="embassy">
<div class="container clearfix">
<div class="heading-block mb-0">
<h2>Embassy Information</h2>
</div>
<div class="row">
<div class="col-md-6">
<img src="images/zimbabwe/embassy1.jpg" class="slider-image">
<div class="address">
<h3>Zimbabwe Embassy in India</h3>
<ul>
<li>
<img src="images/zimbabwe/mail-orange.svg">
<a href="../../cdn-cgi/l/email-protection#d6acbfbbb8b3a1b2b3babebf96acbfbbb0b7f8b1b9a0f8aca1">
<span class="__cf_email__" data-cfemail="38425155565d4f5c5d545051784251555e59165f574e16424f">[email&#160;protected]</span>
</a>
</li>
<li>
<img src="images/zimbabwe/call-orange.svg">
<a href="tel:+911141625908">+91-11-41625908</a>
<a href="tel:+911141640057">+91-11-41640057</a>
</li>
<li>
<img src="images/zimbabwe/address.svg">
<p>
<strong>High Commission of Zimbabwe</strong>
<span>
4 Poorvi Marg, Vasant Vihar, New Delhi 110057, India.
</span>
</p>
</li>
</ul>
</div>
</div>
<div class="col-md-6">
<img src="images/zimbabwe/embassy2.jpg" class="slider-image">
<div class="address">
<h3>High Commission of India in Zimbabwe</h3>
<ul>
<li>
<img src="images/zimbabwe/mail-orange.svg">
<a href="../../cdn-cgi/l/email-protection#f5969a9b86db9d9487948790b5989094db929a83db9c9b">
<span class="__cf_email__" data-cfemail="d6b5b9b8a5f8beb7a4b7a4b396bbb3b7f8b1b9a0f8bfb8">[email&#160;protected]</span>
</a>
</li>
<li>
<img src="images/zimbabwe/mail-orange.svg">
<a href="../../cdn-cgi/l/email-protection#9af2f5f9b4f2fbe8fbe8ffdaf7fffbb4fdf5ecb4f3f4">
<span class="__cf_email__" data-cfemail="7911161a5711180b180b1c39141c18571e160f571017">[email&#160;protected]</span>
</a>
</li>
<li>
<img src="images/zimbabwe/call-orange.svg">
<a href="tel:+263242795955">
+263 242 795955
</a>
<a href="tel:+263242795956">
+263 242 795956
</a>
</li>
<li>
<img src="images/zimbabwe/address.svg">
<p>
<strong>High Commission of India,</strong>
<span>
No. 12 Natal Road, Belgravia, Harare, Zimbabwe.
</span>
</p>
</li>
</ul>
</div>
</div>
</div>
</div>
</section>
<section class="section space-section">
<div class="container clearfix">
<div class="heading-block mb-0 ">
<h2>
Join us today</h2>
</div>
<div class="row align-items-center">
<div class="col-md-5">
<div class="slider-image">
<img src="images/enquiry.jpg" />
</div>
</div>
<div class="col-md-6">
<div class="heading-block mb-0 ">
<h2>
Division of International Affairs</h2>
</div>
<p class="mt-0">Lovely Professional University, Jalandhar - Delhi G.T. Road, Phagwara, Punjab
(India) -
144411
</p>
<div class="address">
<ul>
<li>
<img src="images/call-orange.svg">
<p>
<a href="tel:1824444019">+91-1824444019</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="tel:9501110413">+91-9501110413</a>
</p>
</li>
<li>
<img src="images/mail-orange.svg">
<p><a href="../../cdn-cgi/l/email-protection#cea7a0bae0afaaa3a7bdbda7a1a0bd8ea2bebbe0ada1e0a7a0"><span class="__cf_email__" data-cfemail="177e79633976737a7e64647e787964577b6762397478397e79">[email&#160;protected]</span></a></p>
</li>
</ul>
<a href="https://admit.lpu.in/" target="_blank" class="cta-btn">Apply now</a>
</div>
</div>
</div>
</div>
</section> ﻿<link rel="stylesheet" href="css/radio-checkbox.css" type="text/css" />
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@7.28.11/dist/sweetalert2.min.css" rel="stylesheet" />
<script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
    #StudentGrievance label{
        font-weight: 700;
        margin-top: 15px;
    }
    .swal2-modal{top:0 !important;left:0!important;}
    .swal2-container.swal2-top,
    .swal2-container.swal2-center,
    .swal2-container.swal2-bottom {
        z-index: 9999999999;
    }

    #conference-modal .custom-popup {
        position: relative;
        padding: 20px;
    }

    #conference-modal .custom-popup .close {
        font-size: 30px;
        text-shadow: none !important;
        opacity: 1;
        position: absolute;
        right: 5px;
        top: 5px;
        cursor: pointer;
    }

    #conference-modal .custom-popup h3 {
        background: #f68220;
        width: fit-content;
        margin: 0 auto;
        padding: 5px 10px;
        color: #FFF;
        text-transform: uppercase;
        font-size: 22px;
    }

    #conference-modal .custom-popup p {
        margin: 0;
        padding: 20px;
    }

    #conference-modal .custom-popup a {
        margin: 0 20px 20px 20px;
    }

    #feedback-modal {
        justify-content: center;
        align-items: center;
    }

    #feedback-modal .modal-dialog {
        max-width: 50%;
        width: 50%;
    }

    #feedback-modal .modal-content {
        width: 100% !important;
        overflow: visible !important;
    }

    #feedback-modal .custom-popup {
        background: #FFF;
        width: 100%;
        height: 500px;
        position: relative;
    }

    #feedback-modal .custom-popup .close {
        font-size: 36px;
        color: #FFF !important;
        text-shadow: none !important;
        opacity: 1;
        position: absolute;
        right: -23px;
        top: -28px;
        cursor: pointer;
    }

    #feedback-modal .custom-popup .left {
        background: url('../../images/feedback-bg.png') #f1f1f1;
        background-size: contain;
        background-repeat: no-repeat;
        height: 500px;
    }

    #feedback-modal .custom-popup .right h3 {
        background: #f68220;
        width: fit-content;
        margin: 0 auto;
        padding: 5px 10px;
        color: #FFF;
        text-transform: uppercase;
    }

    #feedback-modal .custom-popup .radio-style-2-label {
        color: #333 !important;
        font-weight: 500;
        margin: 5px 15px !important;
        line-height: 35px;
    }

    @media(max-width:1030px) {
        #feedback-modal .custom-popup .right h3 {
            font-size: 20px;
        }

        #feedback-modal .modal-dialog {
            max-width: 100%;
            width: 100%;
        }
    }

    @media(max-width:770px) {
        #feedback-modal .custom-popup .left {
            display: none;
        }

        #feedback-modal .custom-popup {
            width: 85%;
            height: auto;
            padding: 0 25px;
            margin: 0 auto;
        }

        #conference-modal .custom-popup h3 {
            width: 94%;
            font-size: 16px;
        }

        #conference-modal .custom-popup a {
            margin: 0 10px 10px 10px;
            padding: 8px 15px;
            line-height: 20px;
            height: auto;
            white-space: break-spaces;
        }

        #conference-modal .custom-popup p {
            padding: 20px 10px;
        }

        #conference-modal {
            padding-right: 0 !important;
        }

        #conference-modal .custom-popup {
            padding: 25px 5px;
        }

        #conference-modal .custom-popup .close {
            right: 4px;
            top: -2px;
        }
    }

    .dhide {
        display: none !important;
    }

    #convocation .title-block {
        margin-bottom: 10px;
    }

    .covid-sc {
        background-color: #000000;
        padding: 7px 9px 8px 35px;
        color: #ffffff;
        border-radius: 5px;
        display: inline-block;
        position: relative;
        width: 155px;
    }

    .covid-sc img {
        position: absolute;
        left: 5px;
        top: 2px
    }

    .covid-whatsapp {
        background-color: #2ecc71;
        padding: 7px 9px 8px 35px;
        color: #ffffff;
        border-radius: 5px;
        display: inline-block;
        position: relative;
        width: 155px;
    }

    .covid-whatsapp img {
        position: absolute;
        left: 5px;
        top: 2px
    }

    .covid-webchat {
        background-color: #ff5500;
        padding: 7px 9px 8px 35px;
        color: #ffffff;
        border-radius: 5px;
        display: inline-block;
        position: relative;
        width: 155px;
    }

    .covid-webchat img {
        position: absolute;
        left: 5px;
        top: 2px
    }

    .covid-sc:hover,
    .covid-whatsapp:hover,
    .covid-webchat:hover {
        color: #FFF;
    }

    .iccash li {
        margin-bottom: 15px;
    }

    #myLargeModal .mod-btn-6.active {
        background: #f68220 none repeat scroll 0 0;
        border-color: #f68220;
        color: #fff;
    }

    #myLargeModal .mod-btn-6:hover {
        background: #f68220 none repeat scroll 0 0;
        border-color: #f68220;
        color: #fff;
    }

    .nirf-hd {
        color: #333333;
        text-transform: uppercase;
        font-size: 14px;
        font-weight: 500;
        text-decoration: none;
        line-height: 25px;
    }

    .nirf-hd span {
        text-transform: none;
        color: #f68220;
        text-decoration: underline;
    }

    .nirf li i {
        color: #f68220;
        font-size: 11px;
        padding-right: 10px;
    }

    .vertical-alignment-helper {
        display: table;
        height: 100%;
        width: 100%;
    }

    .vertical-align-center {
        display: table-cell;
        vertical-align: middle;
    }

    .modal-content {
        width: inherit;
        height: inherit;
        margin: 0 auto;
    }

    .disciplines-popup {
        -webkit-border-radius: 10px !important;
        -moz-border-radius: 10px !important;
        border-radius: 10px !important;
    }

    .disciplines-popup li {
        background: rgba(0, 0, 0, 0) url("../../images/icons/widget-link.png") no-repeat scroll left 5px;
        line-height: 25px;
        border: medium none !important;
        color: #444;
        font-size: 14px;
        list-style: outside none none;
        padding-left: 15px;
    }

    #dexample td {
        border: none !important;
        background: url(../../images/icons/widget-link.png) no-repeat;
        padding: 0 0 0 15px;
        display: inline-block
    }

    #dexample tr {
        background: none !important;
        border: medium none;
        display: inline-block;
        float: left;
        padding: 0 0 0 15px;
        width: 33%;
    }

    .no-footer,
    .dataTables_wrapper.no-footer .dataTables_scrollBody {
        border: none !important;
    }

    #disciplines-popup table.dataTable thead th,
    #disciplines-popup table.dataTable thead td {
        border: none !important;
    }

    @media screen and (min-width: 320px) and (max-width: 1023px) {
        #dexample tr {
            float: none;
            width: 100%;
        }
    }

    .intercom .feature-box .fbox-icon {
        width: 55px;
        height: 55px;
    }

    .intercom .feature-box .fbox-icon i {
        line-height: 58px;
        background-color: #ff4358;
    }

    .intercom .fbox-effect .fbox-icon i:hover,
    .intercom .fbox-effect:hover .fbox-icon i {
        background-color: #ff4358;
    }

    .intercom .fbox-effect .fbox-icon i:after {
        box-shadow: none;
        left: 0;
    }

    .intercom .badge {
        position: absolute;
        z-index: 999;
        right: 0;
        cursor: pointer;
    }

    .toast-top-left {
        bottom: 80px;
        top: auto !important;
    }

    .badge-color {
        background: #ff4358;
        color: #fff;
        box-shadow: 0 !important;
    }

    .mt75 {
        margin-top: 75px
    }

    .intercom .icon-comment:before {
        content: "\e65f";
        left: 14px;
        position: absolute;
    }

    .m3 {
        margin-top: 3%;
    }

    .modal-dialog {
        margin: 0 auto;
    }

    .modal-body {
        padding: 0 15px !important;
    }

    #noti .entry-content {
        background: #fff;
    }

    .single-modal {
        width: 300px !important;
    }

    .double-modal {
        width: 600px !important;
    }

    .col-61 {
        width: 50% !important;
    }

    .col-12 {
        width: 100% !important;
    }

    #myLargeModal .modal-content {
        background: #EBEBEB;
    }

    #myLargeModal .mod-btn {
        border-color: #2985C6;
        color: #2985C6;
        width: 96%;
        text-align: center;
    }

    #myLargeModal .mod-btn:hover {
        border-color: #2985C6;
        color: #fff;
        background: #2985C6;
    }

    #myLargeModal .mod-btn-6 {
        border-color: #2985C6;
        color: #2985C6;
        width: 45%;
        text-align: center;
        padding: 0 3px !important;
        font-size: 9px;
    }

    #myLargeModal .mod-btn-6:hover {
        border-color: #2985C6;
        color: #fff;
        background: #2985C6;
    }

    #myLargeModal .modal-header {
        padding: 7px;
        border-color: #d6d6d6;
    }

    .pr7 {
        padding-right: 7px;
    }

    .pl7 {
        padding-left: 7px;
    }

    @media(max-width:770px) {
        #noti .entry-content p {
            min-height: auto !important;
        }

        #myLargeModal.modal {
            overflow-y: scroll !important;
        }
    }

    .popupwindow {
        cursor: pointer;
    }

    .sticky-bar {
        display: block;
        bottom: 15%;
        right: -133px;
        position: fixed;
        z-index: 1040;
        width: 184px;
    }

    .sticky-bar ul {
        margin: 0;
        padding: 0;
        list-style: none;
    }

    .sticky-bar ul li {
        background: #7d7d7d;
        border-radius: 4px 0 0 4px;
        margin: 4px;
        transition: all 0.2s ease-in;
        padding: 5px;
        height: 48px;
    }

    .sticky-bar ul li img {
        float: left;
    }

    .sticky-bar .st-label {
        padding-top: 7px;
        display: inline-block;
        padding-left: 4px;
    }

    .sticky-bar .st-label-single {
        padding-top: 7px;
        display: inline-block;
        padding-left: 4px;
        vertical-align: text-top;
    }

    .sticky-bar ul li a {
        color: #FFF;
        font-size: 12px;
        line-height: 14px;
        font-weight: 600;
        letter-spacing: .5px;
    }

    .sticky-bar ul li:hover {
        margin-left: -122px;
        background: #f68220;
    }

    .sticky-bar .si-whatsapp:hover {
        background: transparent !important;
    }

    #dvCount span {
        box-shadow: 1px 1px 1px rgb(4 4 4 / 35%);
        background-image: -webkit-gradient(linear, left bottom, left top, color-stop(0.5, #3A3A3A), color-stop(0.5, #444444));
        display: inline-block;
        height: 32px;
        width: 22px;
        background-color: #444;
        border-radius: 3.2px;
        text-align: center;
        color: #fff;
        line-height: 32px;
        text-align: center;
        margin-right: 10px;
        margin-top: 10px;
    }

    .olympic-sticky {
        position: fixed;
        top: 40%;
        right: 0;
        z-index: 99
    }

    .day-schedule {
        display: none
    }

    .olympic-sticky-m {
        display: none
    }

    @media(max-width:992px) {
        .olympic-sticky {
            display: none
        }

        .olympic-sticky-m {
            display: block;
            z-index: 9999
        }

        .olympic-sticky-m {
            position: fixed;
            bottom: 20px;
            right: 80px;
            z-index: 9999
        }

        .day-schedule-m {
            display: none
        }
    }

    #dexample tr {
        padding: 0 0 20px 15px !important;
    }
</style>
<div class="sticky-bar hidden-sm hidden-xs hidden-xxs">
<ul>
<li class="call">
<a target="_blank" "href" class="ppwnd" data-gtm-section="sticky">
<img width="auto" height="auto" src="../../images/new-call-icon.png" alt>
<span class="st-label-single">Schedule a Call</span>
</a>
</li>
<li class="d-one">
<a target="_blank" "href" class="si-whatsapp" data-gtm-section="sticky">
<img width="auto" height="auto" src="../../images/new-whatsapp-icon.png" alt>
<span class="st-label"></span>
</a>
</li>
<li>
<a target="_blank" href="zimbabwe.php#" data-gtm-section="sticky" data-toggle="modal" data-target="#conference-modal">
<img width="auto" height="auto" src="../../images/new-video-chat.png" alt>
<span class="st-label">Live Video <br>Counselling</span>
</a>
</li>
<li>
<a target="_blank" href="https://vr.lpu.in" data-gtm-section="sticky">
<img width="auto" height="auto" src="../../images/new-virtual-tour.png" alt>
<span class="st-label-single">360° View</span>
</a>
</li>
<li class="ltown"><a href="../../admission/lpu-in-your-town.php#lpu-town" data-gtm-section="sticky">
<img width="auto" height="auto" src="../../images/new-location-icon.png" alt>
<span class="st-label-single">LPU in Your Town</span></a>
</li>
<li class="d-one">
<a href="../../faq.php" target="_blank" data-gtm-section="sticky">
<img width="auto" height="auto" src="../../images/new-faq-icon.png" alt>
<span class="st-label">Frequently <br>Asked Questions</span>
</a>
</li>
<li class>
<a data-toggle="modal" class="feedback-btn" data-target="#feedback-modal" href="zimbabwe.php#" target="_blank" data-gtm-section="sticky">
<img width="auto" height="auto" src="../../images/feedback-icon.png" alt>
<span class="st-label">Share <br>your feedback</span>
</a>
</li>
</ul>
</div>
<footer id="footer" class="dark remove-div" style="background-color: #222;margin-top: -20px !important;">
<div class="container mt15 clearfix" style="font-size:8px;">E&OE </div>
<div class="container">
<div class="footer-widgets-wrap clearfix" style="padding:20px 0 10px 0">
<div class="col_two_third">
<div class="widget clearfix">
<!-- -->
<div class="row ps-main-footer-menu">
<div class="col-md-5 col-sm-12 col-xs-12 bottommargin-sm widget_links">
<section>
<h4 class="mb10 ps-menu-title">Admissions</h4>
<ul>
<li><a href="../../admission/admissions.php"> Admissions 2023 - 24 </a>
</li>
<li><a href="../international_students.php"> International
Admissions 2023 - 2024 </a>
</li>
<li><a target="_blank" href="https://www.lpude.in/admissions/overview.php">Distance
Education Admissions</a></li>
<li><a target="_blank" href="https://www.lpuonline.com/">Online Education
Admissions</a></li>
<li><a href="../../scholarship/scholarship.php">Scholarship</a>
</li>
<li><a title="Fee Deposit" href="../../frmloginaccounts.aspx">Fee Deposit</a>
</li>
<li><a title="Fee Deposit" href="../../downloads/faq.pdf">FAQ's</a></li>
<li><a title="Top Engineering Colleges (B.Tech - M.Tech)" href="../../engineering/index.html" target="_blank">
Top engineering college in india</a>
</li>
<li><a title="Top MBA Colleges" href="../../mba/index.html" target="_blank">
Top MBA Colleges</a>
</li>
</ul>
</section>
<section>
<h4 class="mb10 mt20 ps-menu-title">Media</h4>
<ul>
<li><a href="../../tv-ads.php">TV Ads</a>
</li>
<li class="hide"><a href="../../print-ads.php">Print Ads</a>
</li>
<li><a href="../../newshome.aspx">Media Coverage</a>
</li>
</ul>
</section>
</div>
<div class="col-md-4 col-sm-12 col-xs-12 bottommargin-sm widget_links">
<section>
<h4 class="mb10 ps-menu-title">Other Links:</h4>
<ul>
<li><a href="https://lpu.in/downloads/application.pdf">Application for Recognition
(ODL)</a></li>

<li><a href="https://lpu.in/downloads/application-2.pdf">Application for Recognition
(Online)
</a></li>
<li><a href="http://alumni.lpu.in" target="_blank"> Alumni </a></li>
<li><a href="../../campus_life/entrepreneurship.php"> Entrepreneurship </a>
</li>
<li><a href="../../downloads/nisp.pdf"> NISP</a>
</li>
<li class="hide"><a href="../../campus_life/campus-events.php"> Events </a>
</li>
<li><a href="../../EventCertificate/index.aspx"> Download Event Certificate
</a>
</li>
<li><a href="../../authenticate" target="_blank" title="Certificate Authentication">Certificate Authentication</a></li>
<li><a target="_blank" title="Fee Deposit" href="https://nad.digitallocker.gov.in/students">Digilocker NAD</a></li>
<li><a href="../../jpd" target="_blank" title="Joint Placement Drive">Joint
Placement Drive</a></li>
<li> <a data-toggle="modal" data-target="#convocation" href="zimbabwe.php#">10th Convocation
Gallery</a> </li>
<li> <a href="../../knowledge-brain-storm/index.php">Knowledge Brainstorm</a>
</li>
<li> <a href="../../academics/iqac.php">Internal Quality Assurance Cell
(IQAC)</a></li>
</ul>
</section>
</div>
<div class="col-md-3 col-sm-12 col-xs-12  widget_links">
<section>
<h4 class="mb10">&nbsp;</h4>
<ul>
<li> <a>ICAR</a></li>
<li> <a "href" class data-toggle="modal" data-target="#nirf">NIRF</a></li>
<li><a href="../../DocumentVerification" target="_blank">Document
Verification</a></li>
<li> <a "href" class data-toggle="modal" data-target="#ariia">ARIIA</a></li>
<li><a target="_blank" href="https://www.istem.gov.in/">I-STEM</a></li>
<li><a target="_blank" href="http://www.lpude.in/">Distance Education</a></li>
<li> <a href="../../educationawards" target="_blank">Education Awards</a>
</li>
<li> <a href="../../explorica/index.php" target="_blank">Explorica</a> </li>
<li> <a href="../../lpusummerschool/index.php">LPU Summer School</a> </li>
<li> <a href="https://ums.lpu.in/lpuums/" target="_blank">Parent's Login</a> </li>
<li> <a href="https://ums.lpu.in/lpuums/" target="_blank">UMS Login</a></li>
<li> <a href="https://ums.lpu.in/lpuums/LoginNew.aspx?loginPage=ExtCert" target="_blank">Apply Certificate</a></li>
<li><a href="../../about_lpu/tour_lpu.php" target="_blank">Campus Visit</a>
</li>
<li><a href="../../jobs/jobs_at_lpu.php" target="_blank">Jobs At LPU</a></li>
<li><a href="../../contact_us/contact-us.php" target="_blank">Contact</a>
</li>
<li><a href="https://docs.google.com/forms/d/e/1FAIpQLScHTG-vQoSOKIRPGnuNZ2bc66M6BOpJXOxBUxOFAUdfz35UkA/viewform" target="_blank">Supplier Registration</a></li>
<li><a href="../../downloads/corrigendum-11-9-2020.html" target="_blank">Corrigendum</a></li>
</ul>
</section>
</div>
</div>
</div>
</div>
<div class="col_one_third col_last">
<div class="widget clearfix" style="margin-bottom: -20px;">
<div class="row">
<div class="col-md-4 clearfix bottommargin-sm">
<a href="https://vr.lpu.in" target="_blank" style="margin-right: 10px;">
<img width="auto" height="auto" src="../../images/360.gif">
</a>
</div>
</div>
<div class="row">
<div class="col-md-12 clearfix">
<h4 class="mt0 pr10" style="display:inline;float:left">Download App</h4>
<div style="display:inline;float:left">
<a title="Appstore" class="social-icon si-rounded si-appstore" href="https://itunes.apple.com/in/app/lputouch/id509819753?mt=8" target="_blank">
<i class="icon-appstore"></i>
<i class="icon-appstore"></i>
</a>
<a title="Android" class="social-icon si-rounded si-android" href="https://play.google.com/store/apps/details?id=ums.lovely.university&hl=en" target="_blank">
<i class="icon-android"></i>
<i class="icon-android"></i>
</a>
</div>
<div class="clearfix"></div>
<div class="col-md-12 col-sm-12 col-xs-12 pl0 widget_links">
<div class="mb10">Subscribe Newsletter</div>
<div id="widget-subscribe-form-result" data-notify-type="success" data-notify-msg>
</div>
<div id="widget-subscribe-form-result2" data-notify-type="error" data-notify-msg>
</div>
<div class="widget subscribe-widget clearfix mt15 mb15">
<form id="widget-subscribe-form" action="zimbabwe.php#" role="form" method="post" class="nobottommargin">
<div class="input-group divcenter">
<span class="input-group-addon"><i id="spinner" class="icon-email2"></i></span>
<input style="height:32px;" type="email" id="widget-subscribe-form-email" name="email" class="form-control required email plr6" placeholder="Enter your Email">
<span class="input-group-btn">
<button class="btn btn-success sbutton plr6" id="subs-btn" type="submit">Go</button>
</span>
</div>
</form>
</div>
</div>
<div>
<span title="Tel"><strong>Tel:</strong></span> +91-1824-517000
<br><span title="Tel"><strong>Tel:</strong></span> +91-1824-404404
<br>
</div>
<div class="mt20">
<div class=" clearfix">
<div class="fleft">
<a href="https://www.facebook.com/LPUUniversity" target="_blank" class="social-icon si-small si-borderless nobottommargin si-facebook">
<i class="icon-facebook"></i>
<i class="icon-facebook"></i>
</a>
<a href="https://twitter.com/lpuuniversity" target="_blank" class="social-icon si-small si-borderless nobottommargin si-twitter">
<i class="icon-twitter"></i>
<i class="icon-twitter"></i>
</a>
<a href="https://www.linkedin.com/company/lovely-professional-university" target="_blank" class="social-icon si-small si-borderless nobottommargin si-linkedin">
<i class="icon-linkedin"></i>
<i class="icon-linkedin"></i>
</a>
<a href="https://www.instagram.com/lpuuniversity/?hl=en" target="_blank" class="social-icon si-small si-borderless nobottommargin si-linkedin">
<i class="icon-instagram"></i>
<i class="icon-instagram"></i>
</a>
<a href="https://www.youtube.com/user/LPUuniversity" target="_blank" class="social-icon si-small si-borderless nobottommargin si-gplus">
<i class="icon-youtube"></i>
<i class="icon-youtube"></i>
</a>
</div>
<div class="clear"></div>
</div>
<div class="col-md-12 pa0 pt30">
<a target="_blank" title="Fee Deposit" href="https://nad.digitallocker.gov.in/students"><img src="../../images/digilocker-dark.png" /></a>
</div>
<div class="col-md-12 pa0 pt30 counter-grid">
<strong>Student Feedback Counter</strong> <br><span id="dvCount"></span>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

</div>
<div id="copyrights" style="padding:10px 0">
<div class="container clearfix">
<div class="row clearfix">
<div class="col-md-6 col-sm-12">
<div class="copyrights-menu copyright-links clearfix">
<img width="auto" height="auto" src="../../images/footer-widget-logo.png" alt class="alignleft" style="margin-top: 20px; padding-right: 18px; border-right: 1px solid #4A4A4A;" />
<p class="pt15 mb0">
India's Best Private University* <strong>Lovely Professional University</strong>,
Jalandhar-Delhi, G.T. Road, Phagwara, Punjab (INDIA) -144411.
<br/>Website: https://www.lpu.in
</p>
</div>
</div>
<div class="col-md-6 col-sm-12 tright hidden-xs mt15">
<div class="fright clearfix">
<div class="copyrights-menu fc-menu copyright-links nobottommargin">
<a href="../../anti-ragging.php" target="_blank">Anti-Ragging</a>/
<a style="cursor:pointer" target="_blank" data-toggle="modal" data-target="#sexual-harrassment-footer">ICC</a>/
<a href="../../privacy.php">Privacy Policy</a>/
<a href="../../disclaimer.php">Disclaimer</a> /
<a href="../../terms-conditions.php">Terms and Conditions</a> /
<a href="../../student-grievance-redressal.php">Student Grievance Redressal</a> /
<a href="../../rti">RTI</a> /
<a target="_blank" href="https://lovelyprofessionaluniversity.outgrow.us/LPU-Website-Survey" target="_blank">Feedback </a>
<br>
<span style="font-size:12px;"> Problem with this page ? <a style="font-size:12px;" href="../../cdn-cgi/l/email-protection#7d0a181f101c0e09180f3d110d08531e12531413420e081f17181e0940301c14115d1b0f12105d110d085314135d2a181f0e140918">Contact
Webmaster</a></span>
</div>
</div>
</div>
</div>
</div>
</div>

</footer>
<div id="feedback-modal" class="modal fade" role="dialog" data-backdrop="static">
<div class="modal-dialog modal-dialog-centered" role="document">
<div class="modal-content">
<div class="custom-popup">
<button type="button" class="close" data-dismiss="modal">&times;</button>
<div class="row">
<div class="col-md-4 left"></div>
<div class="col-md-8 pt30 pb30 right">
<h3 class="text-center">Share your Feedback</h3>
<div id="dvfeedback" class="pt30 pb30"></div>
<div class="text-center pa20" id="dvWaitFeeback"><img src="../../images/feedback-loading.gif" /></div>
<div class="text-center pa20" id="feebackSubmitbtn"><a href="zimbabwe.php#" class="button button-small button-dark button-rounded" onclick="submitFeeback();">Submit</a>
</div>
<div class="text-center pa20" id="feebackSubmitbtn1" style="display:none;"><a href="zimbabwe.php#" class="button button-small button-dark button-rounded" onclick="gotoNextNew();">Next</a>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<div id="conference-modal" class="modal fade conference-modal" role="dialog" data-backdrop="static">
<div class="modal-dialog modal-dialog-centered" role="document">
<div class="modal-content">
<div class="custom-popup">
<button type="button" class="close" data-dismiss="modal">&times;</button>
<h3>Admission - 2023 Live Video Counselling</h3>
<p>To continue interaction with our expert admission counsellors enter the <strong> passcode
123456</strong> for career guidance to discover the best suited programmes for you.
<strong>Available from 10 am to 5 pm on all working days and 10 am to 4 pm on sundays.</strong></p>
<div class="text-center">
<a href="https://us06web.zoom.us/j/84898289868?pwd=QnB0YllDUmVLRVBoOEwxWnMyUVZOQT09" target="_blank" class="button button-small button-border button-rounded"><strong>Join Now</strong></a>
</div>
</div>
</div>
</div>
</div>

<div id="sexual-harrassment-footer" class="modal fade" role="dialog">
<div class="modal-dialog modal-dialog-centered">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal">&times;</button>
<h4 class="modal-title">ICC</h4>
</div>
<div class="modal-body">
<ol class="mt20 ml20 iccash">
<li> <a href="../../downloads/sexual-harrassment-of-women-act-and-rules-2013.pdf" target="_blank"> The Sexual Harassment of Women at Workplace (Prevention, Prohibition and
Redressal) Act, 2013</a></li>
<li> <a href="../../downloads/UGC_regulations-harassment.pdf" target="_blank">UGC (
Prevention, Prohibition and Redressal of sexual harassment of Women employees and students
in Higher Educational Institutions ) Regulations, 2015</a></li>
<li> <a href="../../downloads/handbook-for-prevention-of-sexual-harassment&#32;at-workplace.pdf" target="_blank">Handbook on Sexual Harassment of Women at Workplace issued by the Ministry
of Women and Child Development, Government of India</a></li>

<li><a href="../../downloads/composition-of-ICC.pdf" target="_blank"> Internal
Complaints Committee </a></li>
<li> "Sexual Harassment Complaint Registration: - <a href="../../cdn-cgi/l/email-protection#bbd2d8d8fbd7cbce95d8d495d2d5" target="_top"><span class="__cf_email__" data-cfemail="b5dcd6d6f5d9c5c09bd6da9bdcdb">[email&#160;protected]</span></a> </li>
<li><a href="../../downloads/Anti-Sexual-Harrasment-policy.pdf" target="_blank">Anti Sexual
Harrasment Policy</a> </li>
</ol>
</div>
<div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
</div>
</div>
</div>
</div>
<div id="gotoTop" class="icon-angle-up"></div>
<div id="intake" class="modal fade mt50" role="dialog">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-body mt30">
<h4 class="text-center mb0"><strong>Admissions for 2017-2018 are closed, except for the following
programmes.</strong><br></h4>
<div class="col-md-12 pa0 mt20">
<div class="col-md-12">
<div class="title-block">
<h4>B.Ed.</h4>
<span>
<a href="https://admission.lpu.in/" target="_blank" class="more-link">Click Here</a>
</span>
<br> The last date to apply for admission is 31st August 2017.
</div>
</div>
<div class="col-md-12">
<div class="title-block">
<h4> Integrated B.Ed. - M.Ed.</h4>
<span>
<a href="https://admission.lpu.in/" target="_blank" class="more-link">Click Here</a>
</span>
<br> The last date to apply for admission is 31st August 2017.
</div>
</div>
To enquire for admission in programmes other than mentioned above, <a href="../../contact_us/contact-us.php" class="btn btn-default btn-xs">Click Here</a>
</div>
<div class="clearfix"></div>
</div>
<div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
</div>
</div>
</div>
</div>

<div class="modal fade" id="COVID-19" role="dialog">
<div class="modal-dialog modal-lg modal-dialog-centered">

<div class="modal-content">
<div class="modal-header">
<button type="button" class="close covi-close" data-dismiss="modal">&times;</button>
<h4 class="modal-title">Important Information - LPU Admissions 2020 Update.</h4>
</div>
<div class="modal-body" style="padding:0 15px !important; overflow-y:scroll; max-height:400px">
<p class="mt10" style="font-size:15px;">
Lovely Professional University is closely monitoring the ongoing COVID-19 pandemic. As the condition
continues to change rapidly, our top precedence remains the safety and well-being of our community.
We are planning for several contingency scenarios in order to restrict the physical contact with
individuals on campus and visitors from outside in order to support the mission of Indian government
to stop the potential transmission of the COVID-19.<br><br>
To <strong>support prospective students (candidates)</strong> to <strong>apply for
admissions</strong> in different programmes by offering online/remote admission process during
the COVID-19 pandemic national lockdown period, the <strong>following arrangements</strong> have
been introduced:
<h4 class="mb10 mt20">For B.Tech. Admissions:</h4>
<ul class="li-style">
<li>Last date to apply has been extended from 31st March, 2020 to 20th April, 2020. <a href="https://admission.lpu.in/">Click here to apply</a></li>
<li>LPUNEST Test Dates will be informed as and when Government announces JEE Mains schedule in
order to provide candidates with clash free schedule. University is also evaluating the
options to offer Online proctored LPUNEST remotely.</li>
<li>Two Schedules of Counselling will be conducted (both online):</li>
<ul class="li-style">
<li><strong>Regular Schedule of Counselling</strong> – After the conduct of LPUNEST exam
which is dependent upon Government decision on lockdown due to Covid-19.</li>
<li><strong>Special Schedule of Counseling</strong> – Before the conduct of LPUNEST exam,
for all those candidates who already have JEE Mains or LPUNEST score (exams conducted in
January 2020). </li>
</ul>
<li><strong>Special Schedule of Counselling </strong>will be conducted online only as per the
dates mentioned below:</li>
</ul>
<table border="0" class="table-bordered table table-striped" cellspacing="0" cellpadding="0">
<tr>
<td>Result / Rank declaration</td>
<td>22nd April, 2020 </td>
</tr>
<tr>
<td>Filling of Seat Preference (Online)</td>
<td>22nd April, 2020 to 24th April, 2020</td>
</tr>
<tr>
<td>Allotment letter (Online)</td>
<td>25th April, 2020</td>
</tr>
<tr>
<td>Fee Deposit &amp; Admissions (Online)</td>
<td>25th April, 2020 to 30th April, 2020</td>
</tr>
</table>
<ul class="li-style">
<li>This <strong>Special Schedule of counselling</strong> will help the students with existing
score of JEE (Mains) or LPUNEST to confirm their admission and they need not to appear for
LPUNEST exam again. </li>
<li><strong>Regular Schedule of counselling</strong>may be conducted only on the basis of
LPUNEST exam and not on the basis of JEE (Mains) score so all candidates having JEE Mains
(Jan Schedule) score are advised not to wait for <strong>Regular Schedule of
counselling</strong> and try to confirm the admission through <strong>Special Schedule
of counselling</strong>.</li>
<li>Applicants who do not have LPUNEST score or JEE (Mains) score because they did not appear
for exams in January / February shall apply on or before 20th April, 2020. The schedule of
LPUNEST exam and counselling / admission process will be informed later.</li>
<li>Candidates participating in <strong>Special Counselling schedule</strong> (as per Table
mentioned above), if interested, may appear for LPUNEST to improve their score for
Scholarship and/or participate in <strong>Regular Schedule of counselling</strong> again for
changing / improving the allotted branch.</li>
<li>The ranks declared in Special Counselling schedule will not be used for <strong>LPUNEST
Study Grant.</strong></li>
</ul>
<h4 class="mb10 mt20">For MBA Admissions:</h4>
<ul class="li-style">
<li>Last date to apply has been extended till 20th April, 2020. <a href="https://admission.lpu.in/">Click here to apply</a></li>
<li>University has decided to conduct remote video Interviews for admission in MBA during the
national lockdown period due to Covid-19. LPUNEST will now be conducted for scholarship
only.</li>
</ul>
<strong>IMPORTANT DATES</strong>
<table border="0" class="table-bordered table table-striped" cellspacing="0" cellpadding="0">
<tr>
<td>Interview Scheduling </td>
<td>8th April, 2020 – 20th April, 2020 </td>
</tr>
<tr>
<td>Interview Conduct</td>
<td>10th April, 2020 - 23rd April, 2020</td>
</tr>
<tr>
<td>Interview Result </td>
<td>25th April, 2020</td>
</tr>
<tr>
<td>Admission</td>
<td>25th April, 2020 - 30th April, 2020</td>
</tr>
</table>
<ul class="li-style">
<li>Considering the current COVID-19 Pandemic situation, University has also decided to extend
the Last date of MBA Admissions for January applicants till 30th April, 2020.</li>
</ul>
<h4 class="mb10 mt20">For All other Programmes:</h4>
Admissions are open for all other programmes in the online mode. LPUNEST will be conducted for
scholarship only. <a href="https://admission.lpu.in/">Click here to proceed with admission</a>
<h4 class="mb10 mt20">For Ph.D. Programme:</h4>
<ul class="li-style">
<li>LPUNEST and subsequent interview will be conducted as per schedule communicated earlier.
</li>
<li>Slot booking for exam will be open from 15 April 2020 onwards. <a href="https://admission.lpu.in/">Click here to apply</a></li>
</ul>
Throughout the period of the lockdown and thereafter, we are remotely available through following
modes: <br>
<div class="clearfix"></div>
<div class="col-md-12 text-center col-xs-12" style="background-color:#f2f2f2; float:left; padding:15px 0;">
<div class="col-md-4 mb10"><a class="covid-sc" href="../../ClickToCall.php" target="_blank"><img src="../../mailer/html-mailer/call-icon.png"> Schedule
a
Call </a></div>
<div class="col-md-4 mb10"><a class="covid-whatsapp" href="https://api.whatsapp.com/send?phone=+919852569000&amp;text=Hi%2C%20I%20need%20assistance%20for%20Admissions%202023." target="_blank"><img src="../../mailer/html-mailer/whatsapp.png" style="border:0;vertical-align:bottom"> Whatsapp</a></div>
<div class="col-md-4 mb10"><a class="covid-webchat" href="../../webchat" target="_blank"><img src="../../mailer/html-mailer/icon-bot.png" style="border:0;vertical-align:bottom">WebChat</a></div>
</div>
<div class="clearfix"></div>
<p class="pa0 text-center"><b>Toll Free: 1800-102-4057</b></p>
</div>
<div class="modal-footer">
<button type="button" class="btn btn-default covi-close" data-dismiss="modal">Close</button>
</div>
</div>
</div>
</div>

<div id="COVID" class="modal fade" role="dialog">
<div class="modal-dialog modal-dialog-centered  modal-lg">

<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal">&times;</button>
<h4 class="modal-title">COVID-19</h4>
</div>
<div class="modal-body" style="padding:0 25px !important; overflow-y:scroll; max-height:400px">
<p class="pt10" style="line-height:25px">
<b>Dear Student,</b><br>
The University has been closely monitoring the recent global developments regarding the threats
posed by <b>COVID-19</b> also known as novel corona virus. It is putting in best possible efforts
towards adopting the necessary preventive measures as per the communications received from
Department of Health and Family Welfare and Ministry of Human Resources and Development (MHRD). In
alignment with the directives issued by the Punjab Government, all classes in the University
<b>shall remain suspended till March 31st, 2020.</b> However, during this period the University
shall transit from in-person teaching to online/remote academic connect.
In this regard the following guidelines should be adhered to by the students:-
<ul class="pl20">
<li class="mb10">Students should download and install the <b>“LPU Live” App for online/remote
</b>academic connect (the details in this regard have been updated on UMS). The students
shall continue their studies through the <b>“LPU Live” App</b> and <b>LPU-UMS.</b></li>
<li class="mb10">The University shall remain functional and faculty/staff shall be available
during the working hours for all kinds of academic support required by the students.</li>
<li class="mb10">Incase students opt to undertake any personal domestic travel; it is advised
that all necessary precautionary measures and hygiene advisories should be followed.</li>
<li class="mb10">International travel by the students is strongly discouraged.</li>
<li class="mb10">Students should avoid participation in large gatherings or venturing out to
crowded places.</li>
<li class="mb10">All University events scheduled till <b>March 31st, 2020</b> stand postponed
till further notice.</li>
<li class="mb10">There shall be no changes in the Academic Calendar of the current term.</li>
</ul>
We are confident that we will emerge stronger from this as ever and in the next few days we shall be
disseminating further information regarding this. The students are advised to keep in touch with
their <b>LPU-UMS </b>and <b>LPU Live App</b> for regular updates.
</div>
<div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
</div>
</div>
</div>
</div>

<div class="modal fade" id="myLargeModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
<div class="modal-dialog modal-lg modal-dialog-centered" id="modal-width">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
<h4 class="modal-title upcom text-center" id="myLargeModalLabel">Notifications/ Events</h4>
</div>
<div class="modal-body" id="single-modal">
<div id="noti" class="row clearfix">


</div>
</div>
</div>
</div>
</div>
<div class="modal fade" id="ariia" role="dialog">
<div class="vertical-alignment-helper">
<div class="modal-dialog vertical-align-center">

<div class="modal-content cent">
<div style="background-color:#2985c6;" class="modal-header">
<button type="button" style="color:#fff; opacity:1;" class="close" data-dismiss="modal">&times;</button>
<h4 style="background:#2985c5; color:#fff;" class="modal-title">ARIIA</h4>
</div>
<div class="modal-body">
<div class="tabs tabs-bb clearfix" id="tab-9">
<ul class="tab-nav clearfix">
<li><a href="zimbabwe.php#tabs-33">2020</a></li>
</ul>
<div class="tab-container">
<div class="tab-content clearfix" id="tabs-33">
<ul class="iconlist nirf" style="margin:0 0 0 30px;">
<li><a href="../../downloads/ariia-2020.pdf" target="_blank" class="nirf-hd"><i class="icon-ok"></i>Atal Ranking of Institutions on
Innovation Achievements (ARIIA) - 2020<br></a>
</li>
</ul>
</div>
</div>
</div>
</div>
<div class="modal-footer">
<ul class="iconlist text-center nirf" style="margin:0 !important;">
<li class="nirf-hd">Email ID for Comments & Feedback : <span><a href="../../cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="423027252b3136302330022e32376c212d6c2b2c">[email&#160;protected]</a></span>
</li>
</ul>
</div>
</div>
</div>
</div>
</div>
<div class="modal fade" id="nirf" role="dialog">
<div class="modal-dialog modal-lg modal-dialog-centered">

<div class="modal-content cent">
<div style="background-color:#2985c6;" class="modal-header">
<button type="button" style="color:#fff; opacity:1;" class="close" data-dismiss="modal">&times;</button>
<h4 style="background:#2985c5; color:#fff;" class="modal-title">NIRF</h4>
</div>
<div class="modal-body">
<div class="tabs tabs-bb clearfix" id="tab-9">
<ul class="tab-nav clearfix">
<li><a href="zimbabwe.php#tabs-37">2022</a></li>
<li><a href="zimbabwe.php#tabs-38">2023</a></li>
</ul>
<div class="tab-container">
<div class="tab-content clearfix" id="tabs-37">
<ul class="iconlist nirf" style="margin:0 0 0 10px">
<li><a href="../../downloads/nirf/2022/Management.pdf" target="_blank" class="nirf-hd"><i class="icon-ok"></i>Report of NIRF Data Capturing System:
Management</a></li>
<li><a href="../../downloads/nirf/2022/Pharmacy.pdf" target="_blank" class="nirf-hd"><i class="icon-ok"></i>Report of NIRF Data Capturing System:
Pharmacy</a></li>
<li><a href="../../downloads/nirf/2022/Engineering.pdf" target="_blank" class="nirf-hd"><i class="icon-ok"></i>Report of NIRF Data Capturing System:
Engineering</a></li>
<li><a href="../../downloads/nirf/2022/Overall.pdf" target="_blank" class="nirf-hd"><i class="icon-ok"></i>Report of NIRF Data Capturing System:
Overall</a></li>
<li><a href="../../downloads/nirf/2022/Law.pdf" target="_blank" class="nirf-hd"><i class="icon-ok"></i>Report of NIRF Data Capturing System:
Law</a></li>
<li><a href="../../downloads/nirf/2022/Architecture.pdf" target="_blank" class="nirf-hd"><i class="icon-ok"></i>Report of NIRF Data
Capturing System: Architecture</a></li>
</ul>
</div>
<div class="tab-content clearfix" id="tabs-38">
<ul class="iconlist nirf" style="margin:0 0 0 10px">
<li><a href="../../downloads/nirf/2023/Management.pdf" target="_blank" class="nirf-hd"><i class="icon-ok"></i>Report of NIRF Data Capturing System:
Management</a></li>
<li><a href="../../downloads/nirf/2023/Pharmacy.pdf" target="_blank" class="nirf-hd"><i class="icon-ok"></i>Report of NIRF Data Capturing System:
Pharmacy</a></li>
<li><a href="../../downloads/nirf/2023/Engineering.pdf" target="_blank" class="nirf-hd"><i class="icon-ok"></i>Report of NIRF Data Capturing System:
Engineering</a></li>
<li><a href="../../downloads/nirf/2023/Overall.pdf" target="_blank" class="nirf-hd"><i class="icon-ok"></i>Report of NIRF Data Capturing System:
Overall</a></li>
<li><a href="../../downloads/nirf/2023/Law.pdf" target="_blank" class="nirf-hd"><i class="icon-ok"></i>Report of NIRF Data Capturing System:
Law</a></li>
<li><a href="../../downloads/nirf/2023/Architecture.pdf" target="_blank" class="nirf-hd"><i class="icon-ok"></i>Report of NIRF Data Capturing System:
Architecture</a></li>
<li><a href="../../downloads/nirf/2023/Agriculture.pdf" target="_blank" class="nirf-hd"><i class="icon-ok"></i>Report of NIRF Data Capturing System:
Agriculture</a></li>
</ul>
</div>
</div>
</div>
</div>
<div class="modal-footer">
<ul class="iconlist text-center nirf" style="margin:0 !important;">
<li class="nirf-hd">Email ID for Comments & Feedback : <span><a href="../../cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="d4a6b1b3bda7a0a6b5a694b8a4a1fab7bbfabdba">[email&#160;protected]</a></span>
</li>
</ul>
</div>
</div>
</div>
</div>
<div class="modal fade" id="convocation" role="dialog">
<div class="modal-dialog modal-lg modal-dialog-centered">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal">&times;</button>
<div class="modal-title" style="font-size:18px; font-weight:400; color:#232020;"><b>10th Convocation</b>
</div>
</div>
<div class="modal-body">
<p class="mt10 mb5">The photographs of the students, who attended the 10th Convocation are attached
under the following links. Students can download the photographs based on the line number allocated
to them, for the ceremony.</p>
<div class="col-md-12 pa0 mt20">
<div class="col-md-6">
<div class="title-block">
<h4>Convocation (Gold Medalist and Ph.D)</h4>
<span>
<a href="https://photos.app.goo.gl/neBknq7hYLMDJM7X7" target="_blank" class="more-link">Click Here</a>
</span>
</div>
</div>
<div class="col-md-6">
<div class="title-block">
<h4>Convocation (Topper's)</h4>
<span>
<a href="https://photos.app.goo.gl/GWvfmqiC42tVTES26" target="_blank" class="more-link">Click Here</a>
</span>
</div>
</div>
<div class="divider mt10 mb10"><em class="icon-circle"></em>
</div>
<div class="col-md-6">
<div class="title-block">
<h4>Convocation (Line 1)</h4>
<span>
<a href="https://photos.app.goo.gl/VzBZdhDx1nrp1GDq7" target="_blank" class="more-link">Click Here</a>
</span>
</div>
</div>
<div class="col-md-6">
<div class="title-block">
<h4>Convocation (Line 2)</h4>
<span>
<a href="https://photos.app.goo.gl/tcpUdBUKwbs8NZLw5" target="_blank" class="more-link">Click Here</a>
</span>
</div>
</div>
</div>
<div class="divider mt10 mb10"><em class="icon-circle"></em>
</div>
<div class="col-md-12 pa0">
<div class="col-md-6">
<div class="title-block">
<h4>Convocation (Line 3)</h4>
<span>
<a href="https://photos.app.goo.gl/1gw8ksHAZnQZoNuu9" target="_blank" class="more-link">Click Here</a>
</span>
</div>
</div>
<div class="col-md-6">
<div class="title-block">
<h4>Convocation (Line 4)</h4>
<span>
<a href="https://photos.app.goo.gl/2ct7W5Ezy3BWJWLN9" target="_blank" class="more-link">Click Here</a>
</span>
</div>
</div>
</div>
<div class="divider mt10 mb10"><em class="icon-circle"></em>
</div>
<div class="col-md-12 pa0">
<div class="col-md-6">
<div class="title-block">
<h4>Convocation (Line 5)</h4>
<span>
<a href="https://photos.app.goo.gl/YZq5NtahNFr2aaFn9" target="_blank" class="more-link">Click Here</a>
</span>
</div>
</div>
<div class="col-md-6">
<div class="title-block">
<h4>Convocation (Line 6)</h4>
<span>
<a href="https://photos.app.goo.gl/y2YnPW6VNP8YGpui8" target="_blank" class="more-link">Click Here</a>
</span>
</div>
</div>
</div>
<div class="clearfix"></div>
</div>
<div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
</div>
</div>
</div>
</div>
<div class="modal fade" id="StudentGrievance" role="dialog">
<div class="modal-dialog modal-lg modal-dialog-centered">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal">&times;</button>
<div class="modal-title" style="font-size:18px; font-weight:400; color:#232020;"><b>
Grievance Details</b>
</div>
</div>
<div class="modal-body">
<div class="row">
<div class="col-md-6">
<label>Name</label>
<input type="text" class="form-control" id="txtSGName" placeholder="Enter name" />
</div>
<div class="col-md-6">
<label>Email</label>
<input type="text" class="form-control" id="txtSGEmail" placeholder="Enter name" />
</div>
</div>
<div id="dvOtpSend" class="row" style="display: none;">
<div class="col-md-6">
<label>OTP</label>
<input type="text" id="txtOtp" class="form-control" placeholder="Entr OTP">
</div>
<div class="col-md-6">
<label>Phone Number</label>
<input type="text" class="form-control" id="txtSGPhone" placeholder="Enter Phone Number" />
</div>
<div class="col-md-6">
<label>Nature Of Grievance</label>
<select id="ddlNG" class="form-control">
<option value>Select Nature of Grievance</option>
<option value="Examination">Examination</option>
<option value="Academic">Academic</option>
<option value="Fees">Fees</option>
<option value="Others">Others</option>
</select>
</div>
<div class="col-md-6">
<label>Subject</label>
<input type="text" class="form-control" id="txtSGSubject" placeholder="Enter Subject" />
</div>
<div class="col-md-12">
<label>Description</label>
<textarea name="txtSGDesc" class="form-control" id="txtSGDesc" autocomplete="off" placeholder="Type Your Grievance Here" rows="5"></textarea>
</div>
<div class="col-md-12">
<label>Attachment</label>
<input type="file" id="txtFile" />
</div>
<div class="col-md-12 text-center mt15 mb15">
<button type="button" class="btn btn-success" id="btnSG">Submit</button>
<button class="btn btn-primary" id="btnSGLoader" disabled>
<span class="spinner-border spinner-border-sm"></span>
Loading..
</button>
</div>
</div>
<div class="col-md-12 text-center mt15 mb15">
<button type="button" class="btn btn-success" id="btnSGOTP">Send OTP</button>
<button class="btn btn-primary" id="btnSGOtpLoader" disabled>
<span class="spinner-border spinner-border-sm"></span>
Loading..
</button>
</div>
<div class="clearfix"></div>
</div>
<div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
</div>
</div>
</div>
</div>
<input type="hidden" id="getday" value="Tuesday" />
<script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="../../js/jquery.lettering.js"></script>
<script type="text/javascript" src="../../js/jquery.dataTables.min.js" defer></script>
<link rel="stylesheet" href="../../css/jquery.dataTables.css" type="text/css" defer />
<script src="../../js/jquery.popupwindow.js" defer></script>
<div style="display:none !important"></div>
<script defer>
    function isValidEmailAddress(emailAddress) {
        var pattern = new RegExp(/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
        return pattern.test(emailAddress);
    }
    $(document).ready(function () {
        $("#subs-btn").click(function () {
            if (!isValidEmailAddress($("#widget-subscribe-form-email").val())) {
                $('#widget-subscribe-form-result2').attr('data-notify-msg',
                    'Please enter a valid email address');
                SEMICOLON.widget.notifications($('#widget-subscribe-form-result2'));
            } else {
                $("#spinner").removeClass('icon-email2').addClass('icon-line-loader icon-spin');
                var id = $("#widget-subscribe-form-email").val();
                $("#widget-subscribe-form").trigger('ps_gtm_subscribe_email', [id]);
                $.ajax({
                    url: "https://www.lpu.in/SubscribeNewsletter.asmx/Subscribe",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{email:'" + id + "'}",
                    success: function (msg) {
                        $("#spinner").removeClass('icon-line-loader icon-spin').addClass(
                            'icon-email2');
                        $("#widget-subscribe-form-email").val('');
                        if (msg.d == "success") {
                            $('#widget-subscribe-form-result').attr('data-notify-msg',
                                'You have successfully subscribed');
                            SEMICOLON.widget.notifications($(
                                '#widget-subscribe-form-result'));
                        } else if (msg.d == "error") {
                            $('#widget-subscribe-form-result2').attr('data-notify-msg',
                                'You have already subscribed');
                            SEMICOLON.widget.notifications($(
                                '#widget-subscribe-form-result2'));
                        }
                    },
                    error: function () {
                        $("#widget-subscribe-form-email").val('');
                        $("#spinner").removeClass('icon-line-loader icon-spin').addClass(
                            'icon-email2');
                    }
                });
                return false;
            }
        });
    });

    function homeToast(vtype, vtitle, vmsgtext, vNavigationUrl, type) {
        if (type == "link") {
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "newestOnTop": true,
                "progressBar": true,
                "positionClass": "toast-top-left",
                "preventDuplicates": true,
                //"onclick": daljit(),
                onclick: function () {
                    window.open(vNavigationUrl, '_blank');
                },
                "showDuration": "12000",
                "hideDuration": "1000",
                "timeOut": "10000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            }
            toastr[vtype](vmsgtext, vtitle)
        } else if (type == "popup") {
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "newestOnTop": true,
                "progressBar": true,
                "positionClass": "toast-top-left",
                "preventDuplicates": true,
                onclick: function () {
                    $("#" + vNavigationUrl).trigger("click");
                },
                "showDuration": "12000",
                "hideDuration": "1000",
                "timeOut": "10000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            }
            toastr[vtype](vmsgtext, vtitle)
        }
    }
    $(document).scroll(function () {
        var y = $(this).scrollTop();
        if (y > 600) {
            $('.sticky-bar').css('display', 'block');
        } else {
            $('.sticky-bar').css('display', 'none');
        }
    });

    function setModalMaxHeight(element) {
        this.$element = $(element);
        this.$content = this.$element.find('.modal-content');
        var borderWidth = this.$content.outerHeight() - this.$content.innerHeight();
        var dialogMargin = $(window).width() < 768 ? 20 : 60;
        var contentHeight = $(window).height() - (dialogMargin + borderWidth);
        var headerHeight = this.$element.find('.modal-header').outerHeight() || 0;
        var footerHeight = this.$element.find('.modal-footer').outerHeight() || 0;
        var maxHeight = contentHeight - (headerHeight + footerHeight);
        this.$content.css({
            'overflow': 'hidden'
        });
        this.$element
            .find('#myLargeModal .modal-body').css({
                'max-height': maxHeight,
                'overflow-y': 'auto'
            });
    }
    $(document).ready(function () {
        SurveyCount();
    });

    function SurveyCount() {
        $.get('https://schools.lpu.in/Services/api/Services/SurveyCount', function (data) {
            $("#dvCount").html(data);
            $(".counter-grid #dvCount").lettering();
        });
    }
    var textsize = 0;
    var defaultsize = 13;

    function changefont(action) {
        if (action == "i") {
            defaultsize = defaultsize + 1;
        } else {
            defaultsize = defaultsize - 1;
        }
        $("#wrapper div,a,li").children().each(function () {
            var size = parseInt($(this).css("font-size"));
            if (action == "i") {
                size = size + 1 + "px";
            } else {
                size = size - 1 + "px";
            }
            $(this).css({
                'font-size': size
            });
        });
    }

    function resetfont() {
        if (textsize <= 0) {
            $("#wrapper div,a,li").children().each(function () {
                var size = parseInt($(this).css("font-size"));
                size = size + parseInt(textsize) * -1 + "px";
                $(this).css({
                    'font-size': size
                });
            });
        } else {
            $("#wrapper div,a,li").children().each(function () {
                var size = parseInt($(this).css("font-size"));
                size = size - parseInt(textsize) + "px";
                $(this).css({
                    'font-size': size
                });
            });
        }
        textsize = 0;
    }

    function initFreshChat() {
        var data = window.location.href;
        var arr = data.split('/');
        var token = "fd4cfee2-38d2-464c-9dda-fd63659017fb";
        if (arr[3].toLowerCase() == "international") {
            token = null;
        }
        window.fcWidget.init({
            token: token,
            host: "https://wchat.in.freshchat.com"
        });
    }

    function initialize(i, t) {
        var e;
        i.getElementById(t) ? initFreshChat() : ((e = i.createElement("script")).id = t, e.async = !0, e.src =
            "https://wchat.in.freshchat.com/js/widget.js", e.onload = initFreshChat, i.head.appendChild(e))
    }

    function initiateCall() {
        initialize(document, "freshchat-js-sdk")
    }
    window.addEventListener ? window.addEventListener("load", initiateCall, !1) : window.attachEvent("load",
        initiateCall, !1);
    $(window).bind("load", function () {
        setModalMaxHeight();
        homeToast();
        $('.popup-youtube').magnificPopup({
            type: 'iframe',
            mainClass: 'mfp-fade',
            preloader: true,
        });
        $("#bt-notification").click(function () {
            $(".brainstorm").css("display", "");
            $(".upcom").removeClass("hide");
            $(".upcom1").addClass("hide");
            $(".diff-popup ").addClass("col-md-6");
        });
        $("#footer").removeAttr("style");
        if ($('#getday').val() == "Monday" || $('#getday').val() == "Wednesday" || $('#getday').val() ==
            "Friday") {
            $(".si-whatsapp").attr("href",
                "https://api.whatsapp.com/send?phone=+919852569000&text=Hi%2C%20I%20need%20assistance%20for%20Admissions%202023."
            );
            $(".si-whatsapp .st-label").html("Whatsapp only <br>+919852569000");
        } else {
            $(".si-whatsapp").attr("href",
                "https://api.whatsapp.com/send?phone=+919852569000&text=Hi%2C%20I%20need%20assistance%20for%20Admissions%202023."
            );
            $(".si-whatsapp .st-label").html("Whatsapp only <br>+919852569000");
        }
        $('#dexample').DataTable({
            "paging": false,
            "ordering": false,
            "info": false
        });
        var numItems = $('#single-modal .col-md-4').length;
        if (numItems <= 3) {
            $('#myLargeModal').addClass('m10');
        }
        if (numItems > 3) {
            $('#myLargeModal').addClass('m3');
        }
        if (numItems == 1) {
            $('#modal-width').addClass('single-modal');
            $('#noti .col-md-4').addClass('col-12');
        }
        if (numItems == 2) {
            $('#modal-width').addClass('double-modal');
            $('#noti .col-md-4').addClass('col-61');
        }
        var sWidth = $(window).width();
        if (sWidth < 770) {
            $('#noti .col-md-4').removeClass('pl7');
            $('#noti .col-md-4').removeClass('pr7');
            if (numItems == 1) {
                $('#modal-width').removeClass('single-modal');
                $('#noti .col-md-4').removeClass('col-12');
            }
            if (numItems == 2) {
                $('#modal-width').removeClass('double-modal');
                $('#noti .col-md-4').removeClass('col-61');
            }
        }
        $(".covid-popup").click(function () {
            $("#myLargeModal").css('display', 'none');
            $(".covi-close").addClass('covid-close');
        });
        $(document).on('click', '.covid-close', function () {
            //alert();
            $("#myLargeModal").css('display', 'block');
        });
        $(".invert-img").click(function () {
            $("html").toggleClass('invertbody');
        });
        $("#von").click(function () {
            $("#von").addClass("dhide");
            $("#voff").removeClass("dhide");
        });
        $("#voff").click(function () {
            $("#von").removeClass("dhide");
            $("#voff").addClass("dhide");
        });
        $("#in-grey").click(function () {
            $("#in-grey").addClass("dhide");
            $("#in-color").removeClass("dhide");
        });
        $("#in-color").click(function () {
            $("#in-grey").removeClass("dhide");
            $("#in-color").addClass("dhide");
        });
        $('a').keyup(function (e) {
            console.log('keyup called');
            var code = e.keyCode || e.which;
            if (code == '9') {
                responsiveVoice.cancel();
                responsiveVoice.speak('Link 2 ' + $(':focus').text());
            }
        });
        $('button').keyup(function (e) {
            console.log('keyup called');
            var code = e.keyCode || e.which;
            if (code == '9') {
                setTimeout(responsiveVoice.speak($(':focus').text() + ' button'), 1000);
            }
        });
        $('textarea').keyup(function (e) {
            console.log('keyup called');
            var code = e.keyCode || e.which;
            if (code == '9') {
                responsiveVoice.cancel();
                responsiveVoice.speak('Text Input ' + $(':focus').attr('placeholder'));
            }
        });
        $(function () {
            $(".increase").click(function () {
                if (parseInt(textsize) < 4) {
                    changefont("i");
                    textsize = textsize + 1;
                }
            });
            $(".decrease").click(function () {
                if (parseInt(textsize) > -4) {
                    changefont("l");
                    textsize = textsize - 1;
                }
            });
            $(".resetfont").click(function () {
                resetfont();
            });
        });
        $("#oc-posts-top-bar").owlCarousel({
            margin: 20,
            autoplayTimeout: 5000,
            loop: true,
            nav: false,
            navText: ['<i class="icon-angle-left"></i>', '<i class="icon-angle-right"></i>'],
            autoplay: true,
            navigation: false,
            autoplayHoverPause: true,
            dots: false,
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 1
                },
                1000: {
                    items: 1
                },
                1200: {
                    items: 1
                }
            }
        });


        var dataInt = window.location.href;
        var arrInt = dataInt.split('/');
        if (arrInt[3].toLowerCase() == "international") {
            var s = document.createElement("script");
            s.type = "text/javascript";
            s.async = true;
            s.src = "https://widgets.in8.nopaperforms.com/emwgts.js";
            document.body.appendChild(s);

        } else {
            var s = document.createElement("script");
            s.type = "text/javascript";
            s.async = true;
            s.src = "https://lpuwidgets.nopaperforms.com/emwgts.js";
            document.body.appendChild(s);
        }

        // var s = document.createElement("script");
        //     s.type = "text/javascript";
        //     s.async = true;
        //     s.src = "https://lpuwidgets.nopaperforms.com/emwgts.js";
        //     document.body.appendChild(s);


        /* No Paper Forms Code end */
        $('.modal').on('show.bs.modal', function () {
            $(this).show();
            setModalMaxHeight(this);
        });
        $(window).resize(function () {
            if ($('.modal.in').length != 0) {
                setModalMaxHeight($('.modal.in'));
            }
        });
        $('.ppwnd').on('click', function (event) {
            console.log("working");
            event.preventDefault();
            $.popupWindow('//www.lpu.in/ClickToCall.php', {
                //$.popupWindow( '//172.17.60.228/ClickToCall.php', {
                width: 420,
                height: 630
            });
        });
        $('button[data-link-href="#ppwnd"]').on('click', function (event) {
            alert();
            console.log("working");
            event.preventDefault();
            $.popupWindow('//www.lpu.in/ClickToCall.php', {
                //$.popupWindow( '//172.17.60.228/ClickToCall.php', {
                width: 420,
                height: 630
            });
        });
    });
</script>
<script>
    let ncount = 0;
    $('.feedback-btn').click(function () {
        ncount = 0;
        feedbackForms();
        $('#feedback-modal').removeAttr("style");
        $('#feedback-modal').css("display", "flex");
    });
    let allQuestionAnswers = [];
    let firstQuestion = [];
    let yesQuestion = [];
    let noQuestion = [];
    feedbackForms();
    let lengthNumber = 0;
    let totalLength = 0;
    let nextIndex = 0;
    let alreadyUsed = 0;

    function feedbackForms() {
        $("#feebackSubmitbtn1").hide();

        $.get('https://services.lpu.in/api/website/GetFeeBackQuestionAnswers', function (data) {
            //$.get('http://localhost:64383/api/website/GetFeeBackQuestionAnswers', function(data) {
            //debugger;
            // console.log(data);

            alreadyUsed = 0;
            nextIndex = 0;

            let linkedQue = '';
            let dt = data.filter(x => x.LinkedQUestion != '0');

            if (dt.length > 0) {
                yesQuestion = [];
                firstQuestion = dt[0];
                let newAll = data.filter(x => x.QuestionId != dt[0]['LinkedQUestion']);
                for (let i = 1; i < newAll.length; i++) {
                    yesQuestion.push(newAll[i]);
                }

                // yesQuestions = data.filter(x=>x.QuestionId != dt[0]['LinkedQUestion']);
                linkedQue = dt[0]['LinkedQUestion'];
                noQuestion = [];
                //  noQuestion.push(dt[0]);
                noQuestion.push(data.filter(x => x.QuestionId == linkedQue)[0]);
                let dddd = data;
                dddd = dddd.filter(x => x.QuestionId != dt[0].QuestionId);
                dddd = dddd.filter(x => x.QuestionId != linkedQue);
                for (let i = 0; i < dddd.length; i++) {
                    noQuestion.push(dddd[i]);
                }
            }


            var item = yesQuestion;
            var html1 = '';
            $("#dvWaitFeeback").hide();
            $("#dvfeedback").html('');
            $("#feebackSubmitbtn").hide();
            //debugger;
            let allData = yesQuestion;
            let allDataN = noQuestion;
            allQuestionAnswers = allData;
            totalLength = allData.length;


            html1 = "<div id='dvQuestions0' ><h4 id='question0' class='mb10'>Q1:" + firstQuestion.Question +
                "</h4>";

            var htmlAnswer1 = "<div>";
            if (firstQuestion.Type == 'text') {
                htmlAnswer1 += "<textarea rows='4' onclick='gotonext(0);' id='AnswerQuesion_" +
                    firstQuestion["QuestionId"] +
                    "'  class='feedbackData form-control' style='width: 95%;resize: none;'    />";
            } else {
                for (let j = 0; j < firstQuestion.feedBackAnswers.length; j++) {
                    htmlAnswer1 += "<input id='Answer" + firstQuestion.feedBackAnswers[j]["AnswerId"] +
                        "' onclick='gotonext(0);' class='radio-style feedbackData' name='radio-group-" +
                        firstQuestion.QuestionId + "' type='radio'><label for='Answer" + firstQuestion
                        .feedBackAnswers[j]["AnswerId"] + "' class='radio-style-2-label'>" + firstQuestion
                        .feedBackAnswers[j]["Answer"] + "</label>";
                }
            }

            html1 += htmlAnswer1;
            $("#dvfeedback").html(html1);
            // var x = 0;
            // for (let i = 0; i < allData.length; i++) {
            //     if (i == 0) {
            //         x++;
            //         html += "<div id='dvQuestionsy" + i + "' ><h4 id='questiony" + i + "' class='mb10'>Q " + x +
            //             ": " + allData[i].Question + "</h4>";
            //     } else {
            //         x++;
            //         html += "<div id='dvQuestionsy" + i + "' style='display:none;'><h4 id='questiony" + i +
            //             "' class='mb10'>Q " + x + ": " + allData[i].Question + "</h4>";
            //     }
            //     var htmlAnswer = "<div>";
            //     if (allData[i].Type == 'text') {
            //         htmlAnswer += "<textarea rows='4' onclick='gotonext(" + i + ");' id='AnswerQuesiony_" +
            //             allData[i]["QuestionId"] +
            //             "'  class='feedbackData form-control' style='width: 95%;resize: none;'    />";
            //     } else {
            //         for (let j = 0; j < allData[i].feedBackAnswers.length; j++) {
            //             htmlAnswer += "<input id='Answery" + allData[i].feedBackAnswers[j]["AnswerId"] +
            //                 "' onclick='gotonext(" + i +
            //                 ");' class='radio-style feedbackData' name='radio-group-" +
            //                 allData[i].QuestionId + "' type='radio'><label for='Answery" + allData[i]
            //                 .feedBackAnswers[j]["AnswerId"] + "' class='radio-style-2-label'>" + allData[i]
            //                 .feedBackAnswers[j]["Answer"] + "</label>";
            //         }
            //     }
            //     htmlAnswer += "</div></div>"
            //     html += htmlAnswer;
            // }



            // $("#dvfeedback").html(html);










        });
    }


    function gotoNextNew() {
        $("#dvQuestions" + nextIndex).hide();
        $("#feebackSubmitbtn1").hide();

        nextIndex++;
        ncount++;
        $("#dvQuestions" + nextIndex).show();
        $("#dvWaitFeeback").hide();
        // gotonext(nextIndex);
    }

    function gotonext11(i) {
        alreadyUsed = 1;
        nextIndex = i;
        $("#feebackSubmitbtn1").show();
    }

    function gotonext(i) {

        var html = '';
        if (i == 0) {

            let ddd = firstQuestion;
            let datas = $('input[name="radio-group-' + firstQuestion.QuestionId + '"]:checked')[0][
                'id'
            ];
            let splitValue = datas.split('Answer');
            var params = {};

            $('input[name="radio-group-' + firstQuestion.QuestionId + '"]:checked').each(function () {
                var idVal = $(this).attr("id");
                if ($("label[for='" + idVal + "']").text() == 'No') {


                    var x = 0;
                    let allQUestionsN = [];
                    allQUestionsN.push(firstQuestion);
                    for (let i = 0; i < noQuestion.length; i++) {
                        allQUestionsN.push(noQuestion[i]);
                    }
                    allQuestionAnswers = allQUestionsN;
                    let allData = allQuestionAnswers;
                    for (let i = 1; i < allData.length; i++) {
                        let qIndex = i + 1;
                        html += "<div id='dvQuestions" + i + "' style='display:none;'><h4 id='question" + i +
                            "' class='mb10'>Q " + qIndex + ": " + allData[i].Question + "</h4>";

                        var htmlAnswer = "<div>";
                        if (allData[i].Type == 'text') {
                            let h = i;
                            if (h + 1 == allData.length) {
                                htmlAnswer += "<textarea rows='4' onclick='gotonext(" + i +
                                    ");' id='AnswerQuesion_" +
                                    allData[i]["QuestionId"] +
                                    "'  class='feedbackData form-control' style='width: 95%;resize: none;'    />";
                            } else {
                                htmlAnswer += "<textarea rows='4' onclick='gotonext11(" + i +
                                    ");' id='AnswerQuesion_" +
                                    allData[i]["QuestionId"] +
                                    "'  class='feedbackData form-control' style='width: 95%;resize: none;'    />";
                            }
                        } else {
                            for (let j = 0; j < allData[i].feedBackAnswers.length; j++) {
                                htmlAnswer += "<input id='Answer" + allData[i].feedBackAnswers[j]["AnswerId"] +
                                    "' onclick='gotonext(" + i +
                                    ");' class='radio-style feedbackData' name='radio-group-" +
                                    allData[i].QuestionId + "' type='radio'><label for='Answer" + allData[i]
                                    .feedBackAnswers[j]["AnswerId"] + "' class='radio-style-2-label'>" +
                                    allData[i]
                                    .feedBackAnswers[j]["Answer"] + "</label>";
                            }
                        }
                        htmlAnswer += "</div></div>"
                        html += htmlAnswer;
                    }



                    $("#dvfeedback").append(html);

                    totalLength = allData.length;


                } else {
                    let allQUestionsN = [];
                    allQUestionsN.push(firstQuestion);
                    for (let i = 0; i < yesQuestion.length; i++) {
                        allQUestionsN.push(yesQuestion[i]);
                    }
                    allQuestionAnswers = allQUestionsN;
                    let allData = allQuestionAnswers;
                    for (let i = 1; i < allData.length; i++) {

                        let qIndex = i + 1;
                        html += "<div id='dvQuestions" + i + "' style='display:none;'><h4 id='question" + i +
                            "' class='mb10'>Q " + qIndex + ": " + allData[i].Question + "</h4>";

                        var htmlAnswer = "<div>";
                        if (allData[i].Type == 'text') {
                            htmlAnswer += "<textarea rows='4' onclick='gotonext(" + i +
                                ");' id='AnswerQuesion_" +
                                allData[i]["QuestionId"] +
                                "'  class='feedbackData form-control' style='width: 95%;resize: none;'    />";
                        } else {
                            for (let j = 0; j < allData[i].feedBackAnswers.length; j++) {
                                htmlAnswer += "<input id='Answer" + allData[i].feedBackAnswers[j]["AnswerId"] +
                                    "' onclick='gotonext(" + i +
                                    ");' class='radio-style feedbackData' name='radio-group-" +
                                    allData[i].QuestionId + "' type='radio'><label for='Answer" + allData[i]
                                    .feedBackAnswers[j]["AnswerId"] + "' class='radio-style-2-label'>" +
                                    allData[i]
                                    .feedBackAnswers[j]["Answer"] + "</label>";
                            }
                        }
                        htmlAnswer += "</div></div>"
                        html += htmlAnswer;
                    }



                    $("#dvfeedback").append(html);
                    totalLength = allData.length;

                }
            });


        }


        if (totalLength != ncount) {
            ncount++;
            $("#dvWaitFeeback").show();
        } else {
            $("#dvWaitFeeback").hide();
        }
        let v = i + 1;
        lengthNumber = v;
        setTimeout(function () {
            if (totalLength == ncount) {
                $("#dvWaitFeeback").hide();
                $("#feebackSubmitbtn").show();
            } else {
                $("#dvQuestions" + i).hide();
                $("#dvQuestions" + lengthNumber).show();
                $("#dvWaitFeeback").hide();
            }
            if (alreadyUsed > 0) {
                if (allQuestionAnswers[i + 1]['Type'] == 'text') {
                    $("#feebackSubmitbtn").show();
                }
            }

        }, 700);
    }

    function submitFeeback() {
        let counts = 0;
        let allAnsers = '';
        for (let i = 0; i < allQuestionAnswers.length; i++) {
            if (allQuestionAnswers[i]['Type'] == 'text') {
                let newAnswers = $('#AnswerQuesion_' + allQuestionAnswers[i]['QuestionId']).val()
                allAnsers += allQuestionAnswers[i].QuestionId + "," + newAnswers + "_";

            } else {
                if ($('input[name="radio-group-' + allQuestionAnswers[i].QuestionId + '"]:checked').length > 0) {
                    let datas = $('input[name="radio-group-' + allQuestionAnswers[i].QuestionId + '"]:checked')[0][
                        'id'
                    ];
                    let splitValue = datas.split('Answer');
                    var params = {};
                    // params['QuestionId'] = allQuestionAnswers[i].QuestionId;
                    // params['AnswereId'] = splitValue[1];
                    allAnsers += allQuestionAnswers[i].QuestionId + "," + splitValue[1] + "_";
                    //allAnsers.push({ QuestionId: allQuestionAnswers[i].QuestionId, AnswerId: splitValue[1]});
                } else {
                    counts++;
                }
            }
        }
        //debugger;
        if (counts > 0) {
            Swal.fire(
                'Good job!',
                'Please fill all feedback forms !',
                'error'
            )
            //alert("");
        } else {
            var questionAnswers = [];
            var d = {
                Questions: allAnsers
            }

            questionAnswers.push(d);
            //debugger;
            $.post('https://services.lpu.in/api/website/AddFeeBackQuestionAnswers', d,
                function (data) {
                    Swal.fire(
                        'Good job!',
                        'Feedback captured successfully !',
                        'success'
                    )
                    feedbackForms();
                    $('#feedback-modal').modal('hide');
                });
        }
    }

    function IsEmail(email) {
        var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if (!regex.test(email)) {
            return false;
        } else {
            return true;
        }
    }

    $("#btnSGOTP").click(function () {
        if ($("#txtSGEmail").val() != '') {
            if (IsEmail($("#txtSGEmail").val())) {
                $("#btnSGOTP").hide();
                $("#btnSGOtpLoader").show();
              //  $.get('http://localhost:44319/api/Event/sendOtp?email=' + $("#txtSGEmail").val(), function (
                 $.get('https://schools.lpu.in/Services/api/Event/sendOtp?email=' + $("#txtSGEmail").val(), function (
                    data) {
                    if (data == 'success') {
                        Swal.fire(
                        'Success!',
                        'otp sent on your email id please check !',
                        'success'
                    )
                        $('#btnSGOTP').hide();
                        $('#dvOtpSend').show();
                        $("#btnSGOtpLoader").hide();
                    }
                    else{
                        Swal.fire(
                        'error!',
                        'something wrong try again later !',
                        'error'
                    )
                        $("#btnSGOTP").show();
                        $("#btnSGOtpLoader").hide();
                    }
                });
            } else {
                Swal.fire(
                    'Error!',
                    'Please enter valid email !',
                    'error'
                )
            }
        } else {
            Swal.fire(
                'Error!',
                'Please enter email !',
                'error'
            )
        }
    });
    $("#aStudentGrievance").click(function () {
        $('#txtSGName').val('');
                    $('#txtSGEmail').val('');
                    $('#txtSGPhone').val('');
                    $('#txtSGDesc').val('');
                    $('#txtSGSubject').val('');
                    $('#ddlNG').val('');
                    $('#txtOtp').val('');
                    $('#btnSGOTP').show();
                    $('#dvOtpSend').hide();

        $('#StudentGrievance').modal('hide');
        $("#btnSGOtpLoader").hide();
        $("#btnSGLoader").hide();
    });

    $("#btnSG").click(function () {
        // txtSGName,txtSGEmail,txtOtp,txtSGPhone,txtSGDesc
        if($('#txtSGName').val() == ''){
            Swal.fire(
                        'Error!',
                        'Please enter name !',
                        'error'
                    )
                    return false;
        }
        if($('#txtSGEmail').val() == ''){
            Swal.fire(
                        'Error!',
                        'Please enter email !',
                        'error'
                    )
                    return false;
        }
        if($('#txtSGPhone').val() == ''){
            Swal.fire(
                        'Error!',
                        'Please enter phone !',
                        'error'
                    )
                    return false;
        }
        if($('#txtOtp').val() == ''){
            Swal.fire(
                        'Error!',
                        'Please enter otp !',
                        'error'
                    )
                    return false;
        }
        if($('#ddlNG').val() == ''){
            Swal.fire(
                        'Error!',
                        'Please select nature of grievance !',
                        'error'
                    )
                    return false;
        }
        if($('#txtSGSubject').val() == ''){
            Swal.fire(
                        'Error!',
                        'Please enter subject !',
                        'error'
                    )
                    return false;
        }
        if($('#txtSGDesc').val() == ''){
            Swal.fire(
                        'Error!',
                        'Please enter description !',
                        'error'
                    )
                    return false;
        }
        var d = {
            Name: $('#txtSGName').val(),
            Email: $('#txtSGEmail').val(),
            Phone: $('#txtSGPhone').val(),
            Desc: $('#txtSGDesc').val(),
            Otp: $('#txtOtp').val()
        }
        $("#btnSG").hide();
        $("#btnSGLoader").show();

        var formData = new FormData();
        formData.append("SGName", $("#txtSGName").val());
        formData.append("SGEmail", $("#txtSGEmail").val());
        formData.append("SGPhone", $("#txtSGPhone").val());
        formData.append("SGDesc", $("#txtSGDesc").val());
        formData.append("Otp", $("#txtOtp").val());
        formData.append("nature", $("#ddlNG").val());
        formData.append("SGSubject", $("#txtSGSubject").val());
        formData.append("file", $("#txtFile")[0].files[0]);


        $.ajax({
                url: 'https://schools.lpu.in/Services/api/Event/AddStudentGrievance',
                type: 'POST',
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                success: function (data) {

                    if (data == 'otp not verified') {
                    Swal.fire(
                        'Error!',
                        'Invalid OTP !',
                        'error'
                    )
                    $("#btnSG").show();
                    $("#btnSGLoader").hide();

                } else if (data == '0') {
                    Swal.fire(
                        'Error!',
                        'Something wrong try again later !',
                        'error'
                    )
                    $("#btnSG").show();
                    $("#btnSGLoader").hide();

                } else {
                    Swal.fire(
                        'Success!',
                        'Student Grievance feedback captured successfully !',
                        'success'
                    )
                    $("#btnSG").show();
                    $("#btnSGLoader").hide();

                    $('#txtSGName').val('');
                    $('#txtSGEmail').val('');
                    $('#txtSGPhone').val('');
                    $('#txtSGDesc').val('');
                    $('#txtSGSubject').val('');
                    $('#ddlNG').val('');
                    $('#txtOtp').val('');
                    $('#btnSGOTP').show();
                    $('#dvOtpSend').hide();
                    $('#StudentGrievance').modal('hide');
                }

                },
            });



        // $.post('https://schools.lpu.in/Services/api/Event/AddStudentGrievance', d,
        //     function (data) {
        //         //debugger;
        //         if (data == 'otp not verified') {
        //             Swal.fire(
        //                 'Error!',
        //                 'Invalid OTP !',
        //                 'error'
        //             )
        //             $("#btnSG").show();
        //             $("#btnSGLoader").hide();

        //         } else if (data == '0') {
        //             Swal.fire(
        //                 'Error!',
        //                 'Something wrong try again later !',
        //                 'error'
        //             )
        //             $("#btnSG").show();
        //             $("#btnSGLoader").hide();

        //         } else {
        //             Swal.fire(
        //                 'Good job!',
        //                 'Feedback captured successfully !',
        //                 'success'
        //             )
        //             $("#btnSG").show();
        //             $("#btnSGLoader").hide();

        //             $('#txtSGName').val('');
        //             $('#txtSGEmail').val('');
        //             $('#txtSGPhone').val('');
        //             $('#txtSGDesc').val('');
        //             $('#txtOtp').val('');
        //             $('#btnSGOTP').show();
        //             $('#dvOtpSend').hide();
        //             $('#StudentGrievance').modal('hide');
        //         }
        //     });
    });
</script> </div>
<div id="gotoTop" class="icon-angle-up"></div>
<script type="text/javascript" src="../../assets/js/functions.js" async></script>

<link rel="stylesheet" href="css/pagination.css" />
<script>
        $(document).ready(function() {

            var actionWidth = $(window).width();
            if (actionWidth < 770) {
                $('.container').addClass('container-fluid');
                $('.container-fluid').removeClass('container');
            }

            // import { TabAccordion } from 'js/TabAccordion'
            // import { TabAccordions } from 'js/TabAccordions'
            // exports.TabAccordion = TabAccordion
            // exports.TabAccordions = TabAccordions
            // new TabAccordions();
            var bigimage = $("#big");
            var thumbs = $("#thumbs");
            //var totalslides = 10;
            var syncedSecondary = true;
            bigimage
                .owlCarousel({
                    items: 1,
                    slideSpeed: 2000,
                    nav: true,
                    autoplay: true,
                    dots: false,
                    loop: true,
                    responsiveRefreshRate: 200,
                    navText: [
                        '<img src="images/arrow-left-s.svg">',
                        '<img src="images/arrow-right-s.svg">'
                    ]
                })
                .on("changed.owl.carousel", syncPosition);
            thumbs
                .on("initialized.owl.carousel", function() {
                    thumbs
                        .find(".owl-item")
                        .eq(0)
                        .addClass("current");
                })
                .owlCarousel({
                    items: 2,
                    dots: false,
                    autoplay: true,
                    nav: false,
                    navText: [
                        '<img src="images/arrow-left-s.svg">',
                        '<img src="images/arrow-right-s.svg">'
                    ],
                    smartSpeed: 200,
                    slideSpeed: 500,
                    slideBy: 1,
                    responsiveRefreshRate: 100
                })
                .on("changed.owl.carousel", syncPosition2);

            function syncPosition(el) {
                //if loop is set to false, then you have to uncomment the next line
                //var current = el.item.index;
                //to disable loop, comment this block
                var count = el.item.count - 1;
                var current = Math.round(el.item.index - el.item.count / 2 - 0.5);
                if (current < 0) {
                    current = count;
                }
                if (current > count) {
                    current = 0;
                }
                //to this
                thumbs
                    .find(".owl-item")
                    .removeClass("current")
                    .eq(current)
                    .addClass("current");
                var onscreen = thumbs.find(".owl-item.active").length - 1;
                var start = thumbs
                    .find(".owl-item.active")
                    .first()
                    .index();
                var end = thumbs
                    .find(".owl-item.active")
                    .last()
                    .index();
                if (current > end) {
                    thumbs.data("owl.carousel").to(current, 100, true);
                }
                if (current < start) {
                    thumbs.data("owl.carousel").to(current - onscreen, 100, true);
                }
            }

            function syncPosition2(el) {
                if (syncedSecondary) {
                    var number = el.item.index;
                    bigimage.data("owl.carousel").to(number, 100, true);
                }
            }
            thumbs.on("click", ".owl-item", function(e) {
                e.preventDefault();
                var number = $(this).index();
                bigimage.data("owl.carousel").to(number, 300, true);
            });
        });

        // tabbed content
        // http://www.entheosweb.com/tutorials/css/tabs.asp
        $(".tab_content").hide();
        $(".tab_content:first").show();

        /* if in tab mode */
        $("ul.tabs li").click(function() {

            $(".tab_content").hide();
            var activeTab = $(this).attr("rel");
            $("#" + activeTab).fadeIn();

            $("ul.tabs li").removeClass("active");
            $(this).addClass("active");

            $(".tab_drawer_heading").removeClass("d_active");
            $(".tab_drawer_heading[rel^='" + activeTab + "']").addClass("d_active");

        });
        /* if in drawer mode */
        $(".tab_drawer_heading").click(function() {

            $(".tab_content").hide();
            var d_activeTab = $(this).attr("rel");
            $("#" + d_activeTab).fadeIn();

            $(".tab_drawer_heading").removeClass("d_active");
            $(this).addClass("d_active");

            $("ul.tabs li").removeClass("active");
            $("ul.tabs li[rel^='" + d_activeTab + "']").addClass("active");
        });


        /* Extra class "tab_last" 
           to add border to right side
           of last tab */
        $('ul.tabs li').last().addClass("tab_last");
    </script>
<script>(function(){var js = "window['__CF$cv$params']={r:'80579ceb49a30b6e',t:'MTY5NDUxNjA3Mi40NjMwMDA='};_cpo=document.createElement('script');_cpo.nonce='',_cpo.src='/cdn-cgi/challenge-platform/scripts/jsd/main.js',document.getElementsByTagName('head')[0].appendChild(_cpo);";var _0xh = document.createElement('iframe');_0xh.height = 1;_0xh.width = 1;_0xh.style.position = 'absolute';_0xh.style.top = 0;_0xh.style.left = 0;_0xh.style.border = 'none';_0xh.style.visibility = 'hidden';document.body.appendChild(_0xh);function handler() {var _0xi = _0xh.contentDocument || _0xh.contentWindow.document;if (_0xi) {var _0xj = _0xi.createElement('script');_0xj.innerHTML = js;_0xi.getElementsByTagName('head')[0].appendChild(_0xj);}}if (document.readyState !== 'loading') {handler();} else if (window.addEventListener) {document.addEventListener('DOMContentLoaded', handler);} else {var prev = document.onreadystatechange || function () {};document.onreadystatechange = function (e) {prev(e);if (document.readyState !== 'loading') {document.onreadystatechange = prev;handler();}};}})();</script><script defer src="https://static.cloudflareinsights.com/beacon.min.js/v8b253dfea2ab4077af8c6f58422dfbfd1689876627854" integrity="sha512-bjgnUKX4azu3dLTVtie9u6TKqgx29RBwfj3QXYt5EKfWM/9hPSAI/4qcV5NACjwAo8UtTeWefx6Zq5PHcMm7Tg==" data-cf-beacon='{"rayId":"80579ceb49a30b6e","version":"2023.8.0","b":1,"token":"c5db119ec2de4adc8b8b1d95388884a3","si":100}' crossorigin="anonymous"></script>
</body>
</html>