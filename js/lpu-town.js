function checkcity(statename) {
    //$.get('http://localhost:64383/api/programsearch/GetStateFromURLforLpuInYourTown?url='+statename, function(data) {
    $.get('//services.lpu.in/api/programsearch/GetStateFromURLforLpuInYourTown?url=' + statename, function(data) {
        if (typeof data !== "undefined" && data !== null && String(data).trim() !== "") {
            $('#cities').val(data);
            var cityname = data.replace(/-/g, ' ');
            $("#state").append(new Option(cityname, cityname));
            $('#state').val(cityname);
            $("#cities").trigger('change');
            gotodiv();
        }
    });
}

function gotodiv() {
    var headerHeight = $('#header').height();
    var pageMenuHeight = $('#page-menu').height();
    var helloBarHeight = $('#lpu-bar').height();
    var totalHeight = headerHeight + pageMenuHeight + helloBarHeight;

    $("html, body").animate({
        scrollTop: $('#town').offset().top - totalHeight
    });
}
$(document).ready(function() {
    var pageURL = $(location).attr("href");
    var res = pageURL.split("/");
    var statename = res[res.length - 1];
    var removeutm = statename.substr(0, statename.indexOf('?'));
    if (removeutm.length > 0) {
        statename = statename.substr(0, statename.indexOf('?'))
    }

    //$.get('http://localhost:64383/api/programsearch/getCities', function(data) {
    $.get('//services.lpu.in/api/programsearch/getCities', function(data) {
        $.each(data, function(index, item) {
            $('#cities').append($("<option></option>").val(item.cityname.replace(/ /g, "-")).html(item.cityname));
        });
        checkcity(statename);
    });
    $("#cities").change(function() {
        $('#loading').css('display', '');
        $('#offices').html('');
        $('#officedetails').html('');
        var cityid = $("#cities option:selected").text();

        //$.get('http://localhost:64383/api/programsearch/gettowndetails?statename='+cityid, function(data) {
        $.get('//services.lpu.in/api/programsearch/gettowndetails?statename=' + cityid, function(data) {
            debugger;
            $('#loading').css('display', 'none');
            $.each(data, function(index, item) {

                if (item.officetype == "Camp Office") {
                    var imagediv = "";
                    $('#offices').append("<div class='col-md-6 pa0'> <h3 class='font-body t400 ls1 mb15'>" + item.city + "</h3> <div class='col-md-12 pa0'> <address style='line-height: 1.7;'> <strong>Counselling Office - " + item.city + "</strong><br>" + item.address + " <br> </address> </div> <div class='col-md-12 pa0'> <span title='Phone Number'><strong>Phone: </strong></span> " + item.campphone + " <br><a href='https://www.google.com/maps/place/" + item.Lat + "' class='button button-small' target='_blank'>View on Google Map</a> <div class='clear topmargin-sm'></div> </div> </div>");
                    var ds = "<div class='col-md-6 well'>";
                    $.each(item.image, function(index, item) {
                        imagediv += "<div class='col-md-6 mb15 text-center'><center style='overflow:hidden;width:80px;height:80px;border-radius: 50%;margin-bottom:15px;margin:0 auto'><img class='img'  src='//www.lpu.in/TownImages/" + item.image + "'/><br/></center><div>" + item.name + "</div></div>";
                    });
                    var de = "</div>";
                    if (imagediv != "") {
                        var images = ds + imagediv + de;
                        $('#offices').append(images);
                    }

                    $('#offices').append("<div class='divider divider-rounded divider-center'><i class='icon-map-marker'></i></div>");
                } else if (item.officetype == "Admission Office") {
                    var officediv = "<div class='col-md-6 pa0'><div class='col-md-12 pa0'> <h3 class='font-body t400 ls1 mb15'>" + item.officename + "</h3> <h4>" + item.city + "</h4></div><div class='col-md-12 pa0'><span title='Phone Number'>Phone Number</span> " + item.campphone + "</div> </div>";
                    var imagesdetails = item.details[0];
                    var imagediv2 = "";
                    var ds = "<div class='col-md-6 well'>";
                    var de = "</div>";

                    $.each(imagesdetails.image, function(index, item) {

                        imagediv2 += "<div class='col-md-6 mb15 text-center'><center style='overflow:hidden;width:80px;height:80px;border-radius: 50%;margin-bottom:15px;margin:0 auto'><img class='img' src='//www.lpu.in/TownImages/" + item.image + "'/><br/></center><div>" + item.name + "</div></div>";
                    });
                    var table = "<table class='table'> <thead> <tr> <th style='width:20%'>City </th> <th style='width:20%'>Dates</th> <th style='width:60%'>Location</th></tr> </thead> <tbody>";
                    var content = "";
                    $.each(item.details, function(index, item) {
                        content += "<tr> <td>" + item.city + "</td> <td>" + item.datefrom + " to " + item.dateto + "</td> <td>" + item.location + "</td></tr>";

                    });
                    var separator = "<div class='divider divider-rounded divider-center'><i class='icon-map-marker'></i></div>";
                    var tableclose = "</table>";
                    var dd = "";
                    if (imagediv2 != "") {
                        var dd = ds + imagediv2 + de;

                    }
                    $('#officedetails').append(officediv + dd + table + content + tableclose + separator);
                }

            });
        });
    });

});