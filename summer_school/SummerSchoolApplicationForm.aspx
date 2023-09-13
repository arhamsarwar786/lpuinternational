

<!DOCTYPE html>
<html>
<head><title>
	India's Largest Best Private University in Punjab - LPU
</title><meta http-equiv="content-type" content="text/html; charset=utf-8" /><meta name="viewport" content="width=device-width, initial-scale=1" /><link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700" rel="stylesheet" /><link rel="stylesheet" href="../../css/bootstrap.css" type="text/css" /><link rel="stylesheet" href="../../style.css" type="text/css" /><link rel="stylesheet" href="../../css/dark.css" type="text/css" /><link rel="stylesheet" href="../../css/font-icons.css" type="text/css" /><link rel="stylesheet" href="../../css/animate.css" type="text/css" /><link rel="stylesheet" href="../../css/magnific-popup.css" type="text/css" /><link rel="stylesheet" href="../../css/vmap.css" type="text/css" /><link rel="stylesheet" href="../../css/responsive.css" type="text/css" /><link rel="stylesheet" href="../../css/home-custom.css" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/plugins.js"></script>
<style type="text/css">
        .ss-from strong {
            display: block;
        }

        h3 {
            display: block;
            padding: 10px 20px;
            font-size: 18px;
            color: #555555;
            font-family: 'Lato', sans-serif;
            text-transform: uppercase;
            margin: 0 !important;
        }

        .ss-from input {
            padding-right: 20px;
        }


        .past_qualification_detail input {
            width: auto !iportant;
        }

        .form-control[readonly] {
            background-color: #fff;
        }

        .iagree input {
            width: auto !important;
            margin-right: 10px !important;
        }

        .radio2 input[type="radio"] {
            width: auto !important;
            margin-right: 23px !important;
        }

        .radio3 input[type="radio"] {
            width: auto !important;
            margin-right: 5px !important;
        }

        label {
            padding-right: 15px !important;
            padding-top: 5px !important;
        }

        .heading-summer {
            font-size: 30px;
            margin-bottom: 0;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: #333;
            text-align: center;
        }

        @media screen and (max-width: 991px) {
            label {
                display: inline;
            }

            .radio2 input[type="radio"] {
                margin-right: 5px !important;
            }
        }
    </style>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
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
<script type="text/javascript">(function(c,l,a,r,i,t,y){c[a]=c[a]||function(){(c[a].q=c[a].q||[]).push(arguments)};t=l.createElement(r);t.async=1;t.src="https://www.clarity.ms/tag/"+i+"?ref=gtm2";y=l.getElementsByTagName(r)[0];y.parentNode.insertBefore(t,y);})(window,document,"clarity","script","h9c6eqysbs");</script><link href="../../WebResource.axd?d=hcXDZhXiidgsQUtEo5iT3ylU1wM43ygPiiBGgmSLW6E22psaHemfi4ngi1GtVn2d6oFE7Kva9zezSI7lIwk-KOIX6GNG0SeAjaoC1OoSKYstZpIQ05r1yZUnUH8SWIxjP8pMCfTLj_kPx8aTvrxMeU_SPxFiUbJb1YKnVbmHKnI1&amp;t=635941549779291656" type="text/css" rel="stylesheet" /><link href="../../WebResource.axd?d=-H-7euyzCq22q5_s0z2InCyaB5Xw07FcxJku5s8U402F8XwRVB12ZsD6qWFeyrvlxjuB564zBrSCiT8tNCKDwCPHp6TSuBa5cgXRy4gv5gIUMyl_YfdcZJasCnL1NQBkj68gSwSi_b__1U_y_YMDQw2&amp;t=635941549779291656" type="text/css" rel="stylesheet" /></head>
<body class="stretched">
<div id="wrapper" class="clearfix">
<script type="text/javascript">
    var npf_d = 'https://admission.lpu.in';
    var npf_c = '524';
    var npf_m = '1';
    var s = document.createElement("script");
    s.type = "text/javascript";
    s.async = true;
    s.src = "https://track.nopaperforms.com/js/track.js";
    document.body.appendChild(s);
</script>
<style>
    .my-nav {
        height: 0 !important
    }

    .top-bar-fixed {
        position: fixed !important;
        width: 100%;
        z-index: 999;
        transition: all .3s ease-in-out;
    }

    #top-bar .top-bar-apply {
        display: none;
        transition: all .3s ease-in-out;
    }

    @media (max-width:767px) {
        #lpu-bar .owl-carousel {
            padding: 0 30px !important;
        }
    }

    .lpu-hello-bar .oc-item {
        margin: 0 !important;
    }

    .jobs-color {
        color: #f68220 !important;
        font-weight: 500;
    }

    .jobs-color:hover {
        color: #fff !important;
    }

    .lpu-top-bar .gc-course-carousel a {
        color: #000 !important;
        font-size: 16px;
        font-weight: bold !important;
    }
</style>

<div class="lpu-hello-bar" id="lpu-bar">
<div class="lpu-bar-grid">
<div class="lpu-top-bar col-lg-11 pa0">
<i class="icon icon-bullhorn" aria-hidden="true"></i>
<a target="_blank" href="https://admission.lpu.in/" data-gtm-ps-applynow="Hello Bar" style="color:#000">
<strong> Admission Open for Architecture and Education Programs Only. Apply Now! </strong>
</a>




</div>
<div class="lpu-social-logo col-lg-1 pa0">
<a href="../country/css/images/bhutan/breadcrumbmask.png"><img src="../../images/logo/social-logo-lpu-big.svg" /></a>
</div>
</div>
</div>

<div id="top-bar" class="ps-top-bar slider-top-link">
<div class="container-fluid  pa0">
<div class="col_half nobottommargin mr0 fright top-links-mobile">
<div class="top-links  dark">
<ul>
<li class="hidden-xs hidden-xxs hidden-sm hidden-md"><a href="https://ums.lpu.in/lpuums" target="_blank">Parent's Login</a></li>

<li class="hidden-xs hidden-xxs hidden-sm hidden-md"><a href="../../jobs/index.html" class="jobs-color">Jobs at LPU</a></li>
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
<li class="hidden-xs hidden-xxs hidden-sm"><a href="../../contact_us/contact-us.php">Contact
Us</a></li>
<li class="hidden-lg hidden-md"><a href="../../academics/index.html">Academics</a></li>
<li class="hidden-lg hidden-md"><a href="../../admission/admissions.php" target="_blank">Admissions</a></li>
<li class="hidden-lg hidden-md"><a href="../../placements.php">Placements</a></li>
<li class="top-bar-apply"><a href="https://admission.lpu.in/" class="nest-result-old " target="_blank">Apply Now</a></li>
</ul>
</div>
</div>

</div>
</div>
<script>
    $(document).ready(function() {
        var ocPosts = $(".gc-course-carousel");
        ocPosts.owlCarousel({
            loop: true,
            autoplay: true,
            autoplayHoverPause: true,
            responsiveClass: true,
            dots: false,
            nav: true,
            navContainerClass: 'my-nav',
            navText: [
                "<img src='../../images/top-left-arrow.png'>",
                "<img src='../../images/top-right-arrow.png'>"
            ],
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
</script>
<style>
    .my-nav button.disabled {
        opacity: 0.2 !important;
    }

    .my-nav button {
        background: transparent;
        border: none;
    }

    .gc-course-carousel .owl-next img {
        right: 0;
        position: absolute;
        top: 4px;
        width: 22px;
        height: 19px;
        cursor: pointer;
    }

    .gc-course-carousel .owl-prev img {
        position: absolute;
        left: 0;
        top: 4px;
        width: 22px;
        height: 19px;
        cursor: pointer;
    }

    .lpu-hello-bar {
        background-color: #fccb92;
        color: #000000;
        padding: 9px 10px;
        text-align: center;
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
</style>
<style>
    /*#top-bar {
    margin-top: 0 !important;
}*/
    /*Hello Bar Start*/
    .lpu-hello-bar {
        background-color: #fccb92;
        color: #000000;
        padding: 9px 10px;
        text-align: center;
    }

    .font18 {
        font-size: 18px;
    }

    .section-mt40 {
        margin-top: 40px !important;
    }

    /* for landing page */
    .font15b {
        font-size: 16px;
        font-weight: bold !important;
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
        .lpu-hello-bar {
            position: static !important;
        }

        #top-bar {
            margin-top: 0;
            top: 0;
        }

        .section-mt40 {
            margin-top: 0 !important;
        }
    }

    /* for landing page */
</style>
<style>
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
        margin-top: 54px;
    }

    #header.sticky-header:not(.static-sticky),
    #header.sticky-header:not(.static-sticky) #header-wrap,
    #header.sticky-header:not(.static-sticky):not(.sticky-style-2) #logo img,
    #header.sticky-header:not(.static-sticky) #primary-menu,
    #header.sticky-header:not(.static-sticky) #primary-menu>ul,
    #header.sticky-header:not(.static-sticky) #primary-menu>ul>li>a {
        height: 120px;
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


    @media(max-width:1370px) {
        .lpu-top-bar .font15b {
            font-size: 14px;
        }
    }



    @media(max-width:1200px) {
        #top-bar {
            margin-top: 61px;
        }
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

    #primary-menu ul ul a {
        font-size: 13px;
    }

    .sp-active {
        color: #f68121;
    }

    #primary-menu ul li .mega-menu-content.style-2>ul>li.mega-menu-title:hover>a {
        color: #F68121 !important;
    }

    #primary-menu ul li .mega-menu-content.style-2 ul.mega-menu-column>li.mega-menu-title>a.gc-menu-title:hover {
        color: #444 !important;
    }

    #primary-menu ul ul li:hover>a,
    #primary-menu ul ul li a:hover,
    .ps #primary-menu:not(.not-dark) ul li .mega-menu-content.style-2>ul>li.mega-menu-title:hover>a {
        color: #F68121 !important;
    }

    #header.sticky-header #header-wrap {
        top: 0 !important;
    }

    #page-menu.sticky-page-menu #page-menu-wrap,
    .main-nav-scrolled {
        top: 120px !important;
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

    .navi-logo-u {
        height: 24px;
        width: auto;
    }

    @media (max-width: 991px) {
        .academics-border-right ul:first-child {
            border-right: transparent !important;
        }

        #primary-menu ul li .mega-menu-content.style-2>ul>li.mega-menu-title>a {
            height: 100% !important;
        }
    }
</style>
<script src="../../js/speak.js" async></script>

<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-P8ZP9K2" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>

<header id="header" class="full-header ps-header" data-responsive-class="not-dark">
<div id="header-wrap">
<div class="container clearfix">
<div id="primary-menu-trigger"><i class="icon-reorder"></i>
</div>
<div id="logo">
<a href="../country/css/images/bhutan/breadcrumbmask.png" class="standard-logo" data-sticky-logo="//www.lpu.in/images/logo/logo-media.svg" data-dark-logo="//www.lpu.in/images/logo/logo-dark.svg" data-mobile-logo="//www.lpu.in/images/logo/logo-media.svg"><img src="../../images/logo/logo.svg" alt="LPU Logo" width="auto" height="auto" /></a>
<a href="../country/css/images/bhutan/breadcrumbmask.png" class="retina-logo" data-sticky-logo="//www.lpu.in/images/logo/logo-media@2x.svg" data-dark-logo="//www.lpu.in/images/logo/logo-dark.svg" data-mobile-logo="//www.lpu.in/images/logo/logo-media@2x.svg"><img width="auto" height="auto" src="../../images/logo/logo-media@2x.svg" alt="LPU Logo"></a>
</div>
<nav id="primary-menu">
<ul>
<li data-gtm-title="About">
<div class="main-links">About</div>
<div class="mega-menu-content style-2 clearfix" style="padding:0 !important">
<ul>
<li class="mega-menu-title">
<div class="mhead">Get Started</div>
<div class="col-xs-12 mb0 pl0 pr0">
<ul>
<li>
<a href="../../about_lpu/infrastructure.php">
<div>Infrastructure</div>
</a>
</li>
<li>
<a href="../../about_lpu/accreditation.php">
<div>Accreditation & Approvals</div>
</a>
</li>
<li>
<a href="../../about_lpu/ranking.php">
<div>Ranking</div>
</a>
</li>
<li>
<a href="../../placements.php">
<div>Placements</div>
</a>
</li>
<li>
<a href="https://alumni.lpu.in/" target="_blank">
<div>Alumni</div>
</a>
</li>
<li>
<a href="../../about_lpu/leadership.php">
<div>Leadership</div>
</a>
</li>
<li>
<a href="../../about_lpu/vision-mission.php">
<div>Vision and Mission</div>
</a>
</li>
<li>
<a href="../../about_lpu/organization-structure.php">
<div>Organization Structure</div>
</a>
</li>
<li><a href="../../about_lpu/strategic-plan.php">
<div> Strategic Plan</div>
</a></li>
<li>
<a href="../../admission/lpu-in-your-town.php#lpu-town">
<div>Location</div>
</a>
</li>
<li>
<a href="../../about_lpu/tour_lpu.php">
<div>Tour LPU</div>
</a>
</li>
</ul>
</div>
</li>
</ul>
</div>
</li>
<li data-gtm-title="Admissions" class="mega-menu sub-menu">
<div class="main-links">
<div style="border-bottom:2px solid #F68121;">Admissions</div>
</div>
<div class="mega-menu-content style-2 clearfix col-4" style="padding:0 !important">
<ul>
<li class="mega-menu-title">
<div class="mhead">Get Started</div>
<ul>
<li><a href="../../admission/admissions.php">
<div>Overview</div>
</a></li>
<li><a href="../../why-lpu-new.php">
<div>Why LPU?</div>
</a></li>
<li><a href="../../scholarship/scholarship.php">
<div>Scholarship</div>
</a></li>
<li><a href="../../student_services/education-loan-assistance.php">
<div>Education Loan Assistance</div>
</a></li>
<li><a href="../../events/freshmeninduction/reporting.aspx">
<div class="sp-active">Reporting and Induction </div>
</a></li>
<li><a target="_blank" href="../../student_services/residence.php">
<div class="sp-active">Residential Facilities</div>
</a></li>
<li><a href="../../student_services/transport.php" target="_blank">
<div>Transportation Facilities</div>
</a></li>
<li><a href="../../international-opportunities.php" target="_blank">
<div>Study Abroad</div>
</a></li>
<li><a href="../../webinar.php" target="_blank">
<div>LPU's EDUfair (Webinars)</div>
</a></li>


<li><a href="../../disha/index.html" target="_blank">
<div>DISHA </div>
</a></li>

<li><a href="../../admission/lpu-in-your-town.php#lpu-town">
<div>LPU in Your Town</div>
</a></li>


</ul>
</li>
</ul>
<ul>
<li class="mega-menu-title">
<a href="../../programmes/all/12th">
<div>After 12th (Undergraduate) Programmes</div>
</a>
<ul>
<li>
<a href="../../programmes/regular/12th">
<div>Regular Programmes</div>
</a>
</li>
<li>
<a href="../../programmes/xhonsindustrycollaboration/12th">
<div>Hons. Programmes with Industry Collaboration </div>
</a>
</li>
<li>
<a href="../../programmes/workintegrated/12th">
<div>Work Integrated Programmes</div>
</a>
</li>
<li>
<a href="../../programmes/collaborative/12th">
<div>Industry Collaborative Programmes</div>
</a>
</li>
<li>
<a href="../../programmes/transferinternational/12th">
<div>International Credit Transfer Programmes</div>
</a>
</li>
<li><a href="../../programmes/hons/12th">
<div>Hons. Programmes</div>
</a></li>

<li>
<a href="../../programmes/Integrated/12th">
<div>Integrated Programmes</div>
</a>
</li>
</ul>
</li>
<li class="mega-menu-title">
<a href="../../programmes/all/10th">
<div>After 10th Programmes</div>
</a>
</li>
<li class="mega-menu-title">
<a href="../../programmes/all/Diploma&#32;or&#32;Certificate">
<div>After Diploma or Certificate Programmes</div>
</a>
</li>
<li class="mega-menu-title"><a href="../../admission/short-term-courses.php">
<div>Short Term Courses</div>
</a></li>
</ul>
<ul>
<li class="mega-menu-title">
<a href="../../programmes/all/Graduation">
<div class="mhead">After Graduation (Post Graduate) Programmes</div>
</a>
<ul>
<li>
<a href="../../programmes/regular/Graduation">
<div>Regular Programmes</div>
</a>
</li>
<li>
<a href="../../programmes/xhonsindustrycollaboration/Graduation">
<div>Hons. Programmes with Industry Collaboration</div>
</a>
</li>
<li>
<a href="../../programmes/collaborative/Graduation">
<div>Industry Collaborative Programmes
</div>
</a>
</li>
<li>
<a href="../../programmes/transferinternational/Graduation">
<div>International Credit Transfer Programmes
</div>
</a>
</li>
<li><a href="../../programmes/hons/Graduation">
<div>Hons. Programmes</div>
</a>
</li>
<li>
<a href="../../programmes/parttime/Graduation">
<div>Executive/ Part Time Programmes</div>
</a>
</li>
</ul>
</li>
<li class="mega-menu-title">
<a href="../../programmes/all/Post-Graduation">
<div>After Post Graduation Programmes</div>
</a>

</li>
<li class="mega-menu-title">
<a href="https://nest.lpu.in/phd/index.php">
<div>Doctoral Programmes</div>
</a>
</li>
<li class="mega-menu-title">
<a href="../admission/after-doctoral-programmes.php">
<div>After Doctoral Programmes</div>
</a>
</li>
<li class="mega-menu-title">
<a href="../../admission/executive-development-programmes.php">
<div>Executive Development Programmes</div>
</a>
</li>
</ul>
<ul>
<li class="mega-menu-title">
<a href="../index.html">
<div class="mhead">International Applicants</div>
</a>
<ul>
<li><a target="_blank" href="https://www.lpu.in/international">
<div>Overview</div>
</a></li>
<li><a target="_blank" href="../programmes/ProgramSearch.php">
<div>Programme Offered</div>
</a> </li>
<li><a target="_blank" href="../english-language-requirement.php">
<div>English Language Requirement</div>
</a> </li>
<li><a target="_blank" href="../scholarship.php">
<div>Scholarship</div>
</a> </li>
<li><a target="_blank" href="../how_to_apply.php">
<div>How to Apply</div>
</a> </li>
</ul>
</li>
</ul>
<ul class="pt0">
<li class="mega-menu-title">
<a href="https://www.lpuonline.com/">
<div>Online Education</div>
</a>
<ul>
<li><a target="_blank" href="https://www.lpuonline.com/">
<div>Programmes</div>
</a> </li>
<li><a target="_blank" href="https://admission.lpuonline.com/">
<div>Apply Now</div>
</a> </li>
</ul>
</li>
</ul>
<ul class="pt0">
<li class="mega-menu-title">
<a href="https://www.lpude.in/">
<div class="mhead">Distance Education</div>
</a>
<ul>
<li><a target="_blank" href="https://www.lpude.in/">
<div>About</div>
</a></li>
<li><a target="_blank" href="https://www.lpude.in/admissions/overview.php">
<div>Programmes on offer</div>
</a> </li>
<li><a target="_blank" href="https://www.lpude.in/contact-us/contact-us.php">
<div>Enquire Now</div>
</a> </li>
</ul>
</li>
</ul>
</div>
</li>
<li data-gtm-title="International" class="mega-menu sub-menu hide">
<div class="main-links">International</div>
<div class="mega-menu-content style-2 clearfix col-4" style="padding:0 !important">
<ul>
<li class="mega-menu-title">
<div class="mhead">Get Started</div>
<ul>
<li>
<a href="../how_to_apply.php">
<div>How to Apply</div>
</a>
</li>
<li>
<a href="https://admission.lpu.in/">
<div>Apply Online</div>
</a>
</li>
<li>
<a href="../how_to_pay.php">
<div>How to Pay</div>
</a>
</li>
<li>
<a href="../scholarship.php">
<div>Schlorship</div>
</a>
</li>
<li>
<a href="../booklet_and_forms.php">
<div>Admission Guidelines</div>
</a>
</li>
<li>
<a href="../../OnlineAdmission/LetterAuthentication.aspx">
<div>Admission Authetication</div>
</a>
</li>
<li>
<a href="../english-language-requirement.php">
<div>English Language Requirement</div>
</a>
</li>
<li>
<a href="../across_globe.php">
<div>Our Global Representatives</div>
</a>
</li>
</ul>
</li>
</ul>
<ul>
<li class="mega-menu-title">
<div class="mhead">Programme Offered</div>
<ul>
<li>
<a href="../programmes/all/Grade&#32;10th&#32;(O&#32;Level)">
<div>Diploma (after O level)</div>
</a>
</li>
<li>
<a href="../programmes/all/Grade&#32;12th&#32;(A&#32;Level)">
<div>Under Graduate (after A level)</div>
</a>
</li>
<li>
<a href="../programmes/all/Graduation">
<div>Post Graduate (after Graduation)</div>
</a>
</li>
<li>
<a href="../programmes/all/Graduation">
<div>Doctoral (after Post Graduation)</div>
</a>
</li>
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
</ul>
</li>
</ul>
<ul>
<li class="mega-menu-title">
<div class="mhead">Summer School Programme</div>
<ul>
<li>
<a href="index.php">
<div>International Summer School Programmes</div>
</a>
</li>
<li>
<a href="int_eligibility.php">
<div>Eligibility</div>
</a>
</li>
<li>
<a href="int_accommodation_and_facilities.php">
<div>Accomodation and Other Facilities</div>
</a>
</li>
<li>
<a href="int_registeration_and_fee_structure.php">
<div>Registration and Fee Structure</div>
</a>
</li>
<li>
<a href="int_proposed_schedule.php">
<div>Schedule and Details</div>
</a>
</li>
<li>
<a href="int_visa_requirement_and_guidelines.php">
<div>Visa Requirement and Guidelines</div>
</a>
</li>
<li><a href="int_gallery.php">
<div>Gallary</div>
</a></li>
<li><a href="int_faq.php">
<div>FAQ's</div>
</a></li>
<li><a href="int_contact.php">
<div>Contact Us</div>
</a></li>
</ul>
</li>
</ul>
<ul>
<li class="mega-menu-title">
<div class="mhead">Student Support and FAQs</div>
<ul>
<li><a target="_blank" href="../pre_arrival.php">
<div>Pre Arrival Information</div>
</a></li>
<li><a target="_blank" href="../post_arrival.php">
<div>Post Arrival Information</div>
</a> </li>
<li><a target="_blank" href="../after_you_graduate.php">
<div>After You Graduate</div>
</a> </li>
<li><a target="_blank" href="../returning_back.php">
<div>Returning Back Home</div>
</a> </li>
<li><a target="_blank" href="../international_student_experience.php">
<div>Students Testimonials</div>
</a> </li>
<li><a target="_blank" href="../general-faq.php">
<div>Joining Related FAQs</div>
</a> </li>
<li><a target="_blank" href="../admission_related_faqs.php">
<div>Admission Related FAQs</div>
</a> </li>
<li><a target="_blank" href="../visa-frro-faq.php">
<div>VISA/FRRO Related FAQs</div>
</a> </li>
<li><a target="_blank" href="../general_information_related_to_visa.php">
<div>Visa Requirement and Guidelines</div>
</a> </li>
<li><a target="_blank" href="../visa_extensions.php">
<div>Visa Extensions</div>
</a> </li>
</ul>
</li>
</ul>
</div>
</li>

<li data-gtm-title="Academics" class="mega-menu sub-menu">
<div class="main-links">Academics</div>
<div class="mega-menu-content col-3 style-2 clearfix academics-border-right">
<ul>
<li class="mega-menu-title sub-menu">
<div class="mhead">Highlights</div>
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
<ul class="noleftborder">
<li class="mega-menu-title">
<div class="mhead">Disciplines</div>
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
<ul>
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
<li data-gtm-title="Campus Life" class="mega-menu">
<div class="main-links">Campus Life</div>
<div class="mega-menu-content col-2 style-2 clearfix">
<ul>
<li class="mega-menu-title">
<div class="mhead">Campus Life</div>
<div class="col-md-12 mb0 pl0 pr0">
<div class="col-md-6 ma0 pa0">
<ul>
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
</div>
<div class="col-md-6 ma0 pa0">
<ul>
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
<li>
<a href="../../lpusummerschool/index.html">
<div>LPU Summer School</div>
</a>
</li>
</ul>
</div>
</div>
</li>
</ul>
<ul>
<li class="mega-menu-title">
<div class="mhead">Student Services</div>
<div class="col-md-12 mb0 pl0 pr0">
<div class="col-md-6 ma0 pa0">
<ul>
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
</div>
<div class="col-md-6 ma0 pa0">
<ul>
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
</div>
</li>
</ul>
</div>
</li>
<li data-gtm-title="Placements">
<a href="../../placements.php">
<div>Placements</div>
</a>
</li>
<li data-gtm-title="Research">
<a href="../../academics/research.php">
<div>Research</div>
</a>
</li>

<li data-gtm-title="Apply" class="scroll-menu"><a href="https://admission.lpu.in/" target="_blank" data-gtm-ps-applynow="LPU Homepage Menu">
<div>Apply Now</div>
</a></li>

</ul>
<div id="top-search">
<a href="SummerSchoolApplicationForm.aspx#" id="top-search-trigger"><i class="icon-search3"></i><i class="icon-line-cross"></i></a>
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
    $(document).ready(function() {
        var sWidth = $(window).width();
        if (sWidth < 580) {

            $('#header .container').addClass('container-fluid');
            $('#header .container').removeClass('container');
        } else {

            $('#header .container-fluid').addClass('container');
            $('#header .container-fluid').removeClass('container-fluid');
        }
    });
</script>
<section id="slider">
<div class="section swiper_wrapper nopadding nomargin noborder ohidden" style="background-image: url('../imgs/slider-bg.jpg');" data-stellar-background-ratio="0.3">
</div>
</section>
<form name="aspnetForm" method="post" action="SummerSchoolApplicationForm.aspx" id="aspnetForm">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="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" />
<script src="../../ScriptResource.axd?d=NJmAwtEo3Ipnlaxl6CMhvmqST00-MWhoYm9s2ss3yCVjPKLzsbTGaAMbOWQrdbT68k0oz1YGlwGo_MUvg3G5Gjn8EAF3e0aCn4WvDr5WhZCIj5_KppYa3f7UqVyedbW01jd0wVSXI6G25PvTuTlALYyddx9Uw_GYFwcSvWKcDyg1&amp;t=ffffffffe6d5a9ac" type="text/javascript"></script>
<script src="../../ScriptResource.axd?d=eE6V8nDbUVn0gtG6hKNX_IjiwRe0d2Q31WQ5-JSKLilpolStaD_NqkejE6fvftwBytiE0CzJ_fMCnwBwVatov2t5O06HVJsdXEX9Hm4D1UweA1-Lth50xHnKmMfuCbnK0&amp;t=76554e0d" type="text/javascript"></script>
<script src="../../ScriptResource.axd?d=jwf4VSQi7LeShc44FJ-gAaVb-_pvJPyas-rUewWbVUGSz6kJvW32jC5k22g8aFrFKtI62E_2SCDrNOshJlfnZCoEY7mPgVCXQIwdN6JmxJHTc-HMzuwtL6Ea778F02LX0&amp;t=76554e0d" type="text/javascript"></script>
<script src="../../ScriptResource.axd?d=mcAASOSteirJeuV-3by3UeI5Kjj-lqYskPKqZcmi9e3BUIZaNlFuz7kDJmBP0-kGSqEgUGPcm3Hgo4h9vXM2cul019JMVEk_zInvHS4KAn41&amp;t=76554e0d" type="text/javascript"></script>
<script src="../../ScriptResource.axd?d=HEFpVKbnoeQjkjHkFKu3MGgXwArevRyi-H4MRWoe_liWSuwE4ZwjGvIvHWbh4IvIWpTLugK_Qh4mdaMhJFP_h8TFQp4uFQBhafbS6TuheE1p8wA_hI3kmnAzMLToeMP80&amp;t=76554e0d" type="text/javascript"></script>
<script src="../../ScriptResource.axd?d=V9BZfzKzDCsxAStwHbjCaB22jLTMreaWeHp312mIaKAnu3bxmAQmwWygOLyCjnz2HDC_lkBKlRTmxtImBBJ0XKiqdyJWD__1HJP0ucq9HTnvzgemWsUacYi7mp83R3Pp0&amp;t=76554e0d" type="text/javascript"></script>
<script src="../../ScriptResource.axd?d=uiErWUqGhD5_ddnGX4Xq_pvfBSl_uztDJE4zsQ8XAFxzxm-vt6I8IhWvirKit_rE-LWM4nSdBMOytGFBV44i8nlOjNRrHx6yBK856DsDoIuAEmINFaCEFS3tVTvDnh9y0&amp;t=76554e0d" type="text/javascript"></script>
<script src="../../ScriptResource.axd?d=nai7mGcYyE2dix_TwveLDfnJisRZxqo_gE-nWOZ7aa7MwHx_wf2lRVfxSh55LcjAgeAcMsaefwEgYCzOslE8z45FZ01ufp1eEvv_-D8zShAyeiWxp-ibuoWcs-AJCIGF0&amp;t=76554e0d" type="text/javascript"></script>
<script src="../../ScriptResource.axd?d=LQ1q2RBSthBAZhliMjtG_6eUuVAmogsjD1EIiT8ZfFUz4fwW2YzELfuDeL6A7OLRJ7UDRmXz0joYvl2JHxevKDm5TUb2D5dC7lz-a1RIFMA8PiseMXu8u8wDdjof7z4a0&amp;t=76554e0d" type="text/javascript"></script>
<script src="../../ScriptResource.axd?d=VOYD8Xe7kQA0lniBYXVpApyAoA9QeA-gBbuQfkODPJ8NfS5EhqUa_lJKhsyX3SCip7J2or9Ju5sXK4fJ2pz_YkdcWfVAXfCH4at5_rGNDRMnCFePbfau_qEPK034OsFQ0&amp;t=76554e0d" type="text/javascript"></script>
<script src="../../ScriptResource.axd?d=24039AtbfhsNBYQDFUMYHA8eAh-J1k15bNHYxYKwM5Fi960vTbDyfsS4geHHdn5os-KYIoB0vMK8haXn302e-gPYigS_1mGYa6V7o7M6Ndo1&amp;t=76554e0d" type="text/javascript"></script>
<script src="../../ScriptResource.axd?d=myBlz7mQmGQE80F8-WeLsULkLE7-POyyB8DFI7yzxvnaAX6WX9j6fCXqW5FwYhgD2eR_RBlw3-5CpeMEs4bNTPXwVKoTiWqNzI4pfr90A3DUEwDpSK5YpsK3rgeXCWwK0&amp;t=76554e0d" type="text/javascript"></script>
<script src="../../ScriptResource.axd?d=NISXSzp87hD3qcCkP6NEPlaHTy_pSygPaiRi88t32URA7xFyDu8zlEIck2iyCWN9Lyyj2Cmc6CIbU6tqgOXfKyPhHdZZQ-2q48jJR76mD_3Is7xFJhnFgO4g7GHHH5zc0&amp;t=76554e0d" type="text/javascript"></script>
<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="BCE6506F" />
<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="FTEKFJ080I6UGbir1BpJkAS6ORr5zZjGDXsp6Jv77kiCfC8DhLLr6Mh6MFT5GxPzgz3Lt10ne7PEu3yVOSdu+b5VObokq2oeXrOx5CF4VLLIPkKFJc81KOveeTTvDK0QZ6oZAxD51wGjLj13/HsMEdkI9lJsoSU80p3cuQ8GEWqSl3C6zZzDmbaiwEHG29V9QWa1iZDdYll35CQ6L5TWXJHEM1hEN5NOn1AxSbyEX7GXBb4XIBsua0HhNGLPXDWCn6+8ZWhJfcgz69huCzTCNNQV5d3BK8rzYGQyVsHwSysXPFrpjV8RvjXoyEkG3aYT97ryF+YgzcYmaq/zPVZmZRHxKjI3dGIegEINQAJDc9zria+NIFfIeFOXlzEmgiLq5N5AQKQDvNaxDnMuVW5eOcUZd78NFTlcJ4G38vh6fnO48Y9cza+kFIkJ0n5K6ke9k9DR4qlQY/fhQcqBuGTX7vA2TtwsAyDqhvcm8yv7PvFVoF7+nYAlr0MeZ+Ks2d952LSvDsst9qfFkB4GrDPNnB/XvJTZu6Rz8bvE7PZ5ran1jaRaYSOXnVWnh1ZGRXnAkDsOCYuGfuCbRQFfyqmXSAg6R5lK1FA05F8k+0jBUEzrQu2oCBoirfleq5NS1oZ6o6MZ0Pd1wSg8JuWk7L8hEht2N4uby5pDIAxFgFbTTmCQZ/O0mzV+LLqgem317tiJtckC13F9+dya1kEL19xU4Y8xpHKZUJu0rNmIK/c1JaZEM8X5FMp3UJXCW2DQqaWgaZ2aXpNea58f/WIZC9oyNIPr36IXFz1y4Q0uoLeaRTU4FPYGuiSoalYHnEQU8WqA1rJwW39wQ3ShDbiBIb/x3Ef+AlUnlhiKwwkXvbXtignLCLeGCerp60AmlCkhpJloX5CnwSFpglUPIEb1Yw7SyqjML2KyKy2gD5K0xa23YgBPLGd8Ibv5cI0u884RTknSAWdtq82ejkqebQTEF2cbPt3Ln9IkyY5XXCVaJHRtk0O+ZcMOo3Xo7jdN3gv0rGYIvJDm2Q7ZZSL4bEZAeV0HM+Z+vZ/fcNaVHyM5C+9Ex7P8AKDy28KgAhHHxZOgMAgvgE4vYVRq7JUTKX2ny25V2LpSbSEde+YjrzyvOA5uvHKWUZzajy4ag6MiQgqDREFABEhB4/B7k91WKgwK3iPXXkYlP61knA4WX6enbkgT4Ss/KYmUoeTbTFwWK/9e1vvLZ/16FTNel4+eAadpYC7OxibPuyYXGHzkFfThAJnrIB7AtgjV1b8gGCq7PivlpoXbGo8KYxDjKBezf3aY9BHsIqDj73V04j8aD22lyMbtCdaW8nU2Jg52dnFyrXUkAltrokKE1DWHXcfYpCakreGxfQy4+FeIs6b0e2u8PxrHrqc2aoQ4dSMs5yO24BCaisq6/Y/l9xCVQLm3yizFfBxUt0aCyAVsB9S/wrQc+2QfgzU8M5SD9hPUuJqZ7GwIi4rD7lUPl035prx3XqYOAVF8udz1Kq5CT2mE4gDaPIL6/nWHEyCzapqJZ91uQ8DR5e6jPFZu98CRXhx16xgiSjc28SQsmuvehoYb5NPQzTXEKKp1/Lj75pkmf1Dzn62WM2oX6Xx6K1HrFzDwz6u32Qj7eHzeeUQ6DECFQBcIWl54X+9LL8ycYwd0Pa6n0f7BwSzs3PQm6+57AVwXNfzUSCEQ4ayCIHPKfUl1GjcX4KV+vURAcEjgsG+aSkgwWaEzaG8h5KLIdlhhSTmfkd2BWOVm1gGwpKu6X0WHi3tzrI63Tk21MhT+pPwy3OhD7h3+lzbWZ+NZQ6oiSAeLkm6u84yGuMqrGImEtNRr8dAtas6WvrlnACSm2zoBIYv3eDaRjVhxqFtbMBTcCuakCWMkGPQju5AMC5GQj6tMk5nBdygx0kdzg7a92rVKAvOzEVCRautam4LdHx1rp0f0uWPEpqi4Ua4rltPjv9CDGzerJv7rzPQjPAaSDLj+zuuTOhi/dbV887M55E8+hAHM0BilBHshXXVNOf5aiepPEFH2voEjApUNB6GmobcHSIJyxJw02eTNmixCyY0Q+m/s7+R9Ixd05FeKMXCrNTTLDUFVWKTwEN8U7ChybfeOZW4Mvq3RG+UpQWTfsNPanAlU9uMT4z4u1Bloq2ulaSmuTh3PvAsGHd9qygPnBqQOsGojc3SV0OfZxe0ZKk7qjnCqtyjQlADEOSazkvUqdtQpFIhwUkEHrBCe5w9x+11scsW6jtJa+tvvVjUrsUuv5/5gC3Xu1v3eA5qgykiLExbQbSsKxUf6a9FsjrSdifYDmxKG8/mUYZQFzmbB04/7rNXis99+6YMnBOUnRZP8KF8iou96VdiM927EahLTsYU6D+L0BhlCVj1DvI2N1eahmRJBMrMPaFSWuq4cRkEKF8i7GaR6lsh1FWzG4mCY3BKbNgxyXg35zwK9QlkiNHqdmDldwpIgkElEqVmYI+QoM/nOHbbBkbFC0KEs1eCPusw93HvmuIaNE8rvCME+CeGeyR6IZXtcspxx7rcXt2Nd60GOza0phVdKGhEnnjvuygX4oMK7MRfnCdcf1GFC/MXC0IwNGV5sKuk3+MATXVrYFvu+fWXTSbwHAdZC0+O3PvJqXgKPH/GQiWvLW+xO6rCcFtJBr/I6LqwQhYY5NdxhJ1psEUv+UVIvfMkMTgtZUYBqTpmXWVvk+1z0cNcyrPY9ONr8hJUSle0/nxs3AyvP2EjBLzRXknH1RXfLv0h7d3K+4kKD+IkTeenj6COeqXO8iEaFKwHFo6j6/Ys4nuL/RhybrGZDTHnk10Wbxq3A67Fvi/Fl4/D73ew40MTHC6uzrBQwpL8Zt6tAjJOomMJjAWGhOd1pdD1yhSCw5gR7+NLCwq7QkqIKbjkQWorMyGwAqJxpqDb+BWZz9/QGG+drmbsf0JNJilZKSgcy1JLeFRWdRpjF5RQApiMU1kdOi2bc5j5+ar2MMaVS765WCwp9HSfQaTGzNb6dak6wN492jjqIVWwxyo62OAbPpU7UYn7tLP55IDgFNOe7FTJRW9DECMYXQzm4K5X7vgHsSZDdNlN7yGYpNageaeXR0jnD9m6FjKmBAlXTb5R6WvCR06oTHOvDwIauAnpavuZ62/Qw416+yfrTwmKrbXFJ10PyObQaiTO59MdJ4fYNRw4X0Cub2M43pAqEzgWj6cCzjkbqIYSY/H37Bab90DS/OXky0ggPkFlqc01v31xYmTP7/UqZS+rU1In1QzfiOX3co2bN6YqlrzD2FnRymVxDSEkwrtYvHCmvMPIgdhO9S7Fpbor81wI6cdOpEKnBiKIM6fmGcUI5KU1a0QLUBQwjc/mhaUswvdR6XwGwtuwfrflRO2q7nTaW1MBf8ViueEpM1WGL+5epVUpH2PECuEPwThmJyNy5rEYV70+3zf8GWismpui073Qn2InSHMsb0WpmHTI2od5DiagvW7NjXhAypUdcQ+a8umNsQ+FFdeqMniKMCpy+A9U/3lCPTSH0RkNOD9kfl6W2STa4L2hvLvOHluyCDAl8BoRsCfMeiuhU0y4kPQUm9MKJkhLUvpt985lDVN2rETYTSXg0Z4VTcWko8OqKVWGNMDA3g4VpeEfbVMixHXXxu83oZT7wNYgqwRGsx/wB0r1Iq7mvxy7NBRgu4X7RDoD8yOI7yzGOH/bA4W0pWD4+eutnq3HyoIUKefop4oumUfzA3WerdGH0Sb9jWjDFlkS1DMbmf9CCtwTP3vdYugRjKfz3zgm7onRaWb510lBt3UxmRKU6E73jxEzB+sx+SK8cXDoWq3Topr3MYKMK2j9GdWY5Y1xqfTeBkpIIG5F/bJOjmqIWKmw5LRThitYv4h2T4eCf2OMPvEe4soC5KT3WpfVqUTDFvTM6XgcdeUpIAcKfciPPUyEn0DzBFqTxxUDAAw+iepMVjwYOJ/bAVdGbOXebugBitXOI5UW4f7UQwrIqoYMFpCTFN7h9BaodLmo4ADZqcbW6/UBuBfL00AanN1i6IbvymItaqEsDKKY5a5FGf/vaP5JFFOxIn9GZw3rj59Os6x+0s209p1UV+jj6MNS5uIKPPZaqqegJfXewXt38aZdDrUW4svo2QmK5D6jhgB0uNmKKVwmOqFlm3wzfXOMz8jGXevi608nJF4kBAcVX62z1ZfUmiASkfmigct6DvK3jLOQ0Sd3ITjyuqDkMMCkHoi6D2Bh5+iwol7XdY0ZIdspecE7yuzkq/PKPdbtr2Nhv194HAGQGCtXOKVpvyPEHqV9aHTF3QEQhkP9hh0OTOvXJCbVai0VnGvRhMdsOgKRMasGteGSCyp4Z+I+o47vIHhrxbjySuU4YYwgrOXE9GUhI+CgReuubP5psOJZmvByEF2LG+iZV5KyOPwI1rKb7Tv2x4Wl1Ld4eimV9mal8yu6yUU9bzKFJTB2EXX885w+yEeKLOn86y667d28JD/G2g4KszPPmstQTO6ZWh+mnbGDI5lLjBSYCUMdtuL812a96HyvVFuSCXz6ftY6AdsfQeAseVFYCNaSCl8UMeN9zAI/vkbGZS6FFc8mtBajwRXdK7YY8cjAeaIKrvWsKcw+ySlQb0WPHhGfiCOo9XzTMtAWUYRWZuQsofe4U8FU5gFwyH0e/uqK5L+N2II5hhftIUtCEH19FYyX9UBCYuapf+5/C69r+Kq1NOtYquVOPJBL+hpqUCKT3iL1BhH7wBPy1gDesc9d8Mk6bReCZMBgfZUR7zaXRaK+D1tnCkItElNIgz0qttJdFbfd42iM879ANb535LCEDDtbc5kNoUH6G8rsR15tnB1OF4TvzuzjShjz5f046S622zqmRrV30FpE3vMIl5RUBpEk/uSa0HPHerGCnLHYIf/EImHVFPPxTZzVvwF+9umXYyZ4nVhdYS2zAzw2IM7FLh6HN1h2qE7tsD9dKW56zbQNV87OhdM5vkpRmUCHLk587lBCBgHqbwATozqRcaP/3pHD9oK7mvAHIv2OtZh9mCngHYtAzT4KpA6qo6dsfcHuU2YM5KYr0LGQCHPYMEkX99yrsk3pL0wGaQFMgQPDGr4RKn09viDcxvS1tlxfjSjJ8hMj9bSWC8BGv0tL6q/BtkU8GbQ6THXClguD1KScPBRuscuTesZjUuCVDnzkcxDZjjSnu44ZdmimHTvOIM00iUeBLNR6yBboNwycquFyv/MB+xAknqI3Z0zgeA5oQXl6l71sN9YAI9kxpyly26uboBoImwqWioJ8sDAyrfJ2V6OoZYA45nZoJnV8hwxXzfIq2YOHAOLuOX2aSXegx8oeP9MVF4IlQCFyH/Mj1PR0ku4rR9BK7b2oSYO0TYd6y+BBsaRfgyV2LLa2lqVa3859lrhLDKIqq4k4efxoPbCCrxnFc5UbYLzDBpOMN/QAVGOJfnMy/tf3/kMpfGnOEOswFz2M/e9IYbx13xiZWJChZ5C/hFYzvp1A3Ii1sqiLc2zd/Yw==" />
<script>
        $(document).ready(function () {

            if ($(window).width() < 900) {
                $("#add1,#add2").addClass("pb50");
            }
        });
    </script>
<section class="mt50 mb50 pb0">
<div class="heading-block center mb0">
<h2>Incredible India Application Form</h2>
</div>
<div id="section-services" class="page-section notoppadding">
<div class="container clearfix">
<div class="ss-from form-group grid-innr grid-pad pa20 mt30">
<h3>Personal Details</h3>
<div class="col-md-12 pb10">
<div class="col-md-6 col-sm-12 pa5">
<strong>First Name*</strong>
<input name="ctl00$ContentPlaceHolder1$txtFirstName" type="text" maxlength="100" id="ctl00_ContentPlaceHolder1_txtFirstName" class="form-control" />
</div>
<div class="col-md-6 col-sm-12 pa5">
<strong>Last Name*</strong>
<input name="ctl00$ContentPlaceHolder1$txtLastName" type="text" maxlength="100" id="ctl00_ContentPlaceHolder1_txtLastName" class="form-control" />
</div>
</div>
<div class="col-md-12 pb10">
<div class="col-md-12 col-sm-12 pa5">
<strong>Study India Program*</strong>
<select name="ctl00$ContentPlaceHolder1$txtProgrammeName" id="ctl00_ContentPlaceHolder1_txtProgrammeName" class="form-control">
<option value="Select programme">Select programme</option>
<option value="Summer Incredible India Program">Summer Incredible India Program</option>
<option value="Winter Incredible India Program">Winter Incredible India Program</option>
<option value="Semester Exchange Program">Semester Exchange Program</option>
<option value="Full Academic Year Exchange Program">Full Academic Year Exchange Program</option>
</select>
</div>
</div>
<div class="col-md-12 pb10">
<div class="col-md-6 col-sm-12 pa5">
<strong>Father's First Name*</strong>
<input name="ctl00$ContentPlaceHolder1$txtFathersFirstName" type="text" maxlength="100" id="ctl00_ContentPlaceHolder1_txtFathersFirstName" class="form-control" />
</div>
<div class="col-md-6 col-sm-12 pa5">
<strong>Father's Last Name*</strong>
<input name="ctl00$ContentPlaceHolder1$txtFathersLastName" type="text" maxlength="100" id="ctl00_ContentPlaceHolder1_txtFathersLastName" class="form-control" />
</div>
</div>
<div class="col-md-12 pb10 ">
<div class="col-md-4 col-sm-12 pa5">
<strong>Date of Birth*</strong>
<div class="input-group">
<input name="ctl00$ContentPlaceHolder1$txtDOB" type="text" readonly="readonly" id="ctl00_ContentPlaceHolder1_txtDOB" class="form-control" />
<span class="input-group-addon"><i class="icon-calendar2"></i></span>
</div>
</div>
<div class="col-md-4 col-sm-12 pa5 radio3">
<strong>Gender</strong>
<span id="ctl00_ContentPlaceHolder1_rblGender"><input id="ctl00_ContentPlaceHolder1_rblGender_0" type="radio" name="ctl00$ContentPlaceHolder1$rblGender" value="Male" /><label for="ctl00_ContentPlaceHolder1_rblGender_0">Male</label><input id="ctl00_ContentPlaceHolder1_rblGender_1" type="radio" name="ctl00$ContentPlaceHolder1$rblGender" value="Female" /><label for="ctl00_ContentPlaceHolder1_rblGender_1">Female</label></span>
</div>
<div class="col-md-4 col-sm-12 pa5">
<div class="col-lg-12 col-md-12 col-sm-12 pa5">
<strong class="clearfix">Nationality*</strong>
<select name="ctl00$ContentPlaceHolder1$ddlNationality" id="ctl00_ContentPlaceHolder1_ddlNationality" class="form-control">
<option value="Select Nationality">Select Nationality</option>
<option value="Afghanistan">Afghanistan</option>
<option value="Albania">Albania</option>
<option value="Algeria">Algeria</option>
<option value="Andorra">Andorra</option>
<option value="Angola">Angola</option>
<option value="Antigua and Barbuda">Antigua and Barbuda</option>
<option value="Argentina">Argentina</option>
<option value="Armenia">Armenia</option>
<option value="Australia">Australia</option>
<option value="Austria">Austria</option>
<option value="Azerbaijan">Azerbaijan</option>
<option value="Bahamas">Bahamas</option>
<option value="Bahrain">Bahrain</option>
<option value="Bangladesh">Bangladesh</option>
<option value="Barbados">Barbados</option>
<option value="Belarus">Belarus</option>
<option value="Belgium">Belgium</option>
<option value="Belize">Belize</option>
<option value="Benin">Benin</option>
<option value="Bhutan">Bhutan</option>
<option value="Bolivia">Bolivia</option>
<option value="Botswana">Botswana</option>
<option value="Brazil">Brazil</option>
<option value="Brunei">Brunei</option>
<option value="Bulgaria">Bulgaria</option>
<option value="Burkina Faso">Burkina Faso</option>
<option value="Burundi">Burundi</option>
<option value="Cambodia">Cambodia</option>
<option value="Cameroon">Cameroon</option>
<option value="Canada">Canada</option>
<option value="Cape Verde">Cape Verde</option>
<option value="Chad">Chad</option>
<option value="Chile">Chile</option>
<option value="China">China</option>
<option value="Colombia">Colombia</option>
<option value="Comoros">Comoros</option>
<option value="Congo Brazzaville">Congo Brazzaville</option>
<option value="Costa Rica">Costa Rica</option>
<option value="Cote d’Ivoire">Cote d’Ivoire</option>
<option value="Croatia">Croatia</option>
<option value="Cuba">Cuba</option>
<option value="Cyprus">Cyprus</option>
<option value="Czech Republic">Czech Republic</option>
<option value="D.R.Congo">D.R.Congo</option>
<option value="Denmark">Denmark</option>
<option value="Djibouti">Djibouti</option>
<option value="Dominica">Dominica</option>
<option value="Dominican Republic">Dominican Republic</option>
<option value="Ecuador">Ecuador</option>
<option value="Egypt">Egypt</option>
<option value="El Salvador">El Salvador</option>
<option value="Equatorial Guinea">Equatorial Guinea</option>
<option value="Eritrea">Eritrea</option>
<option value="Estonia">Estonia</option>
<option value="Ethiopia">Ethiopia</option>
<option value="Fiji">Fiji</option>
<option value="Finland">Finland</option>
<option value="France">France</option>
<option value="Gabon">Gabon</option>
<option value="Gambia, The">Gambia, The</option>
<option value="Georgia">Georgia</option>
<option value="Germany">Germany</option>
<option value="Ghana">Ghana</option>
<option value="Greece">Greece</option>
<option value="Grenada">Grenada</option>
<option value="Guatemala">Guatemala</option>
<option value="Guinea">Guinea</option>
<option value="Guinea-Bissau">Guinea-Bissau</option>
<option value="Guyana">Guyana</option>
<option value="Haiti">Haiti</option>
<option value="Honduras">Honduras</option>
<option value="Hungary">Hungary</option>
<option value="Iceland">Iceland</option>
<option value="India">India</option>
<option value="India (NRI)">India (NRI)</option>
<option value="Indonesia">Indonesia</option>
<option value="Iran">Iran</option>
<option value="Iraq">Iraq</option>
<option value="Ireland">Ireland</option>
<option value="Israel">Israel</option>
<option value="Italy">Italy</option>
<option value="Ivory Coast">Ivory Coast</option>
<option value="Jamaica">Jamaica</option>
<option value="Japan">Japan</option>
<option value="Jordan">Jordan</option>
<option value="Kazakhstan">Kazakhstan</option>
<option value="Kenya">Kenya</option>
<option value="Kiribati">Kiribati</option>
<option value="Korea, North">Korea, North</option>
<option value="Korea, South">Korea, South</option>
<option value="Kosovo">Kosovo</option>
<option value="Kuwait">Kuwait</option>
<option value="Kyrgyzstan">Kyrgyzstan</option>
<option value="Laos">Laos</option>
<option value="Latvia">Latvia</option>
<option value="Lebanon">Lebanon</option>
<option value="Lesotho">Lesotho</option>
<option value="Liberia">Liberia</option>
<option value="Libya">Libya</option>
<option value="Liechtenstein">Liechtenstein</option>
<option value="Lithnania">Lithnania</option>
<option value="Lithuania">Lithuania</option>
<option value="Luxembourg">Luxembourg</option>
<option value="Macedonia">Macedonia</option>
<option value="Madagascar">Madagascar</option>
<option value="Malawi">Malawi</option>
<option value="Malaysia">Malaysia</option>
<option value="Maldives">Maldives</option>
<option value="Mali">Mali</option>
<option value="Malta">Malta</option>
<option value="Marshall Islands">Marshall Islands</option>
<option value="Mauritania">Mauritania</option>
<option value="Mauritius">Mauritius</option>
<option value="Mexico">Mexico</option>
<option value="Micronesia">Micronesia</option>
<option value="Moldova">Moldova</option>
<option value="Monaco">Monaco</option>
<option value="Mongolia">Mongolia</option>
<option value="Montenegro">Montenegro</option>
<option value="Morocco">Morocco</option>
<option value="Mozambique">Mozambique</option>
<option value="Myanmar (Burma)">Myanmar (Burma)</option>
<option value="Namibia">Namibia</option>
<option value="Nauru">Nauru</option>
<option value="Nepal">Nepal</option>
<option value="Netherlands">Netherlands</option>
<option value="New Zealand">New Zealand</option>
<option value="Nicaragua">Nicaragua</option>
<option value="Niger">Niger</option>
<option value="Nigeria">Nigeria</option>
<option value="Norway">Norway</option>
<option value="Oman">Oman</option>
<option value="Palau">Palau</option>
<option value="Palestine">Palestine</option>
<option value="Panama">Panama</option>
<option value="Papua New Guinea">Papua New Guinea</option>
<option value="Paraguay">Paraguay</option>
<option value="Peru">Peru</option>
<option value="Philippines">Philippines</option>
<option value="Poland">Poland</option>
<option value="Portugal">Portugal</option>
<option value="Qatar">Qatar</option>
<option value="Republic of the Congo">Republic of the Congo</option>
<option value="Reunion (France)">Reunion (France)</option>
<option value="Romania">Romania</option>
<option value="Russia">Russia</option>
<option value="Rwanda">Rwanda</option>
<option value="Saint Helena (UK)">Saint Helena (UK)</option>
<option value="Saint Kitts ">Saint Kitts </option>
<option value="Saint Lucia">Saint Lucia</option>
<option value="Saint Vincent ">Saint Vincent </option>
<option value="Samoa">Samoa</option>
<option value="San Marino">San Marino</option>
<option value="Saudi Arabia">Saudi Arabia</option>
<option value="Senegal">Senegal</option>
<option value="Serbia">Serbia</option>
<option value="Seychelles">Seychelles</option>
<option value="Sierra Leone">Sierra Leone</option>
<option value="Singapore">Singapore</option>
<option value="Slovakia">Slovakia</option>
<option value="Slovenia">Slovenia</option>
<option value="Solomon Islands">Solomon Islands</option>
<option value="Somalia">Somalia</option>
<option value="South Africa">South Africa</option>
<option value="South Sudan">South Sudan</option>
<option value="Spain">Spain</option>
<option value="Sri Lanka">Sri Lanka</option>
<option value="Sudan">Sudan</option>
<option value="Suriname">Suriname</option>
<option value="Swaziland">Swaziland</option>
<option value="Sweden">Sweden</option>
<option value="Switzerland">Switzerland</option>
<option value="Syria">Syria</option>
<option value="Taiwan">Taiwan</option>
<option value="Tajikistan">Tajikistan</option>
<option value="Tanzania">Tanzania</option>
<option value="Thailand">Thailand</option>
<option value="The Gambia">The Gambia</option>
<option value="Togo">Togo</option>
<option value="Tonga">Tonga</option>
<option value="Trinidad and Tobago">Trinidad and Tobago</option>
<option value="Tunisia">Tunisia</option>
<option value="Turkey">Turkey</option>
<option value="Turkmenistan">Turkmenistan</option>
<option value="Tuvalu">Tuvalu</option>
<option value="Uganda">Uganda</option>
<option value="Ukraine">Ukraine</option>
<option value="United Arab Emirates">United Arab Emirates</option>
<option value="United Kingdom">United Kingdom</option>
<option value="Uruguay">Uruguay</option>
<option value="USA">USA</option>
<option value="Uzbekistan">Uzbekistan</option>
<option value="Vanuatu">Vanuatu</option>
<option value="Venezuela">Venezuela</option>
<option value="Vietnam">Vietnam</option>
<option value="Yemen">Yemen</option>
<option value="Zambia">Zambia</option>
<option value="Zimbabwe">Zimbabwe</option>
</select>
</div>
<div class="col-lg-12 col-md-12 col-sm-12 clearfix pa0" id="other" style="display: none">
<strong>Specify</strong>
<input name="ctl00$ContentPlaceHolder1$txtOtherNationality" type="text" maxlength="100" id="ctl00_ContentPlaceHolder1_txtOtherNationality" class="form-control" />
&nbsp;
</div>
</div>
</div>
<h3>Contact Details</h3>
<div class="col-md-12 pb10">
<div class="col-md-6 col-sm-12 pa5">
<div id="add1" class="well well-sm col-lg-12 col-md-12 col-sm-12">
<strong style="padding-left: 5px;">Correspondence Address*</strong>
<div class="col-lg-12 col-md-12 col-sm-12 pa5">
<textarea name="ctl00$ContentPlaceHolder1$txtLine1" rows="2" cols="20" id="ctl00_ContentPlaceHolder1_txtLine1" class="form-control">
</textarea>
</div>
<div class="col-lg-12 col-md-12 col-sm-12 pa5">
City/Town*
<input name="ctl00$ContentPlaceHolder1$txtCity1" type="text" maxlength="100" id="ctl00_ContentPlaceHolder1_txtCity1" class="form-control" />
</div>
<div class="col-lg-12 col-md-12 col-sm-12 ma0 pa0">
<div class="col-md-6 col-sm-12 pa5">
Country Code*
<input name="ctl00$ContentPlaceHolder1$txtCoutryCode" type="text" maxlength="100" id="ctl00_ContentPlaceHolder1_txtCoutryCode" class="form-control" />
</div>
<div class="col-md-6 col-sm-12 pa5">
State/Province*
<input name="ctl00$ContentPlaceHolder1$txtState1" type="text" maxlength="100" id="ctl00_ContentPlaceHolder1_txtState1" class="form-control" />
</div>
</div>
<div class="col-lg-12 col-md-12 col-sm-12 ma0 pa0">
<div class="col-md-6 col-sm-12 pa5">
Country*
<input name="ctl00$ContentPlaceHolder1$txtCountry1" type="text" maxlength="100" id="ctl00_ContentPlaceHolder1_txtCountry1" class="form-control" />
</div>
<div class="col-md-6 col-sm-12 pa5">
Zip/Postal Code*
<input name="ctl00$ContentPlaceHolder1$txtZippCode1" type="text" maxlength="50" id="ctl00_ContentPlaceHolder1_txtZippCode1" class="form-control" />
</div>
</div>
</div>
</div>
<div class="col-md-6 col-sm-12 pa5">
<div id="add2" class="well well-sm col-lg-12 col-md-12 col-sm-12">
<strong style="float: left; padding-left: 5px;">Permanent Address*</strong> <span style="display: inline-block; font-weight: normal; font-size: 12px; float: right; padding: 0!important;">
<span style="width: auto !important; padding: 0px!important;"><input id="ctl00_ContentPlaceHolder1_cbSame" type="checkbox" name="ctl00$ContentPlaceHolder1$cbSame" /></span>(Same
as Corrspondence Address)</span>
<div class="col-lg-12 col-md-12 col-sm-12 pa5 clearfix">
<textarea name="ctl00$ContentPlaceHolder1$txtLine2" rows="2" cols="20" id="ctl00_ContentPlaceHolder1_txtLine2" class="form-control">
</textarea>
</div>
<div class="col-lg-12 col-md-12 col-sm-12 pa5">
City/Town*
<input name="ctl00$ContentPlaceHolder1$txtCity2" type="text" maxlength="100" id="ctl00_ContentPlaceHolder1_txtCity2" class="form-control" />
</div>
<div class="col-lg-12 col-md-12 col-sm-12 ma0 pa0">
<div class="col-lg-6 col-md-6 col-sm-12 pa5">
Country Code*
<input name="ctl00$ContentPlaceHolder1$txtCoutryCode2" type="text" maxlength="100" id="ctl00_ContentPlaceHolder1_txtCoutryCode2" class="form-control" />
</div>
<div class="col-lg-6 col-md-6 col-sm-12 pa5">
State/Province*
<input name="ctl00$ContentPlaceHolder1$txtState2" type="text" maxlength="100" id="ctl00_ContentPlaceHolder1_txtState2" class="form-control" />
</div>
</div>
<div class="col-lg-12 col-md-12 col-sm-12 ma0 pa0">
<div class="col-lg-6 col-md-6 col-sm-12 pa5">
Country*
<input name="ctl00$ContentPlaceHolder1$txtCountry2" type="text" maxlength="100" id="ctl00_ContentPlaceHolder1_txtCountry2" class="form-control" />
</div>
<div class="col-lg-6 col-md-6 col-sm-12 pa5">
Zip/Postal Code*
<input name="ctl00$ContentPlaceHolder1$txtZippCode2" type="text" maxlength="50" id="ctl00_ContentPlaceHolder1_txtZippCode2" class="form-control" />
</div>
</div>
</div>
</div>
</div>
<div class="col-md-12 pb10">
<div class="col-md-6 col-sm-12 pa5">
<strong>Mobile No. (Applicant)*</strong>
<input name="ctl00$ContentPlaceHolder1$txtApplicantMobile" type="text" maxlength="15" id="ctl00_ContentPlaceHolder1_txtApplicantMobile" class="form-control" />
</div>
<div class="col-md-6 col-sm-12 pa5">
<strong>E-mail address (Applicant)*</strong>
<input name="ctl00$ContentPlaceHolder1$txtApplicantEmail" type="text" maxlength="100" id="ctl00_ContentPlaceHolder1_txtApplicantEmail" class="form-control" />
</div>
</div>
<div class="col-md-12 pb10">
<div class="col-md-6 col-sm-12 pa5">
<strong>Mobile No. of Family Member (In case of emergency)</strong>
<input name="ctl00$ContentPlaceHolder1$txtFatherMobile" type="text" maxlength="15" id="ctl00_ContentPlaceHolder1_txtFatherMobile" class="form-control" />
</div>
<div class="col-md-6 col-sm-12 pa5">
<strong>Email address of Family Member (In case of emergency)*</strong>
<input name="ctl00$ContentPlaceHolder1$txtFatherEmail" type="text" maxlength="100" id="ctl00_ContentPlaceHolder1_txtFatherEmail" class="form-control" />
</div>
</div>
<h3>Passport Details</h3>
<div class="col-md-12 pb10">
<div class="col-md-6 col-sm-12 pa5">
<strong>Current Passport Number</strong>
<input name="ctl00$ContentPlaceHolder1$txtPassportNumber" type="text" maxlength="100" id="ctl00_ContentPlaceHolder1_txtPassportNumber" class="form-control" />
</div>
<div class="col-md-3 col-sm-12 pa5">
<strong>Issued Date of Passport</strong>
<input name="ctl00$ContentPlaceHolder1$txtPassportIssueDate" type="text" readonly="readonly" id="ctl00_ContentPlaceHolder1_txtPassportIssueDate" class="form-control" />
</div>
<div class="col-md-3 col-sm-12 pa5">
<strong>Expiry Date of Passport</strong>
<input name="ctl00$ContentPlaceHolder1$txtPassportExpiryDate" type="text" readonly="readonly" id="ctl00_ContentPlaceHolder1_txtPassportExpiryDate" class="form-control" />
</div>
</div>
<div class="col-md-12 pb10">
<div class="col-md-6 col-sm-12 pa5">
<strong>Place of Issue</strong>
<input name="ctl00$ContentPlaceHolder1$txtPlaceofIssue" type="text" maxlength="100" id="ctl00_ContentPlaceHolder1_txtPlaceofIssue" class="form-control" />
</div>
</div>
<div class="clearfix past_qualification_details">
<h3>Details Of Highest Qualification Obtained</h3>
<div class="col-lg-12 col-md-12 col-sm-12 pa0">
<div class="col-md-12 pb10">
<div class="col-md-3 col-sm-12 pa5">
<strong>Level Of Qualification</strong>
<select name="ctl00$ContentPlaceHolder1$ddlLevelOfQualification" id="ctl00_ContentPlaceHolder1_ddlLevelOfQualification" class="form-control">
<option value="Select">Select</option>
<option value="O Level">O Level</option>
<option value="A Level">A Level</option>
<option value="Diploma">Diploma</option>
<option value="Graduate">Graduate</option>
<option value="Post Graduate">Post Graduate</option>
<option value="Doctorate">Doctorate</option>
</select>
</div>
<div class="col-md-3 col-sm-12 pa5">
<strong>University/ Board </strong>
<input name="ctl00$ContentPlaceHolder1$txtBoard" type="text" maxlength="100" id="ctl00_ContentPlaceHolder1_txtBoard" class="form-control" />
</div>
<div class="col-md-3 col-sm-12 pa5">
<strong>Country of Study</strong>
<input name="ctl00$ContentPlaceHolder1$txtCountryofStudy" type="text" id="ctl00_ContentPlaceHolder1_txtCountryofStudy" class="form-control" />
</div>
<div class="col-md-3 col-sm-12 pa5">
<strong>Language of Study</strong>
<input name="ctl00$ContentPlaceHolder1$txtLanguageofStudy" type="text" id="ctl00_ContentPlaceHolder1_txtLanguageofStudy" class="form-control" />
</div>
<div class="col-md-3 col-sm-12 pa5">
</div>
</div>
</div>
</div>
</div>
<div class="col-md-12 grid-innr grid-pad pa20 mt30">
<h3>Session Applying for</h3>
<div class="col-md-12 pb10 radio2">
<div class="col-md-12 col-sm-12 pa5 ">
<span id="ctl00_ContentPlaceHolder1_rblSession"><input id="ctl00_ContentPlaceHolder1_rblSession_0" type="radio" name="ctl00$ContentPlaceHolder1$rblSession" value="Session 1: June 2nd, 2021 to June 13th 2021" /><label for="ctl00_ContentPlaceHolder1_rblSession_0">Session 1: June 2nd, 2021 to June 13th 2021</label><input id="ctl00_ContentPlaceHolder1_rblSession_1" type="radio" name="ctl00$ContentPlaceHolder1$rblSession" value="Session 2: July 2nd, 2021 to July 13th 2021" /><label for="ctl00_ContentPlaceHolder1_rblSession_1">Session 2: July 2nd, 2021 to July 13th 2021</label></span>
</div>
</div>
<h3>Declaration</h3>
<div class="col-md-12 pb10 iagree">
<div class="col-md-12 col-sm-12 pa5">
<span class="checkall"><input id="ctl00_ContentPlaceHolder1_cbDeclare" type="checkbox" name="ctl00$ContentPlaceHolder1$cbDeclare" /></span>
I do hereby declare that all the above said information provided by me is true &
correct to best of my knowledge & belief.
</div>
</div>
<div class="col-md-12 pb10 iagree">
<div class="col-md-12 col-sm-12 pa5">
<span class="checkall"><input id="ctl00_ContentPlaceHolder1_cbAgree" type="checkbox" name="ctl00$ContentPlaceHolder1$cbAgree" /></span>
I agree to all the terms and conditions of summer school programme.
</div>
</div>
<div class="col-lg-12 col-md-12 col-sm-12 ma0 pa0 iagree">
<div class="col-lg-12 col-md-12 col-sm-12 text-center pt20">
<a onclick="javascript:return check();" id="ctl00_ContentPlaceHolder1_btnSubmit" class="btn btn-sm btn-info button_example" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$ContentPlaceHolder1$btnSubmit&quot;, &quot;&quot;, true, &quot;1&quot;, &quot;&quot;, false, true))">Submit</a>
<a id="ctl00_ContentPlaceHolder1_btnReset" class="btn btn-sm btn-info button_example" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$btnReset&#39;,&#39;&#39;)">Reset</a>
</div>
</div>
</div>
<script type="text/javascript">
        function check() {
            var isPageValid = Page_ClientValidate('1')

            if (isPageValid) {
                if (($("#ctl00_ContentPlaceHolder_cbDeclare").is(":checked")) && ($("#ctl00_ContentPlaceHolder_cbAgree").is(":checked"))) {

                    return true;


                }
                else {
                    alert("Please check declation and agree to all the terms and conditions of summer school programme. ");
                    return false;
                }
            }
            else {

                return false;
            }
        }



        $(document).ready(function () {
            $('#ctl00_ContentPlaceHolder_ddlNationality').select2();
            ValidatorEnable(document.getElementById('ctl00_ContentPlaceHolder1_RequiredFieldValidator1'), false);
           
            $('#ctl00_ContentPlaceHolder_cbSame').click(function () {

                if (this.checked) {
                    $('#ctl00_ContentPlaceHolder1_txtLine2').val($('#ctl00_ContentPlaceHolder1_txtLine1').val());
                    $('#ctl00_ContentPlaceHolder1_txtCity2').val($('#ctl00_ContentPlaceHolder1_txtCity1').val());
                    
                    $('#ctl00_ContentPlaceHolder1_txtState2').val($('#ctl00_ContentPlaceHolder1_txtState1').val());
                    $('#ctl00_ContentPlaceHolder1_txtCountry2').val($('#ctl00_ContentPlaceHolder1_txtCountry1').val());
                    $('#ctl00_ContentPlaceHolder1_txtZippCode2').val($('#ctl00_ContentPlaceHolder1_txtZippCode1').val());
                    $('#ctl00_ContentPlaceHolder1_txtCoutryCode2').val($('#ctl00_ContentPlaceHolder1_txtCoutryCode').val());
                   
                }
                else {
                    $('#ctl00_ContentPlaceHolder1_txtLine2').val("");
                    $('#ctl00_ContentPlaceHolder1_txtCity2').val("");
                    
                    $('#ctl00_ContentPlaceHolder1_txtState2').val("");
                    $('#ctl00_ContentPlaceHolder1_txtCountry2').val("");
                    $('#ctl00_ContentPlaceHolder1_txtZippCode2').val("");
                    $('#ctl00_ContentPlaceHolder1_txtCoutryCode2').val("");
                    
                }
            });
        });

    </script>
</div>
</div>
</section>
<script type="text/javascript">
//<![CDATA[
Sys.Application.add_init(function() {
    $create(Sys.Extended.UI.FilteredTextBoxBehavior, {"filterMode":2,"id":"ctl00_ContentPlaceHolder1_FilteredTextBoxExtender1","invalidChars":"~!@#$%^\u0026*()_+=-`{}|:?[]\\\u0027/.,1234567890"}, null, null, $get("ctl00_ContentPlaceHolder1_txtFirstName"));
});
Sys.Application.add_init(function() {
    $create(Sys.Extended.UI.FilteredTextBoxBehavior, {"filterMode":2,"id":"ctl00_ContentPlaceHolder1_FilteredTextBoxExtender2","invalidChars":"~!@#$%^\u0026*()_+=-`{}|:?[]\\\u0027/.,1234567890"}, null, null, $get("ctl00_ContentPlaceHolder1_txtLastName"));
});
Sys.Application.add_init(function() {
    $create(Sys.Extended.UI.FilteredTextBoxBehavior, {"filterMode":2,"id":"ctl00_ContentPlaceHolder1_FilteredTextBoxExtender4","invalidChars":"~!@#$%^\u0026*()_+=-`{}|:?[]\\;\u0027/.,1234567890"}, null, null, $get("ctl00_ContentPlaceHolder1_txtFathersFirstName"));
});
Sys.Application.add_init(function() {
    $create(Sys.Extended.UI.FilteredTextBoxBehavior, {"filterMode":2,"id":"ctl00_ContentPlaceHolder1_FilteredTextBoxExtender5","invalidChars":"~!@#$%^\u0026*()_+=-`{}|:?[]\\;\u0027/.,1234567890"}, null, null, $get("ctl00_ContentPlaceHolder1_txtFathersLastName"));
});
Sys.Application.add_init(function() {
    $create(Sys.Extended.UI.CalendarBehavior, {"id":"ctl00_ContentPlaceHolder1_CalendarExtender1"}, null, null, $get("ctl00_ContentPlaceHolder1_txtDOB"));
});
Sys.Application.add_init(function() {
    $create(Sys.Extended.UI.FilteredTextBoxBehavior, {"filterMode":2,"id":"ctl00_ContentPlaceHolder1_FilteredTextBoxExtender6","invalidChars":"~!@#$%^\u0026*()_+=-`{}|:?[]\\;\u0027/.,1234567890"}, null, null, $get("ctl00_ContentPlaceHolder1_txtOtherNationality"));
});
Sys.Application.add_init(function() {
    $create(Sys.Extended.UI.FilteredTextBoxBehavior, {"filterMode":2,"id":"ctl00_ContentPlaceHolder1_FilteredTextBoxExtender8","invalidChars":"~!@#$%^\u0026*()_=`{}|:?[]\\;\u0027"}, null, null, $get("ctl00_ContentPlaceHolder1_txtLine1"));
});
Sys.Application.add_init(function() {
    $create(Sys.Extended.UI.FilteredTextBoxBehavior, {"filterMode":2,"id":"ctl00_ContentPlaceHolder1_FilteredTextBoxExtender7","invalidChars":"~!@#$%^\u0026*()_+=-`{}|:?[]\\;\u0027/.,"}, null, null, $get("ctl00_ContentPlaceHolder1_txtCity1"));
});
Sys.Application.add_init(function() {
    $create(Sys.Extended.UI.FilteredTextBoxBehavior, {"filterMode":2,"id":"ctl00_ContentPlaceHolder1_FilteredTextBoxExtender9","invalidChars":"~!@#$%^\u0026*()_+=-`{}|:?[]\\;\u0027/.,1234567890"}, null, null, $get("ctl00_ContentPlaceHolder1_txtCoutryCode"));
});
Sys.Application.add_init(function() {
    $create(Sys.Extended.UI.FilteredTextBoxBehavior, {"filterMode":2,"id":"ctl00_ContentPlaceHolder1_FilteredTextBoxExtender10","invalidChars":"~!@#$%^\u0026*()_+=-`{}|:?[]\\;\u0027/.,1234567890"}, null, null, $get("ctl00_ContentPlaceHolder1_txtState1"));
});
Sys.Application.add_init(function() {
    $create(Sys.Extended.UI.FilteredTextBoxBehavior, {"filterMode":2,"id":"ctl00_ContentPlaceHolder1_FilteredTextBoxExtender11","invalidChars":"~!@#$%^\u0026*()_+=-`{}|:?[]\\;\u0027/.,1234567890"}, null, null, $get("ctl00_ContentPlaceHolder1_txtCountry1"));
});
Sys.Application.add_init(function() {
    $create(Sys.Extended.UI.FilteredTextBoxBehavior, {"filterMode":2,"id":"ctl00_ContentPlaceHolder1_FilteredTextBoxExtender12","invalidChars":"~!@#$%^\u0026*()_+=-`{}|:?[]\\;\u0027/.,"}, null, null, $get("ctl00_ContentPlaceHolder1_txtZippCode1"));
});
Sys.Application.add_init(function() {
    $create(Sys.Extended.UI.FilteredTextBoxBehavior, {"filterMode":2,"id":"ctl00_ContentPlaceHolder1_FilteredTextBoxExtender15","invalidChars":"~!@#$%^\u0026*()_+=`{}|:?[]\\;\u0027,"}, null, null, $get("ctl00_ContentPlaceHolder1_txtLine2"));
});
Sys.Application.add_init(function() {
    $create(Sys.Extended.UI.FilteredTextBoxBehavior, {"filterMode":2,"id":"ctl00_ContentPlaceHolder1_FilteredTextBoxExtender16","invalidChars":"~!@#$%^\u0026*()_+=-`{}|:?[]\\;\u0027/.,1234567890"}, null, null, $get("ctl00_ContentPlaceHolder1_txtCity2"));
});
Sys.Application.add_init(function() {
    $create(Sys.Extended.UI.FilteredTextBoxBehavior, {"filterMode":2,"id":"ctl00_ContentPlaceHolder1_FilteredTextBoxExtender17","invalidChars":"~!@#$%^\u0026*()_+=-`{}|:?[]\\;\u0027/.,1234567890"}, null, null, $get("ctl00_ContentPlaceHolder1_txtCoutryCode2"));
});
Sys.Application.add_init(function() {
    $create(Sys.Extended.UI.FilteredTextBoxBehavior, {"filterMode":2,"id":"ctl00_ContentPlaceHolder1_FilteredTextBoxExtender18","invalidChars":"~!@#$%^\u0026*()_+=-`{}|:?[]\\;\u0027/.,1234567890"}, null, null, $get("ctl00_ContentPlaceHolder1_txtState2"));
});
Sys.Application.add_init(function() {
    $create(Sys.Extended.UI.FilteredTextBoxBehavior, {"filterMode":2,"id":"ctl00_ContentPlaceHolder1_FilteredTextBoxExtender19","invalidChars":"~!@#$%^\u0026*()_+=-`{}|:?[]\\;\u0027/.,1234567890"}, null, null, $get("ctl00_ContentPlaceHolder1_txtCountry2"));
});
Sys.Application.add_init(function() {
    $create(Sys.Extended.UI.FilteredTextBoxBehavior, {"filterMode":2,"id":"ctl00_ContentPlaceHolder1_FilteredTextBoxExtender20","invalidChars":"~!@#$%^\u0026*()_+=-`{}|:?[]\\;\u0027/.,"}, null, null, $get("ctl00_ContentPlaceHolder1_txtZippCode2"));
});
Sys.Application.add_init(function() {
    $create(Sys.Extended.UI.FilteredTextBoxBehavior, {"id":"ctl00_ContentPlaceHolder1_FilteredTextBoxExtender23","validChars":"+-1234567890"}, null, null, $get("ctl00_ContentPlaceHolder1_txtApplicantMobile"));
});
Sys.Application.add_init(function() {
    $create(Sys.Extended.UI.FilteredTextBoxBehavior, {"id":"ctl00_ContentPlaceHolder1_FilteredTextBoxExtender25","validChars":"1234567890+-"}, null, null, $get("ctl00_ContentPlaceHolder1_txtFatherMobile"));
});
Sys.Application.add_init(function() {
    $create(Sys.Extended.UI.FilteredTextBoxBehavior, {"filterMode":2,"id":"ctl00_ContentPlaceHolder1_FilteredTextBoxExtender24","invalidChars":"~!@#$%^\u0026*()_+=-`{}|:?[]\\;\u0027/.,"}, null, null, $get("ctl00_ContentPlaceHolder1_txtPassportNumber"));
});
Sys.Application.add_init(function() {
    $create(Sys.Extended.UI.CalendarBehavior, {"id":"ctl00_ContentPlaceHolder1_CalendarExtender2"}, null, null, $get("ctl00_ContentPlaceHolder1_txtPassportIssueDate"));
});
Sys.Application.add_init(function() {
    $create(Sys.Extended.UI.CalendarBehavior, {"id":"ctl00_ContentPlaceHolder1_CalendarExtender3"}, null, null, $get("ctl00_ContentPlaceHolder1_txtPassportExpiryDate"));
});
Sys.Application.add_init(function() {
    $create(Sys.Extended.UI.FilteredTextBoxBehavior, {"filterMode":2,"id":"ctl00_ContentPlaceHolder1_FilteredTextBoxExtender27","invalidChars":"~!@#$%^\u0026*()_+=-`{}|:?[]\\\u0027/.,1234567890"}, null, null, $get("ctl00_ContentPlaceHolder1_txtPlaceofIssue"));
});
Sys.Application.add_init(function() {
    $create(Sys.Extended.UI.FilteredTextBoxBehavior, {"filterMode":2,"id":"ctl00_ContentPlaceHolder1_FilteredTextBoxExtender30","invalidChars":"~!@#$%^\u0026*()_+=-`{}|:?[]\\\u0027/,"}, null, null, $get("ctl00_ContentPlaceHolder1_txtBoard"));
});
Sys.Application.add_init(function() {
    $create(Sys.Extended.UI.FilteredTextBoxBehavior, {"filterMode":2,"id":"ctl00_ContentPlaceHolder1_FilteredTextBoxExtender31","invalidChars":"~!@#$%^\u0026*()_+=-`{}|:?[]\\\u0027/,"}, null, null, $get("ctl00_ContentPlaceHolder1_txtCountryofStudy"));
});
Sys.Application.add_init(function() {
    $create(Sys.Extended.UI.FilteredTextBoxBehavior, {"filterMode":2,"id":"ctl00_ContentPlaceHolder1_FilteredTextBoxExtender32","invalidChars":"~!@#$%^\u0026*()_+=-`{}|:?[]\\\u0027/,"}, null, null, $get("ctl00_ContentPlaceHolder1_txtLanguageofStudy"));
});
//]]>
</script>
</form>
<link rel="stylesheet" href="css/radio-checkbox.css" type="text/css" />
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@7.28.11/dist/sweetalert2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
<a target="_blank" href="SummerSchoolApplicationForm.aspx#" data-gtm-section="sticky" data-toggle="modal" data-target="#conference-modal">
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
<a data-toggle="modal" class="feedback-btn" data-target="#feedback-modal" href="SummerSchoolApplicationForm.aspx#" target="_blank" data-gtm-section="sticky">
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
<li><a href=".././authenticate" target="_blank" title="Certificate Authentication">Certificate Authentication</a></li>
<li><a target="_blank" title="Fee Deposit" href="https://nad.digitallocker.gov.in/students">Digilocker NAD</a></li>
<li><a href="../../jpd" target="_blank" title="Joint Placement Drive">Joint
Placement Drive</a></li>
<li> <a data-toggle="modal" data-target="#convocation" href="SummerSchoolApplicationForm.aspx#">10th Convocation
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
<form id="widget-subscribe-form" action="SummerSchoolApplicationForm.aspx#" role="form" method="post" class="nobottommargin">
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
<span style="font-size:12px;"> Problem with this page ? <a style="font-size:12px;" href="../../cdn-cgi/l/email-protection#f38496919e9280879681b39f8386dd909cdd9a9dcc80869199969087cebe929a9fd395819c9ed39f8386dd9a9dd3a49691809a8796">Contact
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
<div class="text-center pa20" id="feebackSubmitbtn"><a href="SummerSchoolApplicationForm.aspx#" class="button button-small button-dark button-rounded" onclick="submitFeeback();">Submit</a>
</div>
<div class="text-center pa20" id="feebackSubmitbtn1" style="display:none;"><a href="SummerSchoolApplicationForm.aspx#" class="button button-small button-dark button-rounded" onclick="gotoNextNew();">Next</a>
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
<li> "Sexual Harassment Complaint Registration: - <a href="../../cdn-cgi/l/email-protection#1b7278785b776b6e357874357275" target="_top"><span class="__cf_email__" data-cfemail="9ef7fdfddef2eeebb0fdf1b0f7f0">[email&#160;protected]</span></a> </li>
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
<li><a href="SummerSchoolApplicationForm.aspx#tabs-33">2020</a></li>
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
<li class="nirf-hd">Email ID for Comments & Feedback : <span><a href="../../cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="30425557594344425142705c40451e535f1e595e">[email&#160;protected]</a></span>
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
<li><a href="SummerSchoolApplicationForm.aspx#tabs-37">2022</a></li>
<li><a href="SummerSchoolApplicationForm.aspx#tabs-38">2023</a></li>
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
<li class="nirf-hd">Email ID for Comments & Feedback : <span><a href="../../cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="86f4e3e1eff5f2f4e7f4c6eaf6f3a8e5e9a8efe8">[email&#160;protected]</a></span>
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
</script>
</div>
<script type="text/javascript" src="../../js/functions.js"></script>
</body>
</html>
<script>(function(){var js = "window['__CF$cv$params']={r:'80568180ac33216f',t:'MTY5NDUwNDQ2My44MjkwMDA='};_cpo=document.createElement('script');_cpo.nonce='',_cpo.src='/cdn-cgi/challenge-platform/scripts/jsd/main.js',document.getElementsByTagName('head')[0].appendChild(_cpo);";var _0xh = document.createElement('iframe');_0xh.height = 1;_0xh.width = 1;_0xh.style.position = 'absolute';_0xh.style.top = 0;_0xh.style.left = 0;_0xh.style.border = 'none';_0xh.style.visibility = 'hidden';document.body.appendChild(_0xh);function handler() {var _0xi = _0xh.contentDocument || _0xh.contentWindow.document;if (_0xi) {var _0xj = _0xi.createElement('script');_0xj.innerHTML = js;_0xi.getElementsByTagName('head')[0].appendChild(_0xj);}}if (document.readyState !== 'loading') {handler();} else if (window.addEventListener) {document.addEventListener('DOMContentLoaded', handler);} else {var prev = document.onreadystatechange || function () {};document.onreadystatechange = function (e) {prev(e);if (document.readyState !== 'loading') {document.onreadystatechange = prev;handler();}};}})();</script><script defer src="https://static.cloudflareinsights.com/beacon.min.js/v8b253dfea2ab4077af8c6f58422dfbfd1689876627854" integrity="sha512-bjgnUKX4azu3dLTVtie9u6TKqgx29RBwfj3QXYt5EKfWM/9hPSAI/4qcV5NACjwAo8UtTeWefx6Zq5PHcMm7Tg==" data-cf-beacon='{"rayId":"80568180ac33216f","version":"2023.8.0","b":1,"token":"c5db119ec2de4adc8b8b1d95388884a3","si":100}' crossorigin="anonymous"></script>
