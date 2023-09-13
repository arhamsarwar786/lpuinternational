const psInitWebinars = (upcomingContainer, oldContainer, orderbySelector) => {

    upcomingContainer = $(upcomingContainer);
    oldContainer = $(oldContainer);
    orderbySelector = $(orderbySelector);
    

    const getWebinarsAPI = 'https://services.lpu.in/api/services/WebinarGetActiveList';

    let webinarsList = [];
    let disciplinesList = [];
    let orderByValue = orderbySelector.find(":selected").text();;

    const getWebinarCard = (id,topic,dateFormatted,timeFormatted,resourcePersons,registerLink,videoLink,isUpcoming,hoursLeft) => {
        return `
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-4">
                <div class="entry mt30 mb0" data-id="${id}">
                    <div class="grid-outer">
                        ${isUpcoming && hoursLeft ? `
                        <div class="badge-relative time-counter">
                            <span class="badge ${hoursLeft < 24 ? 'badge-danger' : 'badge-success'}">${hoursLeft < 24 ? `${hoursLeft} hrs` : `${parseInt(hoursLeft/24)} days`} Left</span>
                        </div>
                        `:''}
                        <div class="entry-content clearfix pb20 pt20">
                            <div class="webinar-detail">
                                <h4 class="mb5">${topic}</h4>
                                <div class="row schedule mb20">
                                    <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 col-xl-5">
                                        <small><i class="fa fa-calendar"></i> ${dateFormatted}</small>
                                    </div>
                                    <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7 col-xl-7 text-right">
                                        <small><i class="fa fa-clock-o"></i> ${timeFormatted}</small>
                                    </div>
                                </div>
                                <div class="mb10 webinar-presenters">
                                    <h5 class="mb5">Resource Persons</h5>
                                    <div class="${resourcePersons[0].name === null || resourcePersons[0].name === '' ? 'revealing-soon' : 'owl-carousel image-carousel carousel-widget owl-diverse webinar-carousel'}"
                                         data-pagi="false" data-margin="0" data-items-xs="1" data-items-sm="1" data-items-md="1"
                                         data-items-lg="1" data-items-xl="1" data-loop="false" data-autoplay="5000" data-nav="true">
                                        ${resourcePersons.flatMap(person => person.name == null || person.name === '' ? [] : [`
                                        <div class="oc-item">
                                            <div class="clearfix">
                                                <div class="pull-left">
                                                    <img src="${person.pictureUrl}" />
                                                </div>
                                                <div class="pull-left ml20 mt5" style="width: calc(100% - 70px);">
                                                    <h5 class="mb0">${person.name}</h5>
                                                    <p class="designation mb0" style="font-weight: 500; width: 230px;">
                                                        ${person.intro}
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        `]).join('')}
                                    </div>
                                </div>
                            </div>
                        </div>
                        ${isUpcoming ? `
                        <p class="zoom-link">
                            <a href="${registerLink}" target="_blank" class="sbutton plr6"><span>Register</span></a> &nbsp;&nbsp;
                            OR &nbsp;&nbsp;
                            <a href="javascript:void(0)" class="scan-qr">Scan QR Code</a>
                        </p>
                        <div class="qr-overlay" style="display:none;">
                            <div data-register-link="${registerLink}" class="ps-qr-code" />
                            <a><i class="fa fa-close"></i></a>
                        </div>
                        `: `
                        <p class="zoom-link">
                            <a href="${videoLink}" target="_blank" class="sbutton"><span>View YouTube Recording</span></a>
                        </p>
                        `}
                    </div>
                </div>
            </div>
        `;
    }

    const getWebinarsList = () => {
        $.getJSON(getWebinarsAPI).done((data) => {
            webinarsList = data.map((webinar) => {
                try {
                    return {
                        id: webinar.ID,
                        discipline: webinars.Discipline,
                        topic: webinar.Topic,
                        date: new Date(webinar.WebinarDate).getTime(),
                        dateOriginal:new Date(webinar.WebinarDate),
                        dateFormatted: webinar.WebinarDateFormatted,
                        timeFormatted: webinar.WebinarTimeFormatted,
                        registerLink: webinar.RegisterLink,
                        videoLink: webinar.RecordingLink,
                        resourcePersons: [
                            { name: webinar.Person1Name, intro: webinar.Person1Intro, pictureUrl: webinar.Person1PictureUrl },
                            { name: webinar.Person2Name, intro: webinar.Person2Intro, pictureUrl: webinar.Person2PictureUrl },
                            { name: webinar.Person3Name, intro: webinar.Person3Intro, pictureUrl: webinar.Person3PictureUrl },
                            { name: webinar.Person4Name, intro: webinar.Person4Intro, pictureUrl: webinar.Person4PictureUrl },
                            { name: webinar.Person5Name, intro: webinar.Person5Intro, pictureUrl: webinar.Person5PictureUrl },
                        ],
                        displayOrder: webinar.displayOrder,
                        hoursLeft: (webinar.LastDateToRegister != null ? parseInt((new Date(webinar.LastDateToRegister).getTime() - new Date().getTime())/(60*60*1000)) : null)
                    }
                } catch (ex) {
                    console.error(ex);
                }
            });
            // console.log(webinarsList);

            disciplinesList = data.map((webinar,index) => {
                disciplinesList.push(webinar.Discipline);
            });
            // console.log(disciplinesList); 

            renderWebinarsList();

        }).fail((error) => {
            console.error(error);
        });
    }

    const renderWebinarsList = (discipline) => {
        const now = new Date();
        now.setDate(now.getDate() - 2);
        const nowBack = now.getTime();
        let a =Date.parse(new Date());
        let aa  = Date.parse(webinarsList[0]['dateOriginal']);

        const webinarsListByDiscipline = webinarsList.filter(webinar => webinar.discipline == discipline);
        // console.log(webinarsListByDiscipline);
        
        const upcomingWebinars = webinarsListByDiscipline.filter(webinar => webinar.dateOriginal > new Date())
            .map(webinar => getWebinarCard(webinar.id, webinar.topic, webinar.dateFormatted, webinar.timeFormatted, webinar.resourcePersons, webinar.registerLink, webinar.videoLink, true, webinar.hoursLeft))
            .join('');

        const oldWebinars = webinarsListByDiscipline.filter(webinar => webinar.date <= nowBack)
            .sort((a, b) => (a[orderByValue] > b[orderByValue]) ? 1 : ((b[orderByValue] > a[orderByValue]) ? -1 : 0))
            .sort((a, b) => b.dateOriginal - a.dateOriginal)
            .map(webinar => getWebinarCard(webinar.id, webinar.topic, webinar.dateFormatted, webinar.timeFormatted, webinar.resourcePersons, webinar.registerLink, webinar.videoLink, false, null))
            .join('');
           // oldWebinars =  oldWebinars.sort((a, b) => b.date - a.date)
            
        upcomingContainer.html($(upcomingWebinars)).find('.ps-qr-code').each(function (i, it) {
            new QRCode($(it)[0], {
                text: $(it).attr("data-register-link"),
                width: 200,
                height: 200,
                colorDark: "#000000",
                colorLight: "#ffffff",
                correctLevel: QRCode.CorrectLevel.H
            });
        });
        oldContainer.html($(oldWebinars));
        setTimeout(() => {
            $(".webinar-carousel").owlCarousel({
                margin: 0,
                loop: true,
                nav: true,
                navText: ['<i class="icon-angle-left"></i>', '<i class="icon-angle-right"></i>'],
                autoplay: true,
                autoplayHoverPause: true,
                dots: true,
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

            $('a.scan-qr').click(function () {
                $(this).closest(".grid-outer").find(".qr-overlay").fadeIn(300);
            });
            $('.grid-outer .qr-overlay a').click(function () {
                $(this).parent(".qr-overlay").fadeOut(300);
            });

        }, 100);
    }

    orderbySelector.on('change', (e) => {
        orderByValue = orderbySelector.find(":selected").text();
        renderWebinarsList();
    });

    
    // let disciplines = '';
    disciplinesList.forEach(discipline => {
        $('<option value="'+discipline+'">'+discipline+'</option>').appendTo('#webinars select[name=orderby]');
        // disciplines =+ '<option value="'+ discipline + '">' + discipline + '</option>'
    })
    // console.log(disciplines);
    // orderbySelector.html(disciplines);

    getWebinarsList();
}

$(document).ready(function () {
    psInitWebinars($('#upcoming .ps-upcoming-webinars'), $('#past .ps-old-webinars'), $('#webinars select[name=orderby]'));
})