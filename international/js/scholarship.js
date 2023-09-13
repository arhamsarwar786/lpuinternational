
$(document).ready(function () {
	//get current page href without parameters
	//page_address = window.location.protocol + "//" + window.location.hostname + (window.location.port ? ':' + window.location.port : '') + window.location.pathname;
	func_FillCountryDDl();

});

function func_FillCountryDDl() {
	var path = "//services.lpu.in/api/ProgramSearch";
	//var path ="http://localhost:64383/api/ProgramSearch";
	$.get(path + "/CountryDDl", function (data) {
		if (data.d == undefined) {
			//leave empty
		} else {
			data = data.d;
		}
		//got some data
		if (data[0].Country !== "-1") {
			$('#country option').remove();
			$("#country").append($("<option></option>").val("").html("Select a Country"));
			for (var i = 0; i < data.length; i++) {
				$("#country").append($("<option></option>").val(data[i].CountryCode).html(data[i].CountryName));
			}

		} else {

		}
	});



}


function func_ScholarCountry(country) {
	$.blockUI();
	var path = "//services.lpu.in/api/ProgramSearch";
	//var path ="http://localhost:64383/api/ProgramSearch";
	var data_json = {
		Country: country
	};
	$.post(path + "/ScholarshipCountrys", data_json)
		.done(function (data) {
			$.unblockUI();
			if (data.d == undefined) {
				//leave empty
			} else {
				data = data.d;
			}
			//got some data
			if (data != null) {
				func_ScholarHtmlBind(data);
				func_FillScholarCountry(data);
			}
		});
}


function fun_InsertScholarshipDetails() {
	var path = "//services.lpu.in/api/ProgramSearch";
	//var path ="http://localhost:64383/api/ProgramSearch";
	var data_json = {
		Name: $('#name').val(),
		Email: $('#emailid').val(),
		Phone: $('#phone').val(),
		Program: $('#progname').val(),
		Country: $('#country option:selected').val(),
		CountryName: $('#country option:selected').text()
	};

	$.post(path + "/ScholarshipDetail", data_json)
		.done(function (data) {
			$.unblockUI();
			$("#scholardetailsForm")[0].reset();
			if (data.d == undefined) {
				//leave empty
			} else {
				data = data.d;
			}
			//got some data
			if (data[0].Status === true) {
				alert("Scholarship Details saved successfully");
				func_ScholarCountry(data[0].Country);
			} else {
				alert("You have already applied for country " + data[0].Country);
				func_ScholarCountry(data[0].Country);
			}
		})
		.fail(function (xhr, status, error) {
			// error handling
			$.unblockUI();
			alert("Error occured, please try again");
		});


}

function func_ScholarHtmlBind(data) {
	'use strict';
	var scholarlist = data.schlist;

	var t = $('#tablesDivNew');
	t.html('');

	if (scholarlist !== null) {

		var tbl = '<div class="panel-group" id="accordion">';


		tbl += '<div class="panel panel-default">';
		tbl += '<div class="panel-heading">';
		tbl += '<h4 class="panel-title">';
		tbl += '<a data-toggle="collapse" style="display:block;" data-parent="#accordion" href="#collapse_1">';
		tbl += '<span id="panel1header">panel1</span></a></h4></div>';
		tbl += '<div id="collapse_1" class="panel-collapse collapse in">';
		tbl += '<div class="panel-body" id="pbody_1" >';

		tbl += '<table  class="table table-striped table-bordered text-center" cellspacing="0"';
		tbl += 'cellpadding="0" border="0">';
		tbl += '<thead><tr><th class="text-center">Scholarship (on tuition fee per semester)</th><th class="text-center">Scholarship '; tbl += 'eligibility requirements</th>';
		tbl += '</tr></thead><tbody id="tbody_1"></tbody></table>';
		tbl += '<h5 class="mb0"># Last date to apply with scholarship <span';
		tbl += ' id="ScholarshipDate1"></span></h5>';
		tbl += '</div></div></div>';
		tbl += '<div class="panel panel-default">';
		tbl += '<div class="panel-heading">';
		tbl += '<h4 class="panel-title">';
		tbl += '<a data-toggle="collapse" style="display:block;" data-parent="#accordion" href="#collapse_2">';
		tbl += '<span id="panel2header">panel2</span></a></h4></div>';
		tbl += '<div id="collapse_2" class="panel-collapse collapse">';
		tbl += '<div class="panel-body" id="pbody_2" >';
		tbl += '<h5 class="bold">Scholarship opportunities for admission in ';
		tbl += '<span id="table2header"></span></h5>';
		tbl += '<table class="table table-striped table-bordered text-center" cellspacing="0"';
		tbl += 'cellpadding="0" border="0">';
		tbl += '<thead><tr><th class="text-center">Scholarship (on tuition fee per semester)</th><th class="text-center">Scholarship ';
		tbl += 'eligibility requirements</th>';
		tbl += '</tr></thead><tbody id="tbody_2"></tbody></table>';
		tbl += '<h5 class="mb0"># Last date to apply with scholarship <span';
		tbl += ' id="ScholarshipDate2"></span></h5>';
		tbl += '<div id="table2bhutan" style="display:none;">';
		tbl += '<h5 class="bold" >Scholarship opportunities for admission in ';
		tbl += '<span id="table6header"></span></h5>';
		tbl += '<table class="table table-striped table-bordered text-center" cellspacing="0"';
		tbl += 'cellpadding="0" border="0">';
		tbl += '<thead><tr><th class="text-center">Scholarship (on tuition fee per semester)</th><th class="text-center">Scholarship '; tbl += 'eligibility requirements</th>';
		tbl += '</tr></thead><tbody id="tbody_6"></tbody></table>';
		tbl += '<h5 class="mb0"># Last date to apply with scholarship <span';
		tbl += ' id="ScholarshipDate6"></span></h5>';
		tbl += '</div>';
		tbl += '</div></div></div>';
		tbl += '<div class="panel panel-default">';
		tbl += '<div class="panel-heading">';
		tbl += '<h4 class="panel-title">';
		tbl += '<a data-toggle="collapse" style="display:block;" data-parent="#accordion" href="#collapse_3">';
		tbl += '<span id="panel3header">panel3</span></a></h4></div>';
		tbl += '<div id="collapse_3" class="panel-collapse collapse">';
		tbl += '<div class="panel-body" id="pbody_3" >';

		tbl += '<table class="table table-striped table-bordered text-center" cellspacing="0"';
		tbl += 'cellpadding="0" border="0">';
		tbl += '<thead><tr><th class="text-center">Scholarship (on tuition fee per semester)</th><th class="text-center">Scholarship ';
		tbl += 'eligibility requirements</th>';
		tbl += '</tr></thead><tbody id="tbody_3"></tbody></table>';
		tbl += '<h5 class="mb0"># Last date to apply with scholarship <span';
		tbl += ' id="ScholarshipDate3"></span></h5>';
		tbl += '</div></div></div>';
		tbl += '<div class="panel panel-default">';
		tbl += '<div class="panel-heading">';
		tbl += '<h4 class="panel-title">';
		tbl += '<a data-toggle="collapse" style="display:block;" data-parent="#accordion" href="#collapse_4">';
		tbl += '<span id="panel4header">panel4</span></a></h4></div>';
		tbl += '<div id="collapse_4" class="panel-collapse collapse">';
		tbl += '<div class="panel-body" id="pbody_4" >';

		tbl += '<table class="table table-striped table-bordered text-center" cellspacing="0"';
		tbl += 'cellpadding="0" border="0">';
		tbl += '<thead><tr><th class="text-center">Scholarship Category</th><th class="text-center">70% Scholarship ( on tuition fee per semester)</th><th class="text-center">50% Scholarship ( on tuition fee per semester)</th>';
		tbl += '<th class="text-center">30% Scholarship ( on tuition fee per semester)</th>';
		tbl += '</tr></thead><tbody id="tbody_pp1"></tbody></table>';
		tbl += '<h5 class="mb0"># Last date to apply with scholarship <span';
		tbl += ' id="ScholarshipDate4"></span></h5>';
		tbl += '</div></div></div>';
		tbl += '<div class="panel panel-default">';
		tbl += '<div class="panel-heading">';
		tbl += '<h4 class="panel-title">';
		tbl += '<a data-toggle="collapse" style="display:block;" data-parent="#accordion" href="#collapse_5">';
		tbl += '<span id="panel5header">panel5</span></a></h4></div>';
		tbl += '<div id="collapse_5" class="panel-collapse collapse">';
		tbl += '<div class="panel-body" id="pbody_5" >';

		tbl += '<table class="table table-striped table-bordered text-center" cellspacing="0"';
		tbl += 'cellpadding="0" border="0">';
		tbl += '<thead><tr><th class="text-center">Scholarship Category</th><th class="text-center">90% Scholarship ( on tuition fee per semester)</th><th class="text-center">70% Scholarship ( on tuition fee per semester)</th>';
		tbl += '<th class="text-center">50% Scholarship ( on tuition fee per semester)</th>';
		tbl += '</tr></thead><tbody id="tbody_pf1"></tbody></table>';
		tbl += '<h5 class="mb0"># Last date to apply with scholarship <span';
		tbl += ' id="ScholarshipDate5"></span></h5>';
		tbl += '</div></div></div>';


		var tbl_h = $(tbl);
		t.append(tbl_h);
		var diii = '</div>';
		t.append(diii);
	}




	$('#ScholarCountryDivNew').css('display', 'block');
	$('#applyyDiv').css('display', 'block');
	$('#scholardetailsForm input[type=text]').val("");
}
function func_FillScholarCountry(data) {

	'use strict';
	var scholarlist = data.schlist;
	var phdparttime = data.phdparttime;
	var phdfulltime = data.phdfulltime;
	var t1 = $('#tbody_1');
	var t2 = $('#tbody_2');
	var t3 = $('#tbody_3');
	var t4 = $('#tbody_pp1');
	var t5 = $('#tbody_pf1');
	var t6 = $('#tbody_6');
	if (scholarlist !== null) {
		var j = 0;
		var currentheader = '';
		for (var i = 0; i < scholarlist.length; i++) {

			$('#countryHeader').text(scholarlist[i].Country);
			if (i == 0 || currentheader !== scholarlist[i].SubQual) {
				j++;
				currentheader = scholarlist[i].SubQual;

				if (j == 1) {
					$('#panel1header').text(scholarlist[i].Qual);
					//$('#table1header').text(scholarlist[i].SubQual);
				}
				if (j == 2) {
					$('#panel2header').text(scholarlist[i].Qual);
					$('#table2header').text(scholarlist[i].SubQual)
				}
				if (j == 3) {
					$('#panel3header').text(scholarlist[i].Qual);
					if (scholarlist[i].Country == "Bhutan") {
						$('#table2bhutan').css('display', '');
						$('#table6header').text(scholarlist[i].SubQual)
					}
					else {
						$('#table2bhutan').css('display', 'none');
						// $('#table3header').text(scholarlist[i].SubQual)
					}
				}
				if (j == 4) {
					$('#panel3header').text(scholarlist[i].Qual);
					if (scholarlist[i].Country == "Bhutan") {
						// $('#table3header').text(scholarlist[i].SubQual)
					}
				}



			}
			if (j == 1) {
				var html = '';
				html += "<tr>";
				html += "<td>"
				html += scholarlist[i].ScholarPercent;
				html += "</td>";
				html += "<td>"
				html += scholarlist[i].EligibilityPercent;
				html += "</td>";
				html += "</tr>";
				var hh = $(html);

				t1.append(hh);
				$('#ScholarshipDate1').text(scholarlist[i].LastDateApply);
			}
			if (j == 2) {
				var html = '';
				html += "<tr>";
				html += "<td>"
				html += scholarlist[i].ScholarPercent;
				html += "</td>";
				html += "<td>"
				html += scholarlist[i].EligibilityPercent;
				html += "</td>";
				html += "</tr>";

				var hh = $(html);
				t2.append(hh);
				$('#ScholarshipDate2').text(scholarlist[i].LastDateApply);

			}
			if (j == 3) {
				var html = '';
				html += "<tr>";
				html += "<td>"
				html += scholarlist[i].ScholarPercent;
				html += "</td>";
				html += "<td>"
				html += scholarlist[i].EligibilityPercent;
				html += "</td>";
				html += "</tr>";

				var hh = $(html);
				if (scholarlist[i].Country == "Bhutan") {
					t6.append(hh);
					$('#ScholarshipDate6').text(scholarlist[i].LastDateApply);
				}
				else {
					t3.append(hh);
				}
				$('#ScholarshipDate3').text(scholarlist[i].LastDateApply);
			}

			if (j == 4) {
				var html = '';
				html += "<tr>";
				html += "<td>"
				html += scholarlist[i].ScholarPercent;
				html += "</td>";
				html += "<td>"
				html += scholarlist[i].EligibilityPercent;
				html += "</td>";
				html += "</tr>";
				var hh = $(html);
				t3.append(hh);
				$('#ScholarshipDate3').text(scholarlist[i].LastDateApply);

			}

		}
	}

	if (phdparttime !== null) {

		for (var i = 0; i < phdparttime.length; i++) {


			$('#panel4header').text(phdparttime[i].Qual);
			// $('#table4header').text(phdparttime[i].SubQual);


			var html = '';
			html += "<tr>";
			html += "<td>"
			html += phdparttime[i].ScholarCategory;
			html += "</td>";
			html += "<td>"
			html += phdparttime[i].seventypercent;
			html += "</td>";
			html += "<td>"
			html += phdparttime[i].fiftypercent;
			html += "</td>";
			html += "<td>"
			html += phdparttime[i].thirtypercent;
			html += "</td>";
			html += "</tr>";
			var hh = $(html);
			t4.append(hh);
			$('#ScholarshipDate4').text(phdparttime[i].LastDateApply);

		}
	}
	if (phdfulltime !== null) {
		for (var i = 0; i < phdfulltime.length; i++) {

			$('#panel5header').text(phdfulltime[i].Qual);
			//  $('#table5header').text(phdfulltime[i].SubQual);
			var html = '';
			html += "<tr>";
			html += "<td>"
			html += phdfulltime[i].ScholarCategory;
			html += "</td>";
			html += "<td>"
			html += phdfulltime[i].ninetypercent;
			html += "</td>";
			html += "<td>"
			html += phdfulltime[i].seventypercent;
			html += "</td>";
			html += "<td>"
			html += phdfulltime[i].fiftypercent;
			html += "</td>";
			html += "</tr>";
			var hh = $(html);
			t5.append(hh);
			$('#ScholarshipDate5').text(phdfulltime[i].LastDateApply);
		}


	}


}


//	$('#scholardetailsForm select').prop("selectedIndex",0).trigger('change');




function fun_FormValidations() {
	// $form.validate({

	$("form[name='scholardetailsForm']").validate({
		errorElement: 'div',
		errorPlacement: function (error, element) {
			error.insertAfter(element);
		},
		rules: {
			name: {
				required: true
			},
			emailid: {
				required: true
			},
			phone: {
				required: true
			},
			progname: {
				required: true
			},
			country: {
				required: true
			}
		},
		messages: {

			name: {
				required: "Please Enter your Name"
			},
			emailid: {
				required: "Please Enter your Email ID"
			},
			phone: {
				required: "Please Enter your Phone No"
			},
			progname: {
				required: "Please Enter Programme Name"
			},
			country: {
				required: "Please Select the Country."
			}
		}
	});


	if ($("form[name='scholardetailsForm']").valid()) {
		$.blockUI();
		fun_InsertScholarshipDetails();
	}

}
function openWin() {
	window.open("//admission.lpu.in");
}
