var path = "//services.lpu.in/";
//var path = "http://localhost:64383/";
var ta = "Details";
if (window.location.href.indexOf('#') != -1) {
    ta = window.location.href.substring(window.location.href.indexOf('#') + 1);
} else if (sessionStorage.pagetab != undefined) {
    ta = sessionStorage.pagetab;
} else {
    ta = "Details";
}
var programOutcomeExist = "NO";
var programSpecOutcomeExist = "NO";
var outcomesHTML = "";
var CurriculumSkipped="0",totaltabs = 0;

var isScholarship = false,
    standing_id = 0,
    discipline_id = 0,
    stream_id = 0,
    officialcode = "",
    program_id = "",
    programname = "",
    qualname = "",
    discname = "",
    streamname = "",
    curl = "",
    applynowlink = "",
    plist = "",
    pagetab = ta,
    filter = "all",
    search_clicked = false,
    no_stream = false,
    onlysearchbar = false,
    isMobile = false;
var rurl = new Array();

function spliturl() {
    var major = window.document.URL;
    if (major.indexOf("172.17.60.93") != -1) {
        curl = major.substr(major.indexOf("/programmes"));
        curl = curl.replace('/programmes', '');
    }else if (major.indexOf("172.19.2.52") != -1) {
        curl = major.substr(major.indexOf("/programmes"));
        curl = curl.replace('/programmes', '');
        //console.log(curl);
    }
    
    else if (major.indexOf("dev.lpu.in") != -1) {
        curl = major.substr(major.indexOf("/programmes"));
        curl = curl.replace('/programmes', '');
    } else if (major.indexOf("lpu.in") != -1) {
        curl = major.substr(major.indexOf("/programmes"));
        curl = curl.replace('/programmes', '');
    }
    if (curl.indexOf("program-details-dev.php") == -1 && curl.indexOf("program-details.php") == -1) {
        $.get(path + "api/programsearch/GetPerameterfromInternationalUrl?url=" + curl).done(function(data) {
            if (data != null && data.length > 0) {
                filter = "All";
                officialcode = data[0].OfficialCode;
                programname = data[0].ProgramName.trim();
                program_id = data[0].ProgramId;
                standing_id = data[0].StandingId;
                qualname = data[0].Qualification;
                discipline_id = data[0].DisciplineId;
                discname = data[0].Discipline;
                stream_id = data[0].StreamId;
                streamname = data[0].Stream;
                rurl[0] = filter;
                rurl[1] = qualname.trim();
                rurl[2] = discname.trim();
                if (streamname != "" && streamname != null)
                    rurl[3] = streamname.trim();
                rurl[4] = programname.trim();
                rurl[5] = "Details";
                $("#seltype input[title='" + filter + "']").prop('checked', true);
                typeclicked();
                $("#selstanding > div > input[title='" + qualname + "']").prop('checked', true);
                if (streamname != "") {
                    $("#stream > div[class='ps-content pb5']").text(streamname);
                }
                getresult();
            } else {
                var a = major.substr(major.indexOf("programmes/") + 11);
                if (a.indexOf('#') != -1)
                    a = a.substr(0, a.indexOf('#')).split('/');
                else
                    a = a.split('/');
                var k = 0;
                for (i = 0; i < a.length; i++) {
                    if (a.length > 4 && a.length == 6 && k == 4) {
                        if (a[i - 1] != "Engineering" && a[i - 1] != "Sciences" && a[i - 1] != "Design") {
                            rurl.push('');
                            k++;
                            i--;
                        } else {
                            rurl.push(decodeURIComponent(a[i].trim()).trim());
                            k++;
                        }
                    } else {
                        rurl.push(decodeURIComponent(a[i].trim()).trim());
                        k++;
                    }
                }
                if (rurl.length >= 1) {
                    if ($("#seltype > div > input[value='" + rurl[0] + "']") != null && $("#seltype > div > input[value='" + rurl[0] + "']") != undefined) {
                        $("#seltype > div > input[value='" + rurl[0] + "']").prop('checked', true);
                        typeclicked();
                    }
                }
                if (rurl.length > 3) {
                    rurl[2] = rurl[2].replace(/_/g, ' ');
                    if (rurl[4] != undefined) {
                        rurl[3] = rurl[3].replace(/_/g, ' ');
                        rurl[4] = rurl[4].replace(/_/g, ' ');
                    } else {
                        rurl[4] = rurl[3].replace(/_/g, ' ');
                    }
                    rurl[5] = "Details";
                }
                var response = {};
                var stateObj = {};
                if (major.indexOf("172.17.60.93") != -1) {
                    curl = "/lpu2016/newlpu/international/programmes/ProgramSearch.php";
                }else if (major.indexOf("172.19.2.52") != -1) {
                    if (major.toLowerCase().indexOf("programsearch.php") != -1) {
                        curl = "/lpu/international/programmes/ProgramSearch.php";
                    } else {
                        curl = "/lpu/international/programmes" + curl;
                    }
                }
                 else {
                    curl = "/international/programmes/ProgramSearch.php";
                }
                processAjaxData(response, stateObj, curl);
            }
        });
    }
}

function showwhich(p) {
    $("#resultpanels .tabs-panel").removeClass("is-active");
    $("#Programme").hide();
    $('.tabs-panel').css({
        padding: '0 0'
    });
    if (isMobile) {
        $("#seldiscipline").css('float', 'none');
    } else {
        $("#seldiscipline").css('float', 'left');
    }
    if (p == "type") {
        $("#CourseType").removeClass("hide");
        $("#CourseType").addClass("is-active");
        $("#CourseType > div").show();
        $("#litype").attr('aria-expanded', true);
        $("#litype").attr('aria-selected', true);
        $("a[href='#CourseType']").attr('aria-expanded', true);
        $("a[href='#CourseType']").attr('aria-selected', true);
        $("#CourseType").show();
        $("#Qualification").hide();
        $("#Discipline").hide();
        $("#Stream").hide();
        $("#Programme").hide();
    } else if (p == "qual") {
        $("#CourseType").removeClass("is-active");
        $("#CourseType > div").hide();
        $("#Qualification").removeClass("hide");
        $("#Qualification").addClass("is-active");
        $("#Qualification > div[class='col-md-12 ps-bar-details']").show();
        $("#litype").attr('aria-expanded', false);
        $("#litype").attr('aria-selected', false);
        $("#litype").removeClass('is-active');
        $("#CourseType").removeClass('is-active');
        $("#CourseType").attr('aria-hidden', true);
        $("#CourseType").hide();
        $("a[href='#CourseType']").attr('aria-expanded', false);
        $("a[href='#CourseType']").attr('aria-selected', false);
        $("#liqual").attr('aria-expanded', true);
        $("#liqual").attr('aria-selected', true);
        $("#liqual").addClass('is-active');
        $("#Qualification").attr('aria-hidden', false);
        $("#Qualification").show();
        $("a[href='#Qualification']").attr('aria-expanded', true);
        $("a[href='#Qualification']").attr('aria-selected', true);
        if ($("#lidisc").hasClass('ps-text')) {
            $("#litype").removeClass("ps-text").removeClass("ps-text1").removeClass("ps-text2").addClass("ps-text2");
            $("#liqual").removeClass("ps-text").removeClass("ps-text1").removeClass("ps-text2").addClass("ps-text1");
        } else {
            $("#litype").removeClass("ps-text").removeClass("ps-text1").removeClass("ps-text2").addClass("ps-text2");
            $("#liqual").removeClass("ps-text").removeClass("ps-text1").removeClass("ps-text2").addClass("ps-text2");
        }
        $("#Discipline").hide();
        $("#Stream").hide();
        $("#Programme").hide();
    } else if (p == "discipline") {
        $("#Qualification").removeClass("is-active");
        $("#Qualification > div").hide();
        $("#Stream").removeClass("is-active");
        $("#Stream > div").hide();
        if (!isMobile) {
            $("#Discipline").toggle();
            $("#Discipline").removeClass("hide");
            $("#Discipline").addClass("is-active");
            $("#Discipline > div[class='col-md-12 ps-bar-details']").show();
        } else {
            $("#Discipline").removeClass("hide");
            $("#Discipline").addClass("is-active");
            $("#Discipline").show();
            $("#Discipline > div[class='col-md-12 ps-bar-details']").show();
            $("#liqual").attr('aria-expanded', false);
            $("#liqual").attr('aria-selected', false);
            $("#liqual").removeClass('is-active');
            $("#Qualification").removeClass('is-active');
            $("#Qualification").attr('aria-hidden', true);
            $("#Qualification").hide();
            $("a[href='#Qualification']").attr('aria-expanded', false);
            $("a[href='#Qualification']").attr('aria-selected', false);
            $("#lidisc").attr('aria-expanded', true);
            $("#lidisc").attr('aria-selected', true);
            $("#lidisc").addClass('is-active');
            $("#Discipline").attr('aria-hidden', false);
            $("a[href='#Discipline']").attr('aria-expanded', true);
            $("a[href='#Discipline']").attr('aria-selected', true);
        }
        if ($("#liqual").hasClass('ps-text1')) {
            $("#liqual").removeClass("ps-text").removeClass("ps-text1").removeClass("ps-text2").addClass("ps-text2");
            $("#lidisc").removeClass("ps-text").removeClass("ps-text1").removeClass("ps-text2").addClass("ps-text1");
        }
        if ($("#licourse").hasClass('ps-text')) {
            $("#lidisc").removeClass("ps-text").removeClass("ps-text1").removeClass("ps-text2").addClass("ps-text1");
        }
    } else if (p == "stream") {
        $("#litype").removeClass('col-md-4').removeClass('col-md-3').addClass('col-md-2');
        $("#liqual").removeClass('col-md-4').removeClass('col-md-3').addClass('col-md-2');
        $("#lidisc").removeClass('col-md-4').removeClass('col-md-3').addClass('col-md-2');
        $("#listream").removeClass('col-md-4').removeClass('col-md-3').addClass('col-md-3');
        $("#licourse").removeClass('col-md-4').removeClass('col-md-3').addClass('col-md-3');
        if (!isMobile) {
            $("#Discipline").removeClass("is-active");
            $("#Discipline >div").hide();
            $("#Stream").removeClass("hide");
            $("#Stream").addClass("is-active");
            $("#Stream").show();
            $("#Stream > div").toggle();
        } else {
            $("#Discipline").removeClass("is-active");
            $("#Discipline >div").hide();
            $("#Stream").removeClass("hide");
            $("#Stream").addClass("is-active");
            $("#Stream").show();
            $("#Stream > div").show();
            $("#lidisc").attr('aria-expanded', false);
            $("#lidisc").attr('aria-selected', false);
            $("#lidisc").removeClass('is-active');
            $("#Discipline").removeClass('is-active');
            $("#Discipline").attr('aria-hidden', true);
            $("#Discipline").hide();
            $("a[href='#Discipline']").attr('aria-expanded', false);
            $("a[href='#Discipline']").attr('aria-selected', false);
            $("#listream").attr('aria-expanded', true);
            $("#listream").attr('aria-selected', true);
            $("#listream").addClass('is-active');
            $("#Stream").attr('aria-hidden', false);
            $("#Stream").show();
            $("a[href='#Stream']").attr('aria-expanded', true);
            $("a[href='#Stream']").attr('aria-selected', true);
        }
        $("#lidisc").removeClass("ps-text").removeClass("ps-text1").removeClass("ps-text2").addClass("ps-text2");
        $("#listream").removeClass("ps-text").removeClass("ps-text1").removeClass("ps-text2").addClass("ps-text1");
        if ($("#licourse").hasClass('ps-text')) {
            $("#licourse").removeClass("ps-text").removeClass("ps-text1").removeClass("ps-text2").addClass("ps-text");
        }
    } else if (p == "course") {
        if ($("#listream").hasClass('hide')) {
            $("#litype").removeClass('col-md-4').removeClass('col-md-2').addClass('col-md-3');
            $("#liqual").removeClass('col-md-4').removeClass('col-md-2').addClass('col-md-3');
            $("#lidisc").removeClass('col-md-4').removeClass('col-md-2').addClass('col-md-3');
            $("#licourse").removeClass('col-md-4').removeClass('col-md-2').addClass('col-md-3');
        } else {}
        $("#listream").attr('aria-expanded', false);
        $("#listream").attr('aria-selected', false);
        $("#listream").removeClass('is-active');
        $("#Stream").removeClass('is-active');
        $("#Stream").attr('aria-hidden', true);
        $("#Stream").hide();
        $("a[href='#Stream']").attr('aria-expanded', false);
        $("a[href='#Stream']").attr('aria-selected', false);
        $("#lidisc").attr('aria-expanded', false);
        $("#lidisc").attr('aria-selected', false);
        $("#lidisc").removeClass('is-active');
        $("#Discipline").removeClass('is-active');
        $("#Discipline").attr('aria-hidden', true);
        $("#Discipline").hide();
        $("a[href='#Discipline']").attr('aria-expanded', false);
        $("a[href='#Discipline']").attr('aria-selected', false);
        $("#licourse").attr('aria-expanded', true);
        $("#licourse").attr('aria-selected', true);
        $("#licourse").addClass('is-active');
        $("#Programme").attr('aria-hidden', false);
        $("#Programme").show();
        $("a[href='#Programme']").attr('aria-expanded', true);
        $("a[href='#Programme']").attr('aria-selected', true);
        if (!$("#listream").hasClass('hide')) {
            if ($("#listream").hasClass('ps-text1')) {
                $("#listream").removeClass("ps-text").removeClass("ps-text1").removeClass("ps-text2").addClass("ps-text2");
                $("#licourse").removeClass("ps-text").removeClass("ps-text1").removeClass("ps-text2").addClass("ps-text1");
            }
            if ($("#listream").hasClass('ps-text2')) {
                $("#listream").removeClass("ps-text").removeClass("ps-text1").removeClass("ps-text2").addClass("ps-text2");
                $("#licourse").removeClass("ps-text").removeClass("ps-text1").removeClass("ps-text2").addClass("ps-text1");
            }
        } else {
            $("#lidisc").removeClass("ps-text").removeClass("ps-text1").removeClass("ps-text2").addClass("ps-text2");
            $("#licourse").removeClass("ps-text").removeClass("ps-text1").removeClass("ps-text2").addClass("ps-text1");
        }
        $("#Discipline").removeClass("is-active");
        $("#Programme").removeClass("hide");
        $("#Programme").addClass("is-active");
        $("#Programme > div[class='col-md-12 ps-bar-details']").show();
    }
}
$("#litype").click(function() {
    if (!$(this).hasClass('ps-text')) {
        showwhich("type");
    } else {
        return false;
    }
});
$("#liqual").click(function() {
    if (!$(this).hasClass('ps-text')) {
        showwhich("qual");
    } else {
        return false;
    }
});
$("#lidisc").click(function() {
    if (!$(this).hasClass('ps-text')) {
        showwhich("discipline");
    } else {
        return false;
    }
});
$("#listream").click(function() {
    if (!$(this).hasClass('ps-text')) {
        showwhich("stream");
    } else {
        return false;
    }
});
$("#licourse").click(function() {
    if (!$(this).hasClass('ps-text')) {
        showwhich("course");
    } else {
        return false;
    }
});
$("#elect > ul > li > a").click(function() {
    var t = $(this).attr('data-name');
    getelectivecourses(t);
});

function slide(el) {}

function gettype() {
    $("#seltype").html('');
    var html = "";
    html += "<div>";
    html += '<input title="All" data-name="All" id="tAll" class="radio-style" name="types" value="all" type="radio">';
    html += '<label title="All" data-name="All" for="tAll" class="radio-style-2-label radio-small">All</label>';
    html += "</div>";
    html += "<div>";
    html += '<input title="Standard or Regular" data-name="regular" id="tregular" class="radio-style" name="types" value="regular" type="radio">';
    html += '<label title="Standard or Regular" data-name="Standard or Regular" for="tregular" class="radio-style-2-label radio-small">Standard or Regular</label>';
    html += "</div>";
    html += "<div>";
    html += '<input title="Hons" data-name="Hons" id="thons" class="radio-style" name="types" value="hons" type="radio">';
    html += '<label title="Hons" data-name="Hons" for="thons" class="radio-style-2-label radio-small">Hons.</label>';
    html += "</div>";
    html += "<div>";
    html += '<input title="Integrated" data-name="Integrated" id="tintegrated" class="radio-style" name="types" value="integrated" type="radio">';
    html += '<label title="Integrated" data-name="Integrated" for="tintegrated" class="radio-style-2-label radio-small">Integrated</label>';
    html += "</div>";
    html += "<div>";
    html += '<input title="Lateral Entry" data-name="Lateral" id="tlateral" class="radio-style" name="types" value="lateral" type="radio">';
    html += '<label title="Lateral Entry" data-name="Lateral" for="tlateral" class="radio-style-2-label radio-small">Lateral Entry</label>';
    html += "</div>";
    html += "<div>";
    html += '<input title="Part Time" data-name="PartTime" id="tparttime" class="radio-style" name="types" value="parttime" type="radio">';
    html += '<label title="Part Time" data-name="PartTime" for="tparttime" class="radio-style-2-label radio-small">Part Time</label>';
    html += "</div>";
    $("#seltype").html(html);
    $("#seltype input[type='radio']").click(function() {
        clearall('type');
        rurl.length = 0;
        typeclicked();
    });
    if (rurl.length > 1) {
        $("#seltype > div > input[title='" + rurl[0] + "']").prop('checked', true);
        typeclicked();
    }
}

function typeclicked() {
    filter = $("#seltype > div > input[type='radio']:checked").val();
    var t = $("#seltype > div > input[type='radio']:checked").attr('id');
    var typetext = $("#seltype > div > label[for='" + t + "']").text();
    $("#type > div[class='ps-content pb5']").text(typetext);
    $("#litype > div[class='ps-content pb5']").text(typetext);
    $("#ticktype").removeClass('hide');
    if (filter != "") {
        getstanding(filter);
    }
}

function toTitleCase(str) {
    return str.replace(/\b\w/g, function(txt) {
        return txt.toUpperCase();
    });
}

function getstanding(f) {
    if (f != undefined) {
        if (f != "")
            filter = f;
        $("#seltype > div > input[value='" + filter + "']").prop('checked', true);
    } else {
        filter = $("#seltype > div > input[type='radio']:checked").val();
    }
    if (filter != "" && filter != undefined) {
        $.get(path + "api/programsearch/GetInternationalStanding/" + filter, function(data) {
            showwhich('qual');
            var html = "";
            for (i = 0; i < data.length; i++) {
                html += "<div>";
                html += "<input title='" + data[i].Standing.trim() + "' id='Q" + data[i].Id + "' value='" + data[i].Id + "' class='radio-style' name='radio-qual' type='radio'>";
                html += "<label data-name='" + data[i].Id + "' for='Q" + data[i].Id + "' class='radio-style-2-label radio-small'>" + data[i].Standing.trim() + "</label>";
                html += "</div>";
            }
            $("#selstanding").html(html);
            $("#selstanding input[type='radio']").click(function() {
                clearall('standing');
                rurl.length = 0;
                standingclicked();
            });
            if (rurl.length >= 2) {
                $("#selstanding > div > input[title='" + rurl[1] + "']").prop("checked", true);
                standingclicked();
            }
        });
    }
}

function standingclicked() {
    standing_id = $("#selstanding > div > input[type='radio']:checked").val();
    if (standing_id != undefined && standing_id != "") {
        var t = $("#selstanding > div > input[type='radio']:checked").attr('id');
        var typetext = $("#selstanding > div > label[for='" + t + "']").text();
        $("#qual > div[class='ps-content pb5']").text(typetext);
        $("#liqual > div[class='ps-content pb5']").text(typetext);
        $("#tickqual").removeClass('hide');
        getdiscipline(typetext, standing_id);
    }
}

function getdiscipline(value, id) {
    if (id != undefined) {
        discipline_id = id;
        $.get(path + "api/programsearch/GetInternationalDiscipline/" + id + "/" + filter, function(data) {
            if (data != null) {
                showwhich("discipline");
                var html = "<ul>";
                for (i = 0; i < data.length; i++) {
                    if (data[i].IsStream == "True") {
                        html += "<li style='cursor:pointer' title='" + data[i].Discipline.trim() + "' data-name='" + data[i].Id + "' class='col-sm-4 pa0 hastream' value='" + data[i].Id + "'>" + data[i].Discipline + "</li>";
                    } else {
                        html += "<li style='cursor:pointer' title='" + data[i].Discipline.trim() + "' data-name='" + data[i].Id + "' class='col-sm-4 pa0 nostream' value='" + data[i].Id + "'>" + data[i].Discipline + "</li>";
                    }
                }
                html += "</ul>";
                $("#seldiscipline").html(html);
                $("#seldiscipline li").click(function() {
                    clearall('discipline');
                    rurl.length = 0;
                    disciplineclicked($(this).text());
                });
                if (rurl.length >= 2) {
                    discipline_id = $("#seldiscipline > ul > li[title='" + rurl[2] + "']").attr('data-name');
                    if (discipline_id != undefined) {
                        disciplineclicked(rurl[2]);
                    }
                }
                slide('disciplinepanel');
            } else {
                no_stream = true;
            }
        });
    } else {
        $('.dropdown-inner').slideToggle("slow");
        slide();
    }
}

function disciplineclicked(discname) {
    if ($("#seldiscipline > ul > li[title='" + discname + "']").hasClass('hastream')) {
        $("#disc > div[class='ps-content pb5']").text(discname);
        $("#lidisc > div[class='ps-content pb5']").text(discname);
        discipline_id = $("#seldiscipline > ul > li[title='" + discname + "']").attr('data-name');
        getstream();
        $("#listream").removeClass('hide');
        $("#course").removeClass('hide');
        $("#tickdisc").removeClass('hide');
    } else if ($("#seldiscipline > ul > li[title='" + discname + "']").hasClass('nostream')) {
        $("#disc > div[class='ps-content pb5']").text(discname);
        $("#lidisc > div[class='ps-content pb5']").text(discname);
        discipline_id = $("#seldiscipline > ul > li[title='" + discname + "']").attr('data-name');
        getprogrammelist();
        $("#course").removeClass('hide');
        $("#listream").addClass('hide');
        $("#tickdisc").removeClass('hide');
    }
}

function getstream() {
    $.post(path + "api/programsearch/GetInternationalStream", {
        StandingId: standing_id,
        DisciplineId: discipline_id,
        Filter: filter
    }).done(function(data) {
        if (data != null) {
            showwhich('stream');
            var html = "",
                name = "";
            html += "<ul>";
            for (i = 0; i < data.length; i++) {
                name = data[i].Stream;
                name = name.trim();
                html += "<li style='cursor:pointer' title='" + name + "' data-name='" + data[i].Id + "' class='col-md-4 pa0'>" + name + "</li>";
            }
            html += "</ul>";
            $("#selstream").html(html);
            $("#selstream li").click(function() {
                clearall('stream');
                rurl.length = 0;
                streamclicked($(this).text());
            });
            if (rurl.length >= 3) {
                stream_id = $("#selstream > ul > li[title='" + rurl[3] + "']").attr('data-name');
                if (stream_id != undefined) {
                    streamclicked(rurl[3]);
                }
            }
        }
    });
}

function streamclicked(stream) {
    stream_id = $("#selstream > ul > li[title='" + stream + "']").attr('data-name');
    stream = $("#selstream > ul > li[title='" + stream + "']").attr('title');
    $("#stream > div[class='ps-content pb5']").text(stream);
    $("#listream > div[class='ps-content pb5']").text(stream);
    getprogrammelist();
    showwhich('course');
    $("#tickstream").removeClass('hide');
}




//Get Programme Outcomes
function getPS() {
    $.post(path + "api/programsearch/GetPSPSODetail", { AdmissionYear: "2018", OfficialCode: officialcode, POType: "PO" }).done(
        function (data)
        {
            if (data != null && data.length > 0)
            {
                programOutcomeExist = "YES";
                console.log('Programme Outcomes Exist');
                var h = '<div class="col-md-12 pa0 mt10">';
                h += '<h4 style="font-size:16px!important;font-weight:bold!important;margin-bottom:10px;">Programme Outcomes</h4>';
                h += '<ul class="pl20">';
                for (i = 0; i < data.length; i++) {
                    h += '<li>' + data[i].POrder + ' : <b>' + data[i].Heading + '</b> : ' + data[i].Outcome + '</li>';
                }
                h += '</ul>';
                h += '</div>';
                outcomesHTML += h;
            }
            else
            {
                programOutcomeExist = "NO";
                console.log('Programme Outcomes not Exist');
            }
            getPSO();
        });
}


//Get Programme Specific Outcomes
function getPSO() {
    var h = '';
    $.post(path + "api/programsearch/GetPSPSODetail", { AdmissionYear: "2018", OfficialCode: officialcode, POType: "PSO" }).done(
        function (data) {
            if (data != null && data.length > 0)
            {
                programSpecOutcomeExist = "YES";
                console.log("Programme Specific Outcomes Exist");
                h = '<div class="col-md-12 pa0 mt10">';
                h += '<h4 style="font-size:16px!important;font-weight:bold!important;margin-bottom:10px;">Programme Specific Outcomes</h4>';
                h += '<ul class="pl20">';
                for (i = 0; i < data.length; i++) {
                    h += '<li>' + data[i].POrder + ' : ' + data[i].Outcome + '</li>';
                }
                h += '</ul>';
                h += '</div>';
                outcomesHTML += h;
                $("#careerHeading").html('<i class="fa fa-bullseye" aria-hidden="true"></i>Programme Outcomes / Salient Features');
            }
            else
            {
                programSpecOutcomeExist = "NO";
                console.log("Programme Specific Outcomes not exist");
            }
            SetProgramOutcome();
            
        }
        
    );
    
}
function SetProgramOutcome()
{
    console.log(programOutcomeExist);
    console.log(programSpecOutcomeExist);
    if (programOutcomeExist == "YES" || programSpecOutcomeExist == "YES")
    {
        $("#tb1").parent().removeClass("is-active");// Make second tab inactive Web
        $("#tb1").attr('aria-selected', false); //Fade second tab title Web
        $("#progouttitle").parent().addClass("is-active"); //Make first tab active Web

        $("li[aria-controls='salient-features']").removeClass("is-active"); //Make second tab inactive Mobile
        $("li[aria-controls='progoutarea']").addClass("is-active");   //Make first tab active Mobile
        
        $("#progoutarea-label").text('Programme Outcomes'); //Set Title Mobile
        $("#progouttitle").text('Programme Outcomes');      //Set Title Web

        $("#progoutcontent").html(outcomesHTML); //Set Content

        $("#progoutarea-label").show(); //Show Title for Mobile
        $("#progouttitle").show(); //Show Title for Web

        $("#progoutarea").show(); //Show content Area
        $("#progoutcontent").show(); //Hide content Area

        //Set main heading at the top
        $("a[ddl='#ps-career-prospects']").html('<i class="fa fa-bullseye" aria-hidden="true"></i>Programme Outcomes');
    }
    else
    {
        //console.log($("#progouttitle").parent().hasClass("is-active"));
        //console.log($("#tb1").parent().hasClass("is-active"));

        $("#progouttitle").parent().removeClass("is-active");// Make first tab inactive Web
        $("#tb1").parent().addClass("is-active"); //Make second tab active Web

        $("li[aria-controls='progoutarea']").removeClass("is-active"); //Make first tab inactive mobile
        $("li[aria-controls='salient-features']").addClass("is-active");   //Make second tab active mobile

        $("#progoutarea-label").text('No Content Title Mob'); //Set Title Mobile
        $("#progouttitle").text('No Content Title Web');      //Set Title Web
        $("#progoutcontent").html('No content available');    //Set content if not there

        $("#progoutarea-label").hide(); //Hide Title for Mobile
        $("#progouttitle").hide(); //Hide Title for Web

        $("#progoutarea").hide(); //Hide content Area
        $("#progoutcontent").hide(); //Hide content Area

        //Show the second tab
        $("#salient-features").show();
        $("#salient-features").removeClass('hidden');

        //Set the main heading at the top
        $("a[ddl='#ps-career-prospects']").html('<i class="fa fa-bullseye" aria-hidden="true"></i>Career Prospects');
        
    }
}

$("#progouttitle").click(function () {
    console.log("Prog Title Clicked");
    $("#progoutarea").show();
    $("#salient-features").hide();
}
);
$("a[href='#salient-features']").click(function () {
    console.log("salient-features Clicked");
    $("#salient-features").show();
    $("#progoutarea").hide();

    $("li[aria-controls='salient-features']").addClass("is-active");
    $("#salient-features").removeClass('hidden');

    
});


$("#tbl1").click(function () {
    $("#salient-features").show();
});



function getprogrammelist() {
    $("#section-courses").hide();
    if (stream_id == undefined) {
        stream_id = 0;
    }
    $("#programs").html('');
    $.post(path + "api/programsearch/GetInternationalProgram", {
        StandingId: standing_id,
        DisciplineId: discipline_id,
        StreamId: stream_id,
        Filter: filter
    }).done(function(data) {
        if (data != null) {
            var count = data.length,
                cls = "";
            if (count <= 2)
                cls = "col-md-" + 12 / count;
            else
                cls = "col-md-4";
            showwhich('course');
            var html = "",
                html1 = "",
                prevparent = "";
            $.each(data, function(i, val) {
                if (i == 0 || (prevparent != data[i].ParentProgram.trim() && prevparent != "")) {
                    html += "<div class='clearfix pt10'></div>";
                    if (i != 0)
                        html += "<div style='height:10px;width: 95%;' class='divider ma10'></div>";
                    html += "<div class='phead'>" + data[i].ParentProgram + "</div>";
                    html1 += '<h4 class="hidden-sm mb10 font-weight300">' + data[i].ParentProgram + '</h4>';
                }
                prevparent = data[i].ParentProgram.trim();
                if (data[i].ParentProgram.trim() != "") {
                    html += "<div class='" + cls + " pcount'>";
                } else {
                    html += "<div class='" + cls + " pcount pl0'>";
                }
                html += "<input title='" + data[i].ProgramName.trim() + "' data-name='" + data[i].OfficialCode.trim() + "' id='r" + data[i].OfficialCode.trim() + "' class='radio-style' name='courses' type='radio'>";
                html += "<label data-name='" + data[i].ProgramName.trim() + "' for='r" + data[i].OfficialCode.trim() + "' class='radio-style-2-label radio-small'><span id='s" + data[i].OfficialCode.trim() + "'>" + data[i].ProgramName.trim() + "</span><br><span class='pduration' id='pd" + data[i].OfficialCode.trim() + "'>" + data[i].DegreeDuration + "</span></label>";
                html += "</div>";
                html1 += '<li><a class="plst" style="cursor:pointer" title="' + data[i].ProgramName.trim() + '" data-name="' + data[i].OfficialCode.trim() + '">' + data[i].ProgramName.trim() + '<span class="duration">Duration : ' + data[i].DegreeDuration + '</span></a></li>';
            });
            $("#programs").html(html);
            plist = html;
            $("#op-desktop").html(html1);
            $("#op-mobile").html(html1);
            $(".op-mobile").hide();
            $("#toggle_value").text($("#listream > div[class='ps-content pb5']").text());
            $(".plst").click(function() {
                var p = $(this).attr('title');
                var o = $(this).attr('data-name');
                programclicked(p, o);
                clearall('course');
            });
            $("#programs > div > input[type='radio']").click(function() {
                clearall('course');
                rurl.length = 0;
                var p = $(this).attr('title');
                var o = $(this).attr('data-name');
                programclicked(p, o);
            });
            if (rurl.length >= 4) {
                var p = $("#programs > div > input[title='" + rurl[4] + "']").attr('title');
                var o = $("#programs > div > input[title='" + rurl[4] + "']").attr('data-name');
                $("#programs > div > input[title='" + rurl[4] + "']").prop("checked", true);
                programclicked(p, o);
            }
        }
    });
}

function programclicked(p, o) {
    programname = p;
    officialcode = o;
    pagetab = "Details";
    $("#course > div[class='ps-content pb5']").text(programname);
    $("#licourse > div[class='ps-content pb5']").text(programname);
    getresult();
    $(".op-mobile").hide();
    $("#tickcourse").removeClass('hide');
}

function getactive(id, li_id) {
    showwhich('course');
    $(".disp").removeClass("active");
    $("#seldiscipline li").removeClass().addClass('col-sm-4');
    $(li_id).addClass("active");
    discipline_id = id;
    clearall('discipline');
    $("#streampanel").hide();
    $("#selecteddiscipline").html($(li_id).attr('title'));
    $("#search_button").show();
    getprogrammelist();
}

function getresult() {
    programOutcomeExist = "NO";
    programSpecOutcomeExist = "NO";
    outcomesHTML = "";
    $("#section-courses").show();
    $("#resultpanels .tabs-panel").removeClass("is-active");
    $("#Programme").removeClass('is-active');
    $("#section-courses").removeClass('hide');

    totaltabs = 0;
    if (!onlysearchbar) {
        if (stream_id == undefined)
            stream_id = 0;
        $(".ps-bar-details").hide();
        if (officialcode != undefined) {
            $.post(path + "api/programsearch/GetInternationalProgram", {
                StandingId: standing_id,
                DisciplineId: discipline_id,
                StreamId: stream_id,
                Filter: filter
            }).done(function(data) {
                if (data != null) {
                    for (n = 0; n < data.length; n++) {
                        if (data[n].OfficialCode.trim() == officialcode.trim()) {
                            var d = new Array();
                            d.push(data[n]);
                            data = d;
                        }
                    }
                    if (data.length == 0) {
                        $("#section-courses").hide();
                        $("#searchresult").hide();
                        return;
                    }
                    $("#ps-float-apply").show();
                    $("#section-courses").show();
                    $('.ps-slider').show(function() {
                        var x = $('.standard-logo').attr('data-dark-logo');
                        SEMICOLON.initialize.verticalMiddle();
                        $('head').append($('<link rel="stylesheet" type="text/css" />').attr('href', '//www.lpu.in/css/ps.css'));
                        $('#ps').addClass('ps');
                        var pWidth = $(window).width();
                        if (pWidth > 992) {
                            $('.standard-logo img').attr('src', x)
                        }
                    });
                    if (data.length == 0) {
                        $("#section-courses").hide();
                        $('.dropdown-inner').slideToggle("slow");
                        slide();
                        return false;
                    }

                    $("#Career").show();
                    $("#careerHeading").html("<i class='fa fa-bullseye' aria-hidden='true'></i> Career Prospects / Salient Features");
                    
                     //as per email by sugandha with subject Regarding Career Prospects/ Salient features on website
                     $("#features").removeClass('hidden');

                     getPS();


                    sethtmlforprogram(data);
                    showscheme();
                    isScholarship = data[0].IsScholarship50;
                    getscholarship(data);


                     //Career tab
                     getcareerprospects();
                    getsalientfeatures();

                     //Hide the salient features tab initially
                     $("#salient-features").hide();
                     $("#salient-features").addClass('hidden');

                    slide('divFind');
                    $("#year_scheme_button").addClass('active');
                    $("#searchresult").show();
                    geteligibility(data);
                    $("#course-filter > li").removeClass('active');
                    if (pagetab == "Details") {
                        $("a[ddl='#ps-details']").parent().addClass("active");
                    } else if (pagetab == "Fee") {
                        $("a[ddl='#ps-fee']").parent().addClass("active");
                    } else if (pagetab == "Scholarship") {
                        $("a[ddl='#ps-scholarships']").parent().addClass("active");
                    } else if (pagetab == "Features") {
                        $("a[ddl='#ps-career-prospects']").parent().addClass("active");
                    } else if (pagetab == "Apply") {
                        $("a[ddl='#ps-how-to-apply']").parent().addClass("active");
                    }
                    if (search_clicked) {
                        rurl.length = 0;
                    }
                   
                    hideshowdetails(data);
                    $("#licourse").attr('aria-expanded', false);
                    $("#licourse").attr('aria-selected', false);
                    $("#licourse").removeClass('is-active');
                    $("#Programme").removeClass('is-active');
                    $("#Programme").attr('aria-hidden', true);
                    $("#Programme").hide();
                    $("a[href='#Programme']").attr('aria-expanded', false);
                    $("a[href='#Programme']").attr('aria-selected', false);
                    $("#op-mobile").show();
                    var response = {};
                    var stateObj = {};
                    response.pageTitle = "India's Largest Best Private University in Punjab - LPU | " + programname;
                    var ma = window.document.URL;
                    if (data.length > 0) {
                        if (ma.indexOf('/international/programmes') != -1 && data.length > 0) {
                            if (data[0].ProgramUrlonWeb != null && data[0].ProgramUrlonWeb != undefined) {
                                if (ma.indexOf('www.lpu.in') != -1 || ma.indexOf('www.lpu.in') != -1) {
                                    curl = '/international/programmes' + data[0].ProgramUrlonWeb;
                                } else if (ma.indexOf('172.17.60.93') != -1) {
                                    curl = '/lpu2016/newlpu/international/programmes' + data[0].ProgramUrlonWeb;
                                } else if (ma.indexOf('172.17.60.100') != -1) {
                                    curl = '/international/programmes' + data[0].ProgramUrlonWeb;
                                }
                            }
                        } else if (ma.indexOf('\international\programmes') != -1 && data.length > 0) {
                            if (data[0].ProgramUrlonWeb != null && data[0].ProgramUrlonWeb != undefined) {
                                if (ma.indexOf('www.lpu.in') != -1 || ma.indexOf('www.lpu.in') != -1) {
                                    curl = '\international\programmes' + data[0].ProgramUrlonWeb;
                                } else if (ma.indexOf('172.17.60.93') != -1) {
                                    curl = '\lpu2016\newlpu\international\programmes' + data[0].ProgramUrlonWeb;
                                } else if (ma.indexOf('172.17.60.100') != -1) {
                                    curl = '\international\programmes' + data[0].ProgramUrlonWeb;
                                }
                            }
                        }
                    }
                    processAjaxData(response, stateObj, curl);
                } else {
                    $("#section-courses").hide();
                    $("#searchresult").hide();
                }
            });
        } else {
            $("#section-courses").hide();
            $("#searchresult").hide();
        }
    } else {
        $.post(path + "api/programsearch/GetInternationalProgramDetail", {
            "OfficialCode": officialcode
        }).done(function(data) {
            var url = "";
            url += window.location.protocol + "//" + window.document.domain + "/international/programmes";
            url += data[0].ProgramUrlonWeb;
            window.location.href = url;
        });
    }
}
$(".cdetail").click(function() {
    $("#course-filter > li").removeClass('active');
    $(this).parent().addClass('active');
});

function sethtmlforprogram(data) {
	
    if (data != null) {
        if (data.length > 0) {
            totaltabs++;
            program_id = data[0].ProgramId;
            if (data[0].MetaTitle != null && data[0].MetaTitle != undefined) {
                document.title = data[0].MetaTitle;
            }
            if (data[0].metadesc != null && data[0].metadesc != undefined) {
                $("#metadesc").attr('content', data[0].metadesc);
            }
            $("#schoolname").text(data[0].BannerHeading);
            $("#schooltagline").text(data[0].tagLine);
            programname = data[0].ProgramName;
            $("#program_interested").val(programname);
            officialcode = data[0].OfficialCode;
            applynowlink = data[0].ApplyNow;
            $("#pname").html(programname + '<span class="duration">Duration : ' + data[0].DegreeDuration);
            $("#pdesc").html(data[0].ProgramDesc);
            $("#peligibility").html(data[0].indianeligibilitycomments);
            $("#peligibilityadmission").html(data[0].admissionindian);
			//-- Rishma added below code 06/07/2023 start ---
			
			$("#dv_CUET_RibbonNote").html('');
			$("#dv_CUET_RibbonNote").html(data[0].CUETRibbonNote);
			//-- Rishma added below code  06/07/2023 end ---
			
            $("#slider").css('background-image', "url('" + data[0].PageHeaderImage + "')");
            if (data[0].IsACBSP == "True" || data[0].IsACBSP == 1) {
                $("#div_acbsp").show();
                $("#pdesc").addClass("col-md-11 pa0");
            } else {
                $("#div_acbsp").hide();
                $("#pdesc").removeClass("col-md-11 pa0");
            }
            $("#degree_year > li").addClass('hide');
            for (i = 1; i <= data[0].DegreeYear; i++) {
                $("#year" + i + "-label").parent().removeClass('hide');
            }
            $("#degree_year > li > a").click(function() {
                var i = $(this).attr('data-name');
                getyearlycourses(officialcode, i);
            });
            showscheme();
            $("#select > ul > li > a").click(function() {
                var tab = $(this).attr('data-name');
                getelectivecourses(tab);
            });
			
            if (data[0].IsApply == true || data[0].IsApply == "True") {
                $("a[ddl='#ps-how-to-apply']").removeClass("hide");
                gethowtoapply();
            } else {
                $("#Apply").addClass('hide');
                $("a[ddl='#ps-how-to-apply']").addClass("hide");
            }
            if (programname.indexOf('B.Tech') == -1) {
                $(".radio_others").click();
            } else {
                $(".radio_btech").click();
            }
            setDefaultTab();
            changedynamicurl();
            $("#pdesc").html(data[0].ProgramDesc);
            if (data[0].OfficialCode != 'P570-NN1-D' && data[0].OfficialCode != 'P570-NN2-D' && data[0].OfficialCode != 'P570-NN9-D' && data[0].OfficialCode != 'P6F1-NM' && data[0].OfficialCode != 'P6A1' && data[0].OfficialCode != 'P6A1-NN1') {}
            geteligibility(data);
            programfeescholarship();
            getscholarship(data);
            hideshowdetails(data);
        }
    }
}
//-----------------function () for career prospects tab---------------------------------
function getsalientfeatures() {
    var html = "";
    $("#FeaturesData").html('');

    html += "<h4 style='font-size:16px!important;font-weight:bold!important'>Salient Features</h4>";
    $.get(path + "api/programsearch/GetProgramSalientFeature/" + officialcode, function (data) {
        if (data != null) {

            totaltabs++;
            // New features
            html += '<div class="col-md-12 pa0 mt10">';
            for (i = 0; i < data.length; i++) {
                html += '<h4 class="mb5">' + data[i].Heading + '</h4>';
                html += '<ul>' + data[i].Description + '</li></ul>';
            }
            html += '</div>';

            //Setting the tab variable to Features so that the new url created can be updated
            pagetab = "Features";
            changedynamicurl();
            $("#FeaturesData").html(html);
            $("#features").removeClass('hidden');

            
            $("#Career").hide();
            $("#careerHeading").html("<i class='fa fa-bullseye' aria-hidden='true'></i> Salient Features");
            $("#tb1").html("<i class='fa fa-bullseye' aria-hidden='true'></i> Salient Features");
            $("#tb1").show();
            //if ($("#programspecificoutcomes").html() == '' && $("#programoutcomes").html() == '') {
            //    $("#salient-features").removeClass('hidden');
            //}
        }
    });

}
//---------------------------------------end of function getsalientfeatures()------------------------------------------------------------------

//--------------------------------------get career prospects-----------------------------------------------------------------------------------
function getcareerprospects() {
    var html = "";
    $("#Career").html("");
    html += "<h4 style='font-size:16px!important;font-weight:bold!important'>Career Prospects</h4>";
    $.get(path + "api/programsearch/GetProgramCarrierObjective/" + officialcode, function (data) {
        if (data != null) {
            html += '<div class="col-sm-12 pa0 mt10">';
            for (i = 0; i < data.length; i++) {
                html += '<h4>' + data[i].Heading + '</h4>';
                html += '<p>' + data[i].Description + '</p>';
            }
            html += '</div>';
            $("#Career").html(html);
        }
        //Setting the tab variable to Career so that the new url created can be updated
        pagetab = "Features";
        changedynamicurl();


        //set the toggles
        $('#careerprossalient.mtoggle .toggle .togglet').click(function () {
            if ($(this).hasClass('togglet')) {
                $(".togglet").each(function () {
                    $(this).removeClass('toggleta');
                });
                $(this).addClass('toggleta');
                $('.togglec').not($(this).next('.togglec')).hide();
                $(this).next('.togglec').toggle();
            }
        });
        $('#careerprossalient.mtoggle .toggle .togglet').click(function () {
            $('.togglec').not($(this).next('.togglec')).hide();
        });

        if (isMobile) {
            //$("#salient-features").addClass("is-active");
            //$( "#features" ).accordion({ active: 0 });
            $("#careerprossalient").tabs({ active: 0 });
        }

    });
}
//--------------------------------------------end of career prospects--------------------------------------------------------------------------

// function getsalientfeatures() {
//     var html = "";
//     $("#FeaturesData").html('');
//     $.get(path + "api/programsearch/GetProgramSalientFeature/" + officialcode, function(data) {
//         if (data != null) {
//             html += '<div class="col-md-12 pa0 mt10">';
//             for (i = 0; i < data.length; i++) {
//                 html += '<h4 class="mb5">' + data[i].Heading + '</h4>';
//                 html += '<ul>' + data[i].Description + '</li></ul>';
//             }
//             html += '</div>';
//             pagetab = "Features";
//             changedynamicurl();
//             $("#FeaturesData").html(html);
//         }
//     });
// }
var step = 1;

function gethowtoapply() {
    $.post(path + "api/programsearch/GetInternationalHowToApply", {
        OfficialCode: officialcode
    }).done(function(data) {
        if (data != null) {
            totaltabs++;
				
            var h = "";
            h += '<div id="processTabs">';
            var cl = "";
            if (data.length - 1 == 3)
                cl = "col-md-4 pa0 ma0";
            else if (data.length - 1 == 4)
                cl = "col-md-3 pa0 ma0";
            else if (data.length - 1 == 5)
                cl = "col-md-2 pa0 ma0";
            h += '<ul class="process-steps process-5 bottommargin clearfix">';
            for (i = 0; i < data.length - 1; i++) {
                h += '<li>';
                h += '<a href="#ptab' + (i + 1) + '" class="i-circled i-bordered i-alt divcenter"><i class="fa fa-check" aria-hidden="true"></i></a>';
                h += '<h5>Step ' + (i + 1) + '<br/>' + data[i].StepName + '</h5>';
                h += '</li>';
            }
            h += '</ul>';
            h += '<div class="col-md-12 pa0 text-right">';
            h += "<a id='Launchh' target='_blank' href='" + applynowlink + "' class='applynow'>Apply Now <i class='fa fa-caret-right'></i></a>";
            h += '</div>';
            h += "<div class='apply_content'>";
            for (i = 0; i < data.length - 1; i++) {
                h += "<div id='ptab" + (i + 1) + "' aria-labelledby='ui-id-" + (i + 1) + "' class='ui-tabs-panel ui-widget-content ui-corner-bottom' role='tabpanel' aria-expanded='" + ((i == 0) ? "true" : "false") + "' aria-hidden='" + ((i == 0) ? "false" : "true") + "'>";
                h += data[i].StepHtml;
                if (i == data.length - 2) {
                    h += '<div class="col-md-12 pl0 pt25">' + data[data.length - 1].StepHtml + '</div>';
                }
                if (i > 0)
                    h += '<a href="#" class="tab-linker fleft" rel="' + (i) + '"><i class="fa fa-caret-left" aria-hidden="true"></i> Back</a>';
                if (i < data.length - 2)
                    h += '<a href="#" class="fright tab-linker" rel="' + (i + 2) + '">Next <i class="fa fa-caret-right" aria-hidden="true"></i></a>';
                h += "</div>";
            }
            h += "</div>";
            h += "</div>";
            $("#Apply").html(h);
            initsteps();
            pagetab = "Apply";
            changedynamicurl();
        }
    });
}

function initsteps() {
    $("#processTabs").tabs({
        show: {
            effect: "fade",
            duration: 400
        }
    });
    $(".tab-linker").click(function() {
        $("#processTabs").tabs("option", "active", $(this).attr('rel') - 1);
        return false;
    });
}

function changedynamicurl() {}

function geteligibility(data) {
    $(".eligibilityindian").html(data[0].eligibilityindian);
    $(".indianeligibilitycomments").html((data[0].indianeligibilitycomments == null || data[0].indianeligibilitycomments == "") ? "" : data[0].indianeligibilitycomments);
    $(".eligibilityinternational").html((data[0].indianeligibilitycomments == null || data[0].indianeligibilitycomments == "") ? "" : data[0].eligibilityinternational);
    $(".admissionindian").html(data[0].admissionindian);
    $(".EntranceTestName").html(data[0].EntranceTestName);
}

function setlpunestscholarship(data) {
    if ((data[0].openfeetab == 0 && data[0].isphase4 == 1) || (data[0].openfeetab == 0 && data[0].isphase4 == 0)) {
        $("#lpunestph1").addClass('is-active');
        $("#lpunestph1 > a").html(data[0].p1t);
        $("#lpunestph1 > a").attr('aria-selected', true);
    } else {
        $("#lpunestph1").removeClass('is-active');
        $("#lpunestph1 > a").attr('aria-selected', false);
    }
    if ((data[0].openfeetab == 1 && data[0].isphase4 == 1)) {
        $("#lpunestph4").addClass('is-active');
        $("#lpunestph4 > a").html(data[0].p4t);
        $("#lpunestph4 > a").attr('aria-selected', true);
    } else {
        $("#lpunestph4").removeClass('is-active');
        $("#lpunestph4 > a").attr('aria-selected', false);
    }
    if ((data[0].openfeetab == 2 && data[0].isphase4 == 1) || (data[0].openfeetab == 1 && data[0].isphase4 == 0)) {
        $("#lpunestph2").addClass('is-active');
        $("#lpunestph2 > a").html(data[0].p2t);
        $("#lpunestph2 > a").attr('aria-selected', true);
    } else {
        $("#lpunestph2").removeClass('is-active');
        $("#lpunestph2 > a").attr('aria-selected', false);
    }
    if ((data[0].openfeetab == 3 && data[0].isphase4 == 1) || (data[0].openfeetab == 2 && data[0].isphase4 == 0)) {
        $("#lpunestph3").addClass('is-active');
        $("#lpunestph2 > a").html(data[0].p3t);
        $("#lpunestph3 > a").attr('aria-selected', true);
    } else {
        $("#lpunestph3").removeClass('is-active');
        $("#lpunestph3 > a").attr('aria-selected', false);
    }
    $("#lpunestp981").html(data[0].p981);
    $("#lpunestp901").html(data[0].p901);
    $("#lpunestp801").html(data[0].p801);
    $("#lpunestp701").html(data[0].p701);
    if (data[0].isphase4 == 1) {
        $("#lpunestph4").removeClass('hide');
        $("#lpunestpanel2").removeClass('hide');
        $("#lpunestp984").html(data[0].p984);
        $("#lpunestp904").html(data[0].p904);
        $("#lpunestp804").html(data[0].p804);
        $("#lpunestp704").html(data[0].p704);
    } else {
        $("#lpunestph4").addClass('hide');
        $("#lpunestpanel4").addClass('hide');
    }
    if (data[0].isphase2 == 1) {
        $("#lpunestph2").removeClass('hide');
        $("#lpunestpanel3").removeClass('hide');
        $("#lpunestp982").html(data[0].p982);
        $("#lpunestp902").html(data[0].p902);
        $("#lpunestp802").html(data[0].p802);
        $("#lpunestp702").html(data[0].p702);
    } else {
        $("#lpunestph2").addClass('hide');
        $("#lpunestpanel3").removeClass('hide');
    }
    if (data[0].isphase3 == 1) {
        $("#lpunestph3").removeClass('hide');
        $("#lpunestpanel4").removeClass('hide');
        $("#lpunestp983").html(data[0].p983);
        $("#lpunestp903").html(data[0].p903);
        $("#lpunestp803").html(data[0].p803);
        $("#lpunestp703").html(data[0].p703);
    } else {
        $("#lpunestph3").addClass('hide');
        $("#lpunestpanel4").removeClass('hide');
    }
}

function setqescholarship(data) {
    $(".scholarship_qualification").html(data[0].scholarship_qualification);
    if (data[0].scholarship_qualification == "10th") {
        $(".is10th").removeClass('hide');
    } else {
        $(".is10th").addClass('hide');
    }
    if ((data[0].openfeetab == 0 && data[0].isphase4 == 1) || (data[0].openfeetab == 0 && data[0].isphase4 == 0)) {
        $("#qeph1").addClass('is-active');
        $("#qeph1 > a").html(data[0].p1t);
        $("#qeph1 > a").attr('aria-selected', true);
    } else {
        $("#qeph1").removeClass('is-active');
        $("#qeph1 > a").attr('aria-selected', false);
    }
    if ((data[0].openfeetab == 1 && data[0].isphase4 == 1)) {
        $("#qeph4").addClass('is-active');
        $("#qeph4 > a").html(data[0].p4t);
        $("#qeph4 > a").attr('aria-selected', true);
    } else {
        $("#qeph4").removeClass('is-active');
        $("#qeph4 > a").attr('aria-selected', false);
    }
    if ((data[0].openfeetab == 2 && data[0].isphase4 == 1) || (data[0].openfeetab == 1 && data[0].isphase4 == 0)) {
        $("#qeph2").addClass('is-active');
        $("#qeph2 > a").html(data[0].p2t);
        $("#qeph2 > a").attr('aria-selected', true);
    } else {
        $("#qeph2").removeClass('is-active');
        $("#qeph2 > a").attr('aria-selected', false);
    }
    if ((data[0].openfeetab == 3 && data[0].isphase4 == 1) || (data[0].openfeetab == 2 && data[0].isphase4 == 0)) {
        $("#qeph3").addClass('is-active');
        $("#qeph2 > a").html(data[0].p3t);
        $("#qeph3 > a").attr('aria-selected', true);
    } else {
        $("#qeph3").removeClass('is-active');
        $("#qeph3 > a").attr('aria-selected', false);
    }
    $("#qep981").html(data[0].p981);
    $("#qep901").html(data[0].p901);
    $("#qep801").html(data[0].p801);
    $("#qep701").html(data[0].p701);
    if (data[0].isphase4 == 1) {
        $("#qeph4").removeClass('hide');
        $("#qepanel2").removeClass('hide');
        $("#qep984").html(data[0].p984);
        $("#qep904").html(data[0].p904);
        $("#qep804").html(data[0].p804);
        $("#qep704").html(data[0].p704);
    } else {
        $("#qeph4").addClass('hide');
        $("#qepanel4").addClass('hide');
    }
    if (data[0].isphase2 == 1) {
        $("#qeph2").removeClass('hide');
        $("#qepanel3").removeClass('hide');
        $("#qep982").html(data[0].p982);
        $("#qep902").html(data[0].p902);
        $("#qep802").html(data[0].p802);
        $("#qep702").html(data[0].p702);
    } else {
        $("#qeph2").addClass('hide');
        $("#qepanel3").removeClass('hide');
    }
    if (data[0].isphase3 == 1) {
        $("#qeph3").removeClass('hide');
        $("#qepanel4").removeClass('hide');
        $("#qep983").html(data[0].p983);
        $("#qep903").html(data[0].p903);
        $("#qep803").html(data[0].p803);
        $("#qep703").html(data[0].p703);
    } else {
        $("#qeph3").addClass('hide');
        $("#qepanel4").removeClass('hide');
    }
}

function setdtestcriteriascholarship(data) {
    if ((data[0].openfeetab == 0 && data[0].isphase4 == 1) || (data[0].openfeetab == 0 && data[0].isphase4 == 0)) {
        $("#testcriteriaph1").addClass('is-active');
        $("#testcriteriaph1 > a").html(data[0].p1t);
        $("#testcriteriaph1 > a").attr('aria-selected', true);
    } else {
        $("#testcriteriaph1").removeClass('is-active');
        $("#testcriteriaph1 > a").attr('aria-selected', false);
    }
    if ((data[0].openfeetab == 1 && data[0].isphase4 == 1)) {
        $("#testcriteriaph4").addClass('is-active');
        $("#testcriteriaph4 > a").html(data[0].p4t);
        $("#testcriteriaph4 > a").attr('aria-selected', true);
    } else {
        $("#testcriteriaph4").removeClass('is-active');
        $("#testcriteriaph4 > a").attr('aria-selected', false);
    }
    if ((data[0].openfeetab == 2 && data[0].isphase4 == 1) || (data[0].openfeetab == 1 && data[0].isphase4 == 0)) {
        $("#testcriteriaph2").addClass('is-active');
        $("#testcriteriaph2 > a").html(data[0].p2t);
        $("#testcriteriaph2 > a").attr('aria-selected', true);
    } else {
        $("#testcriteriaph2").removeClass('is-active');
        $("#testcriteriaph2 > a").attr('aria-selected', false);
    }
    if ((data[0].openfeetab == 3 && data[0].isphase4 == 1) || (data[0].openfeetab == 2 && data[0].isphase4 == 0)) {
        $("#testcriteriaph3").addClass('is-active');
        $("#testcriteriaph2 > a").html(data[0].p3t);
        $("#testcriteriaph3 > a").attr('aria-selected', true);
    } else {
        $("#testcriteriaph3").removeClass('is-active');
        $("#testcriteriaph3 > a").attr('aria-selected', false);
    }
    $(".testtype").html(data[0].testtype);
    $(".above98").html(data[0].above98);
    $(".above90").html(data[0].above90);
    $(".above80").html(data[0].above80);
    $(".above70").html(data[0].above70);
    $("#testcriteriap981").html(data[0].p981);
    $("#testcriteriap901").html(data[0].p901);
    $("#testcriteriap801").html(data[0].p801);
    $("#testcriteriap701").html(data[0].p701);
    if (data[0].isphase4 == 1) {
        $("#testcriteriaph4").removeClass('hide');
        $("#testcriteriapanel2").removeClass('hide');
        $("#testcriteriap984").html(data[0].p984);
        $("#testcriteriap904").html(data[0].p904);
        $("#testcriteriap804").html(data[0].p804);
        $("#testcriteriap704").html(data[0].p704);
    } else {
        $("#testcriteriaph4").addClass('hide');
        $("#testcriteriapanel4").addClass('hide');
    }
    if (data[0].isphase2 == 1) {
        $("#testcriteriaph2").removeClass('hide');
        $("#testcriteriapanel3").removeClass('hide');
        $("#testcriteriap982").html(data[0].p982);
        $("#testcriteriap902").html(data[0].p902);
        $("#testcriteriap802").html(data[0].p802);
        $("#testcriteriap702").html(data[0].p702);
    } else {
        $("#testcriteriaph2").addClass('hide');
        $("#testcriteriapanel3").removeClass('hide');
    }
    if (data[0].isphase3 == 1) {
        $("#testcriteriaph3").removeClass('hide');
        $("#testcriteriapanel4").removeClass('hide');
        $("#testcriteriap983").html(data[0].p983);
        $("#testcriteriap903").html(data[0].p903);
        $("#testcriteriap803").html(data[0].p803);
        $("#testcriteriap703").html(data[0].p703);
    } else {
        $("#testcriteriaph3").addClass('hide');
        $("#testcriteriapanel4").removeClass('hide');
    }
}

function setdmbascholarship(data) {
    if ((data[0].openfeetab == 0 && data[0].isphase4 == 1) || (data[0].openfeetab == 0 && data[0].isphase4 == 0)) {
        $("#mbaph1").addClass('is-active');
        $("#mbaph1 > a").html(data[0].p1t);
        $("#mbaph1 > a").attr('aria-selected', true);
    } else {
        $("#mbaph1").removeClass('is-active');
        $("#mbaph1 > a").attr('aria-selected', false);
    }
    if ((data[0].openfeetab == 1 && data[0].isphase4 == 1)) {
        $("#mbaph4").addClass('is-active');
        $("#mbaph4 > a").html(data[0].p4t);
        $("#mbaph4 > a").attr('aria-selected', true);
    } else {
        $("#mbaph4").removeClass('is-active');
        $("#mbaph4 > a").attr('aria-selected', false);
    }
    if ((data[0].openfeetab == 2 && data[0].isphase4 == 1) || (data[0].openfeetab == 1 && data[0].isphase4 == 0)) {
        $("#mbaph2").addClass('is-active');
        $("#mbaph2 > a").html(data[0].p2t);
        $("#mbaph2 > a").attr('aria-selected', true);
    } else {
        $("#mbaph2").removeClass('is-active');
        $("#mbaph2 > a").attr('aria-selected', false);
    }
    if ((data[0].openfeetab == 3 && data[0].isphase4 == 1) || (data[0].openfeetab == 2 && data[0].isphase4 == 0)) {
        $("#mbaph3").addClass('is-active');
        $("#mbaph2 > a").html(data[0].p3t);
        $("#mbaph3 > a").attr('aria-selected', true);
    } else {
        $("#mbaph3").removeClass('is-active');
        $("#mbaph3 > a").attr('aria-selected', false);
    }
    $(".TestType2").html(data[0].testtype);
    $(".mbaabove98").html(data[0].above98);
    $(".mbaabove90").html(data[0].above90);
    $(".mbaabove80").html(data[0].above80);
    $(".mbaabove70").html(data[0].above70);
    $("#mbap981").html(data[0].p981);
    $("#mbap901").html(data[0].p901);
    $("#mbap801").html(data[0].p801);
    $("#mbap701").html(data[0].p701);
    if (data[0].isphase4 == 1) {
        $("#mbaph4").removeClass('hide');
        $("#mbapanel2").removeClass('hide');
        $("#mbap984").html(data[0].p984);
        $("#mbap904").html(data[0].p904);
        $("#mbap804").html(data[0].p804);
        $("#mbap704").html(data[0].p704);
    } else {
        $("#mbaph4").addClass('hide');
        $("#mbapanel4").addClass('hide');
    }
    if (data[0].isphase2 == 1) {
        $("#mbaph2").removeClass('hide');
        $("#mbapanel3").removeClass('hide');
        $("#mbap982").html(data[0].p982);
        $("#mbap902").html(data[0].p902);
        $("#mbap802").html(data[0].p802);
        $("#mbap702").html(data[0].p702);
    } else {
        $("#mbaph2").addClass('hide');
        $("#mbapanel3").removeClass('hide');
    }
    if (data[0].isphase3 == 1) {
        $("#mbaph3").removeClass('hide');
        $("#mbapanel4").removeClass('hide');
        $("#mbap983").html(data[0].p983);
        $("#mbap903").html(data[0].p903);
        $("#mbap803").html(data[0].p803);
        $("#mbap703").html(data[0].p703);
    } else {
        $("#mbaph3").addClass('hide');
        $("#mbapanel4").removeClass('hide');
    }
}

function getscholarship(data) {
    totaltabs++;
    var h = '';
    h += '<h4>LPU SCHOLARSHIP UPTO '  + data[0].InternationalScholarship + '% </h4>';
    h += '<p>AT LPU we understand to remain the Best University, we need to attract the Best Students around the globe. Every year top international students of highest calibre and with outstanding achievements get LPU SCHOLARSHIPS on tuition fee for complete duration of the regular programme. <br/><br/>Follow the link and know the maximum scholarship you may get: - <a target="_blank" href="http://www.lpu.in/international/scholarship.php">http://www.lpu.in/international/scholarship.php</a></p>';
    $("#scholarship_content").html(h);
}

function hideshowdetails(data) {
    if (data[0].Spl == 0 && data[0].Free == 0 && data[0].Hons == 0 && data[0].Minor == 0 && data[0].Core == 0) {
        $("#curr").hide();
        $("#divelectiveoff").hide();
    } else {
        $("#curr").show();
        $("#divelectiveoff").show();
    }
    if (data[0].Spl == 0 && data[0].Free == 0 && data[0].Hons == 0 && data[0].Minor == 0) {
        $("#divelectiveoff").hide();
        $("#electivebtn").hide();
    } else {
        $("#divelectiveoff").show();
        $("#electivebtn").show();
    }
    var e = "",
        t = "";
    if (data[0].Spl > 0) {
        $("#spcialization_button").parent().removeClass('hide');
        $("#tab_spcialization_button").removeClass('hide');
        if (e == "")
            e = "li_spcialization_button";
        if (t == "")
            t = "spe";
    } else {
        $("#spcialization_button").parent().addClass('hide');
        $("#tab_spcialization_button").addClass('hide');
    }
    if (data[0].Hons > 0) {
        $("#honours_button").parent().removeClass('hide');
        $("#tab_honours_button").removeClass('hide');
        if (e == "")
            e = "li_honours_button";
        if (t == "")
            t = "honours";
    } else {
        $("#honours_button").parent().addClass('hide');
        $("#tab_honours_button").addClass('hide');
    }
    if (data[0].Minor > 0) {
        $("#minor_button").parent().removeClass('hide');
        $("#tab_minor_button").removeClass('hide');
        if (e == "")
            e = "li_minor_button";
        if (t == "")
            t = "minor";
    } else {
        $("#minor_button").parent().addClass('hide');
        $("#tab_minor_button").addClass('hide');
    }
    if (data[0].Free > 0) {
        $("#free_button").parent().removeClass('hide');
        $("#tab_free_button").removeClass('hide');
        if (e == "")
            e = "li_free_button";
        if (t == "")
            t = "minor";
    } else {
        $("#free_button").parent().addClass('hide');
        $("#tab_free_button").addClass('hide');
    }
    $("#" + e).addClass('active');
    getelectivecourses(t);
    if (data[0].Salient > 0) {
        $("#tabNav li a[href='#Features']").show();
    } else {
        $("#tabNav li a[href='#Features']").hide();
    }
    if (data[0].Carrer > 0) {
        $("a[ddl='#ps-career-prospects']").removeClass('hide');
        $("#ps-career-prospects").removeClass('hide');
    } else {
        $("a[ddl='#ps-career-prospects']").addClass('hide');
        $("#ps-career-prospects").addClass('hide');
    }
    if (data[0].Core > 0) {
        $("#semesterbuttons").show();
        $("#schemebtn").show();
    } else {
        $("#semesterbuttons").hide();
        $("#schemebtn").hide();
    }
    if (data[0].Core > 0) {
        $("#semesterbuttons").show();
    } else {
        $("#semesterbuttons").hide();
    }
    if (data[0].IsApply == "True") {
        $("#tabNav li a[href='#Apply']").show();
        $("#apply_now").show();
    } else {
        $("#tabNav li a[href='#Apply']").hide();
        $("#apply_now").hide();
    }
}

function getelectivecourses(type) {
    //
    var html = "",
        url = "";
    if (type == "honours") {
        url = path + "api/programsearch/GetProgramHounsCourse/" + officialcode+ "/" + CurriculumSkipped;
    } else if (type == "elective") {
        url = path + "api/programsearch/GetProgramElectiveCourse/" + officialcode+ "/" + CurriculumSkipped;
    } else if (type == "spe") {
        url = path + "api/programsearch/GetProgramSpecialCourse/" + officialcode+ "/" + CurriculumSkipped;
    } else if (type == "minor") {
        url = path + "api/programsearch/GetProgramMinorCourse/" + officialcode+ "/" + CurriculumSkipped;
    }
    if (type != "" && type != undefined) {
        $.get(url, function(data) {
            generateelectives(data, type);
        });
    }
}

function generateelectives(data, type) {
    $("#electivecourse").html("");
    $("#elect > ul > li").removeClass('is-active');
    var pid = $("#elect > ul > li > a[data-name=" + type + "]").attr('href');
    $("#elect > ul > li > a[data-name=" + type + "]").parent().addClass('is-active');
    if (data != null) {
        if (data.length > 0) {
            var h = "";
            var c = "";
            var s = data[0].AreaName,
                n = false;
            h += '<div class="col-md-12 pa0">';
            for (i = 0; i < data.length; i++) {
                if (i == 0) {
                    h += '<div class="col-md-12 pl0 pb20 note" id="msgtop"></div>';
                    h += '<div class="col-md-6">';
                    h += '<h4>' + data[i].AreaName + '</h4>';
                } else {
                    if (data[i].AreaName != data[i - 1].AreaName) {
                        h += '</div>';
                        if (i == 4) {
                            c = "right";
                        } else {
                            if (c == "right") {
                                h += '<div class="clearfix"></div>';
                                c = "left";
                            } else {
                                c = "right";
                            }
                        }
                        h += '<div class="col-md-6">';
                        h += '<h4>' + data[i].AreaName + '</h4>';
                    }
                }
                h += '<div class="toggle toggle-border">';
                h += '<div class="togglet">';
                h += '<div>' + data[i].CourseName + "</div>";
                h += '<i class="toggle-closed fa fa-chevron-down"></i>';
                h += '<i class="toggle-open fa fa-chevron-up" aria-hidden="true"></i>';
                h += '</div>';
                h += '<div class="togglec" style="display: none;">';
                h += data[i].CourseDesc;
                h += '</div>';
                h += '</div>';
                n = false;
            }
            h += '</div>';
            $("#electivecourses .tabs-panel").removeClass('is-active');
            $(pid).html(h);
            $(pid).addClass('is-active');
            if (type == 'minor') {
                $("#msgtop").show();
                $("#msgtop").html('Note: Four Courses contributes towards a minor elective area.');
                $("#msgapply").html('Note: This is University wide exhaustive list of minors that may be offered in a particular area. The minors are subject to change from time to time.Offering of a minor elective area is subject to filling of minimum number of seats in that minor area as prescribed by the University.');
            } else {
                $("#msgtop").html('');
                $("#msgtop").hide();
                $("#msgapply").html('');
            }
            $('#elect.mtoggle .toggle .togglet').click(function() {
                if ($(this).hasClass('togglet')) {
                    $(".togglet").each(function() {
                        $(this).removeClass('toggleta');
                    });
                    $(this).addClass('toggleta');
                    $('.togglec').not($(this).next('.togglec')).hide();
                    $(this).next('.togglec').toggle();
                }
            });
            $('#elect.mtoggle .toggle .togglet').click(function() {
                $('.togglec').not($(this).next('.togglec')).hide();
            });
        }
    }
}

function setDefaultTab() {
    if (rurl.length > 4) {
        $("#tabNav li a[href='#" + rurl[5] + "']").click();
        $("#tabNav li a[href='#" + rurl[5] + "']").parent().removeClass().addClass('ui-tabs-active ui-state-active');
    } else {
        $("#tabNav li a[href='#" + pagetab + "']").click();
        $("#tabNav li a[href='#" + pagetab + "']").parent().removeClass().addClass('ui-tabs-active ui-state-active');
    }
    $("#year_scheme_button").addClass('active');
    $("#elective_offered_button").removeClass('active');
    showscheme();
}

function showscheme() {
    $("#year_scheme_button").addClass('active');
    $("#elective_offered_button").removeClass('active');
    $("#div_yearly").show();
    $("#div_scheme").show();
    getyearlycourses(officialcode, 1);
    $("#y1").addClass("is-active");
}

function getyearlycourses(officialcode, year) {
    $.post(path + "api/programsearch/GetProgramCourseYearly", {
        OfficialCode: officialcode,
        DegreeYear: year
    }).done(function(data) {
        if (data != null) {
            $("#msgtop").html('');
            $("#msgapply").html('');
            generatecourses(data, year);
        }
    });
}

function generatecourses(data, year) {
    if (data != null && data.length > 0) {
        var h = "";
        var s = data[0].Semester,
            n = false;
        for (i = 0; i < data.length; i++) {
            if (i == 0) {
                h += '<div class="col-md-6">';
                h += '<h4 class="mt30">' + ((data[i].Semester % 2 == 0) ? "Spring Term" : "Autumn Term") + "</h4>";
                h += '<p>' + ((data[i].Semester % 2 == 0) ? "Spring Term is the second/even semester of an academic session/year." : "Autumn Term is the first/odd semester of an academic session/year.") + '</p>';
            }
            if (i > 0) {
                if (data[i].Semester != data[i - 1].Semester) {
                    h += '</div>';
                    h += '<div class="col-md-6">';
                    h += '<h4 class="mt30">' + ((data[i].Semester % 2 == 0) ? "Spring Term" : "Autumn Term") + "</h4>";
                    h += '<p>' + ((data[i].Semester % 2 == 0) ? "Spring Term is the second/even semester of an academic session/year." : "Autumn Term is the first/odd semester of an academic session/year.") + '</p>';
                    n = true;
                }
            }
            h += '<div class="toggle toggle-border">';
            h += '<div class="togglet">';
            h += '<div>' + data[i].CourseName + "</div>";
            h += '<i class="toggle-closed fa fa-chevron-down"></i>';
            h += '<i class="toggle-open fa fa-chevron-up" aria-hidden="true"></i>';
            h += '</div>';
            h += '<div class="togglec" style="display: none;">';
            h += data[i].CourseDesc;
            h += '</div>';
            h += '</div>';
            n = false;
        }
        h += '</div>';
        $("#corecourse .tabs-panel").removeClass('is-active');
        $("#year" + year).html(h);
        $("#year" + year).addClass('is-active');
        $('#curr.mtoggle .toggle .togglet').click(function() {
            if ($(this).hasClass('togglet')) {
                $(".togglet").each(function() {
                    $(this).removeClass('toggleta');
                });
                $(this).addClass('toggleta');
                $('.togglec').not($(this).next('.togglec')).hide();
                $(this).next('.togglec').toggle();
            }
        });
        $('#curr.mtoggle .toggle .togglet').click(function() {
            $('.togglec').not($(this).next('.togglec')).hide();
        });
        $("#msgapply").html('Note: The Curriculum is subject to changes and/or review as and when prescribed by the University');
    }
}

function programfeescholarship() {
    $.post(path + "api/programsearch/GetProgramFeeDetail", {
        OfficialCode: officialcode
    }).done(function(data) {
        totaltabs++;
        // var h1 = '<div class="col-lg-12 col-md-12 pa0 col-sm-12" id="internationaltutionfeepanel"> \
					  // <h4>Programme Fee (for International applicants Except Sri Lanka, Bhutan, Nepal and Bangladesh)<hr class="ma10 ml0 mr0"></h4> \
					  // <div class="col-lg-12 col-md-12 col-sm-12 pa0  mt15 mb15 clearfix"> \
					    // <div class="col-lg-6 col-md-6 col-sm-6 pa0 fees-heading"> Tuition Fee </div> \
					    // <div class="col-lg-6 col-md-6 col-sm-6 pa0"><div class="col-lg-6 col-md-6 col-sm-6 pa0 pull-left"> \
					      // ("internationaltutionfee") </div></div> \
					  // </div> \
					// </div> \
					// <div class="col-lg-12 col-md-12 pa0 col-sm-12" id="internationaltutionfeeSplPanel"> \
					  // <h4>Programme Fee (for International applicants from Sri Lanka, Bhutan, Nepal \
					    // and Bangladesh)<hr class="ma10 ml0 mr0"></h4> \
					  // <div class="col-lg-12 col-md-12 col-sm-12 pa0  mt15 mb15 clearfix"> \
					    // <div class="col-lg-6 col-md-6 col-sm-6 pa0 fees-heading"> Tuition Fee </div> \
					    // <div class="col-lg-6 col-md-6 col-sm-6 pa0"><div class="col-lg-6 col-md-6 col-sm-6 pa0 pull-left"> \
					      // <span class="rupee">`</span>("internationalfee_Srl_npl_etc") (Per Semester) </div></div> \
					  // </div> \
					// </div>';
					
		//-- Rishma modified Fee table design as per requirements SRS 14/07/2023 ---
		var h1='<div class="col-lg-12 col-md-12 pa0 col-sm-12"> \
					<div class="table-responsive">\
						<table class="table table-bordered">\
							<tr>\
								<th colspan="2">Fee (for International applicants Except Sri Lanka, Bhutan, Nepal and Bangladesh)</th>\
							</tr>\
							<tr>\
								<th>Programme Fee</th>\
								<td>("internationaltutionfee")</td>\
							</tr>\
							<tr>\
								<th>Exam Fee</td>\
								<td>("InternationalExamFeePhase1")</td>\
							</tr>\
							<tr>\
								<th colspan="2">Fee (for International applicants from Sri Lanka, Bhutan, Nepal and Bangladesh)</th>\
							</tr>\
							<tr>\
								<th>Programme Fee</th>\
								<td>("internationalfee_Srl_npl_etc")</td>\
							</tr>\
							<tr>\
								<th>Exam Fee</th>\
								<td>("InternationalExamFeeSRLNPLPhase1")</td>\
							</tr>\
						</table>\
					</div>\
				</div>\
				 <div class="col-md-12 mt30 pa0 fee-ul"> \
					 <h4>Fee details and Allied Issues</h4> \
					 <ul class="internationalfeecomments arrow-list"> \
					 </ul> \
					 <h4 class="mobile-marg">Modes of Payment</h4> \
					 <ol class="Intmodeofpayment lower-roman"> \
					 </ol> \
					 <div class="Highlights mobile-marg"> \
						 <h4>Requisites and Highlights</h4> \
						 <span class="requisites"></span> \
					 </div> \
				 </div>';
				
		var _tutionFee=	data[0].internationaltutionfee.includes("(Per Semester)")? data[0].internationaltutionfee : data[0].internationaltutionfee.concat(" (Per Semester)");
		var _tutionFee_Srl_npl_etc=	data[0].internationalfee_Srl_npl_etc.includes("(Per Semester)")?data[0].internationalfee_Srl_npl_etc:data[0].internationalfee_Srl_npl_etc.concat(" (Per Semester)"); 
		var _examFeePhase1=	data[0].InternationalExamFeePhase1.includes("(Per Semester)")?data[0].InternationalExamFeePhase1:data[0].InternationalExamFeePhase1.concat(" (Per Semester)"); 
		var _examFeePhase1_Srl_npl_etc=	data[0].InternationalExamFeeSRLNPLPhase1.includes("(Per Semester)")?data[0].InternationalExamFeeSRLNPLPhase1:data[0].InternationalExamFeeSRLNPLPhase1.concat(" (Per Semester)"); 		
        h1 = h1.replace('("internationaltutionfee")', _tutionFee);
        h1 = h1.replace('("internationalfee_Srl_npl_etc")', _tutionFee_Srl_npl_etc);
		h1=h1.replace('("InternationalExamFeePhase1")',_examFeePhase1);	
		h1=h1.replace('("InternationalExamFeeSRLNPLPhase1")',_examFeePhase1_Srl_npl_etc);		
        $('#test').html(h1);
		//-- Rishma modified below code to bind Exam fee dynamically 06/07/2023 --
		// var h2='<div class="col-lg-12 col-md-12 col-sm-12 pa0  mt15 mb15 clearfix"> \
					    // <div class="col-lg-6 col-md-6 col-sm-6 pa0 fees-heading"> Exam Fee </div> \
					    // <div class="col-lg-6 col-md-6 col-sm-6 pa0"><div class="col-lg-6 col-md-6 col-sm-6 pa0 pull-left"> \
					      // ("InternationalExamFeePhase1") (Per Semester) </div></div> \
					  // </div>';
		// h2=h2.replace('("InternationalExamFeePhase1")',data[0].InternationalExamFeePhase1);			  
		// $("#internationaltutionfeepanel").append(h2);
		// //-- Rishma modified below code to bind Exam fee dynamically 06/07/2023 --
		// var h3='<div class="col-lg-12 col-md-12 col-sm-12 pa0  mt15 mb15 clearfix"> \
					    // <div class="col-lg-6 col-md-6 col-sm-6 pa0 fees-heading"> Exam Fee </div> \
					    // <div class="col-lg-6 col-md-6 col-sm-6 pa0"><div class="col-lg-6 col-md-6 col-sm-6 pa0 pull-left"> \
					      // <span class="rupee">`</span>("InternationalExamFeeSRLNPLPhase1") (Per Semester) </div></div> \
					  // </div> \
                      // <div class="col-md-12 mt30 pa0 fee-ul"> \
						// <h4>Fee details and Allied Issues</h4> \
						// <ul class="internationalfeecomments arrow-list"> \
						// </ul> \
						// <h4 class="mobile-marg">Modes of Payment</h4> \
						// <ol class="Intmodeofpayment lower-roman"> \
						// </ol> \
						// <div class="Highlights mobile-marg"> \
						// <h4>Requisites and Highlights</h4> \
						// <span class="requisites"></span> \
						// </div> \
						// </div>';
         // h3=h3.replace('("InternationalExamFeeSRLNPLPhase1")',data[0].InternationalExamFeeSRLNPLPhase1);	      
		// $("#internationaltutionfeeSplPanel").append(h3);

          //Fee Details and Allied
          $(".internationalfeecomments").html(data[0].InternationalFeeComments);

          //Modes of payment
          $(".Intmodeofpayment").html(data[0].InternationalModeOfPayment);

          //Requisites & Highlights
          $(".requisites").html(data[0].InternationalRequisites);     
    });
}

function hideshowfee(data) {
    (data[0].above95ph1 == null) ? $("#above95").hide(): $("#above95").show();
    (data[0].above90_phase1 == null) ? $("#above90").hide(): $("#above90").show();
    (data[0].above80_phase1 == null) ? $("#above80").hide(): $("#above80").show();
    (data[0].above70_phase1 == null) ? $("#above70").hide(): $("#above70").show();
    (data[0].Below70validNSTscore_phase1 == null) ? $("#below70").hide(): $("#below70").show();
    (data[0].above95ph4 == null) ? $("#above95_4").hide(): $("#above95_4").show();
    (data[0].above90_phase4 == null) ? $("#above90_4").hide(): $("#above90_4").show();
    (data[0].above80_phase4 == null) ? $("#above80_4").hide(): $("#above80_4").show();
    (data[0].above70_phase4 == null) ? $("#above70_4").hide(): $("#above70_4").show();
    (data[0].Below70validNSTscore_phase4 == null) ? $("#below70_4").hide(): $("#below70_4").show();
    (data[0].above95ph2 == null) ? $("#Tr9").hide(): $("#Tr9").show();
    (data[0].above90_phase2 == null) ? $("#Tr1").hide(): $("#Tr1").show();
    (data[0].above80_phase2 == null) ? $("#Tr2").hide(): $("#Tr2").show();
    (data[0].above70_phase2 == null) ? $("#Tr3").hide(): $("#Tr3").show();
    (data[0].Below70validNSTscore_phase2 == null) ? $("#Tr4").hide(): $("#Tr4").show();
    (data[0].above95ph3 == null) ? $("#Tr10").hide(): $("#Tr10").show();
    (data[0].above90_phase3 == null) ? $("#Tr5").hide(): $("#Tr5").show();
    (data[0].above80_phase3 == null) ? $("#Tr6").hide(): $("#Tr6").show();
    (data[0].above70_phase3 == null) ? $("#Tr7").hide(): $("#Tr7").show();
    (data[0].Below70validNSTscore_phase3 == null) ? $("#Tr8").hide(): $("#Tr8").show();
    (data[0].isPhase2 == false) ? $("#ph2").hide(): $("#ph2").show();
    (data[0].isPhase2 == false) ? $("#Table1").hide(): $("#Table1").show();
    (data[0].IsNestTestApplicable == false) ? $("#td4").hide(): $("#td4").show();
    (data[0].IsNestTestApplicable == false) ? $("#t5").hide(): $("#t5").show();
    (data[0].isPhase3 == false) ? $("#ph3").hide(): $("#ph3").show();
    (data[0].isPhase3 == false) ? $("#Table2").hide(): $("#Table2").show();
    (data[0].indianexaminationfee == null) ? $("#indianexaminationfeepanel").hide(): $("#indianexaminationfeepanel").show();
    (data[0].internationaltutionfee == null) ? $("#internationaltutionfeepanel").hide(): $("#internationaltutionfeepanel").show();
    (data[0].internationalEDBDollar == null) ? $("#edb").hide(): $("#edb").show();
    (data[0].internationalEDBDollar == null) ? $("#edb1").hide(): $("#edb1").show();
    (data[0].internationalfee_Srl_npl_etc == null) ? $("#internationaltutionfeeSplPanel").hide(): $("#internationaltutionfeeSplPanel").show();
    (data[0].internationalEDBSPL == null) ? $("#edbspl").hide(): $("#edbspl").show();
    (data[0].internationalEDBSPL == null) ? $("#edbspl1").hide(): $("#edbspl1").show();
    (data[0].IsEntranceTestApplicable == null || data[0].IsEntranceTestApplicable == false) ? $(".EligibilityTest").hide(): $(".EligibilityTest").show();
    (data[0].Requisites == null) ? $(".Highlights").hide(): $(".Highlights").show();
    (data[0].Comment == null) ? $(".CommentPanel").hide(): $(".CommentPanel").show();
    (data[0].eligibilityindian == null) ? $(".eligibilityindian").hide(): $(".eligibilityindian").show();
    (data[0].isACBSP == true) ? $("#lblEligibilityIndian").addClass('eligibility-content'): "";
    (data[0].eligibilityindian == null || data[0].eligibilityindian == "") ? $(".indianeligibilitycomments").hide(): $(".indianeligibilitycomments").show();
    (data[0].eligibilityinternational == null || data[0].eligibilityinternational == "") ? $(".eligibilityinternational").hide(): $(".eligibilityinternational").show();
    if (data[0].IsEDB == true) {
        $("#EdbText").html(data[0].EDBText);
        $("#EdbText").show();
    } else {
        $("#EdbText").html('');
        $("#EdbText").hide();
    }
    $("#EdbText").hide();
    if (data[0].indiantutionfee_Phase1 == null) {
        $("#scholarship").css("display", "none");
        $("#tutionfee_phase1").html('As per Association');
    } else {
        $("#scholarship").css("display", "block");
        $("#tutionfee_phase1").show();
    }
    if (data[0].indiantutionfee_Phase2 == null) {
        $("#Table1").css("display", "none");
        $("#tutionfee_phase2").html('As per Association');
    } else {
        $("#Table1").css("display", "block");
        $("#tutionfee_phase2").show();
    }
    if (data[0].indiantutionfee_Phase3 == null) {
        $("#Table2").css("display", "none");
        $("#tutionfee_phase3").html('As per Association');
    } else {
        $("#Table2").css("display", "block");
        $("#tutionfee_phase3").show();
    }
    if (data[0].indiantutionfee_Phase4 == null) {
        $("#scholarship_4").css("display", "none");
        $("#tutionfee_phase4").html('As per Association');
    } else {
        $("#scholarship_4").css("display", "block");
        $("#tutionfee_phase4").show();
    }
    if (data[0].isScholarship == false || data[0].isScholarship == 0 || data[0].isScholarship == "False") {
        $("#scholarship").css("display", "none");
        $(".notefee").css("display", "none");
        $("#Fees").append("(per semester)");
    } else {
        $("#scholarship").css("display", "block");
        if (programname.indexOf("Ph.D.") != -1 || programname.indexOf("M.Phil.") != -1) {
            $(".notefee").css("display", "none");
        } else {
            $(".notefee").css("display", "block");
        }
    }
    $("#FeeTab li").removeClass();
    if (data[0].isPhase4) {
        if (data[0].OpenFEETab == "1") {
            $("#ph4").addClass("active");
            $("#phase4").addClass("in active");
            hidetab('phase4');
        } else {
            $("#ph" + parseInt((data[0].OpenFEETab))).addClass("active");
            $("#phase" + parseInt((data[0].OpenFEETab))).addClass("in active");
            hidetab('phase' + parseInt((data[0].OpenFEETab)));
        }
    } else {
        $("#ph" + parseInt((data[0].OpenFEETab) + 1)).addClass("active");
        $("#phase" + parseInt((data[0].OpenFEETab) + 1)).addClass("in active");
        hidetab('phase' + parseInt((data[0].OpenFEETab) + 1));
    }
}

function hidetab(el) {
    $("#phase1").addClass("hide");
    $("#phase2").addClass("hide");
    $("#phase3").addClass("hide");
    $("#phase4").addClass("hide");
    $("#phase5").addClass("hide");
    $("#" + el).removeClass("hide");
}

function clearall(sel) {
    if (sel == "standing") {
        discipline_id = 0;
        $("a[id='lidisc'] > div[class='ps-content pb5']").html('Select Discipline');
        $("#disc > div[class='ps-content pb5']").html('Select Discipline');
        $("#seldiscipline").html('');
        stream_id = 0;
        $("a[id='listream'] > div[class='ps-content pb5']").html('Select Stream');
        $("#stream > div[class='ps-content pb5']").html('Select Stream');
        $('#selectedstreams').html('');
        officialcode = "";
        programme = "";
        program_id = 0;
        $("a[id='licourse'] > div[class='ps-content pb5']").html('Select Course');
        $("#course > div[class='ps-content pb5']").html('Select Course');
        $("#programs").html('');
        $("#lidisc").removeClass('ps-text').removeClass('ps-text2').addClass('ps-text1');
        $("#listream").removeClass('ps-text1').removeClass('ps-text2').addClass('ps-text');
        $("#licourse").removeClass('ps-text1').removeClass('ps-text2').addClass('ps-text');
        $("#tickqual").addClass('hide');
        $("#tickdisc").addClass('hide');
        $("#tickstream").addClass('hide');
        $("#tickcourse").addClass('hide');
    } else if (sel == "type") {
        standing_id = 0;
        $("#selstanding").html('');
        $("a[id='liqual'] > div[class='ps-content pb5']").html('Select Qualification');
        $("#qual > div[class='ps-content']").html('Select Qualification');
        discipline_id = 0;
        $("#seldiscipline").html('');
        $("a[id='lidisc'] > div[class='ps-content pb5']").html('Select Discipline');
        $("#disc > div[class='ps-content']").html('Select Discipline');
        $("#disciplinepanel").hide();
        stream_id = 0;
        $("a[id='listream'] > div[class='ps-content pb5']").html('Select Stream');
        $("#stream > div[class='ps-content pb5']").html('Select Stream');
        $('#selectedstreams').html('');
        officialcode = "";
        programme = "";
        program_id = 0;
        $("a[id='licourse'] > div[class='ps-content pb5']").html('Select Course');
        $("#course > div[class='ps-content pb5']").html('Select Course');
        $("#programs").html('');
        $("#liqual").removeClass('ps-text').removeClass('ps-text2').addClass('ps-text1');
        $("#lidisc").removeClass('ps-text1').removeClass('ps-text2').addClass('ps-text');
        $("#listream").removeClass('ps-text1').removeClass('ps-text2').addClass('ps-text');
        $("#licourse").removeClass('ps-text1').removeClass('ps-text2').addClass('ps-text');
        $("#ticktype").addClass('hide');
        $("#tickqual").addClass('hide');
        $("#tickdisc").addClass('hide');
        $("#tickstream").addClass('hide');
        $("#tickcourse").addClass('hide');
    } else if (sel == "discipline") {
        stream_id = 0;
        $("a[id='listream'] > div[class='ps-content pb5']").html('Select Stream');
        $("#stream > div[class='ps-content pb5']").html('Select Stream');
        $('#selectedstreams').html('');
        program_id = 0;
        $("a[id='licourse'] > div[class='ps-content pb5']").html('Select Course');
        $("#course > div[class='ps-content pb5']").html('Select Course');
        $("#programs").html('');
        $("#listream").removeClass('ps-text').removeClass('ps-text2').addClass('ps-text1');
        $("#licourse").removeClass('ps-text1').removeClass('ps-text2').addClass('ps-text');
        $("#tickdisc").addClass('hide');
        $("#tickstream").addClass('hide');
        $("#tickcourse").addClass('hide');
    } else if (sel == "stream") {
        program_id = 0;
        $("a[id='licourse'] > div[class='ps-content pb5']").html('Select Course');
        $("#course > div[class='ps-content pb5']").html('Select Course');
        $("#programs").html('');
        $("#licourse").removeClass('ps-text').removeClass('ps-text2').addClass('ps-text1');
        $("#tickstream").addClass('hide');
        $("#tickcourse").addClass('hide');
    } else if (sel == "course") {} else if (sel == undefined || sel == "") {
        standing_id = 0;
        discipline_id = 0;
        stream_id = 0;
        $('#selectedstreams').html('');
        $('#searchresult').hide();
    }
}

function processAjaxData(response, stateObj, urlPath) {
    if (urlPath != "" && urlPath != undefined) {
        window.history.pushState(null, response.pageTitle, curl);
    }
}
$(document).ready(function() {
    $('.dropdown-show').click(function() {
        $('.dropdown-inner').slideToggle("fast");
    });
    mobileResponsive();
    gettype();
    spliturl();
});
$(window).resize(function() {
    mobileResponsive();
});

function mobileResponsive() {
    var width = $(window).width();
    var height = $(window).height();
    if (width <= 768) {
        isMobile = true;
    } else {
        isMobile = false;
    }
}
$('#exampleInputAmount').keypress(function(event) {
    var keycode = (event.keyCode ? event.keyCode : event.which);
    if (keycode == '13') {
        event.preventDefault();
        SearchByText();
    }
});

function escapeHtml(text) {
    return text.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;").replace(/'/g, "&#039;");
}

function SearchByText() {
    var key = escapeHtml($("#exampleInputAmount").val());
    if (key.trim() != "") {
        $("#SearchTextResultArea").removeClass("hidden");
        $("#SearchingFor").html(" for <b>" + key + "</b> ");
        $.post(path + "api/programsearch/SearchByKeyword", {
            Key: key,
            IsInternational: true
        }).done(function(data) {
            if (data.length == 0) {
                $("#SearchResultText").html("<h2 class='text-center'>Sorry! No Result Found</h2>");
                return;
            }
            var count = data.length,
                cls = "",
                html = "",
                prevparent = "";
            if (count <= 2)
                cls = "col-md-" + 12 / count;
            else
                cls = "col-md-6";
            $.each(data, function(i, val) {
                if (i == 0 || (prevparent != data[i].Qualification.trim() && prevparent != "")) {
                    html += "<div class='clearfix pt10'></div>";
                    if (i != 0)
                        html += "<div style='height:10px;width: 95%;' class='divider ma10'></div>";
                    html += "<div class='phead'>After " + data[i].Qualification + "</div>";
                }
                prevparent = data[i].Qualification.trim();
                if (data[i].Qualification.trim() != "") {
                    html += "<div class='" + cls + " pcount'>";
                } else {
                    html += "<div class='" + cls + " pcount pl0'>";
                }
                html += "<input data-value='" + data[i].ProgramUrlonWeb.trim() + "' title='" + data[i].ProgramName.trim() + "' data-name='" + data[i].OfficialCode.trim() + "' id='r" + data[i].OfficialCode.trim() + "' class='radio-style' name='courses' type='radio'>";
                html += "<label data-name='" + data[i].ProgramName.trim() + "' for='r" + data[i].OfficialCode.trim() + "' class='radio-style-2-label radio-small'><span id='s" + data[i].OfficialCode.trim() + "'>" + data[i].ProgramName.trim() + "</span><br><span class='pduration' id='pd" + data[i].OfficialCode.trim() + "'>" + data[i].Duration + "</span></label>";
                html += "</div>";
            });
            $("#SearchResultText").html(html);
            $("#SearchResultText .pcount").click(function() {
                var el = $(this).children("input");
                clearall('course');
                rurl.length = 0;
                var p = $(el).attr('title');
                var o = $(el).attr('data-name');
                var u = $(el).attr('data-value');
                $.get(path + "api/programsearch/GetPerameterfromInternationalUrl?url=" + u).done(function(data) {
                    if (data != null && data.length > 0) {
                        filter = "All";
                        officialcode = data[0].OfficialCode;
                        programname = data[0].ProgramName.trim();
                        program_id = data[0].ProgramId;
                        standing_id = data[0].StandingId;
                        qualname = data[0].Qualification;
                        discipline_id = data[0].DisciplineId;
                        discname = data[0].Discipline;
                        stream_id = data[0].StreamId;
                        streamname = data[0].Stream;
                        rurl[0] = filter;
                        rurl[1] = qualname.trim();
                        rurl[2] = discname.trim();
                        if (streamname != "" && streamname != null)
                            rurl[3] = streamname.trim();
                        rurl[4] = programname.trim();
                        rurl[5] = "Details";
                        pagetab = "Details";
                        $("#seltype input[title='" + filter + "']").prop('checked', true);
                        typeclicked();
                        $("#selstanding > div > input[title='" + qualname + "']").prop('checked', true);
                        if (streamname != "") {
                            $("#stream > div[class='ps-content pb5']").text(streamname);
                        }
                        getresult();
                        $("#fpnew li:nth-child(1)").addClass("is-active");
                        $("#fp-btn1").addClass("is-active");
                        $("#fp-btn1").css('display', 'block');
                        $("#fp-btn1").removeAttr('aria-hidden');
                        $("#fpnew li:nth-child(2)").removeClass("is-active");
                        $("#fp-btn2").removeClass("is-active");
                        $("#fp-btn2").css('display', 'none');
                        $("#fp-btn2").attr('aria-hidden', true);
                        $("#SearchTextResultArea").addClass("hidden");
                        $("#SearchResultText").html("");
                        $("#exampleInputAmount").val("");
                        $("#SearchingFor").html("");
                    }
                });
            });
        });
    }
}