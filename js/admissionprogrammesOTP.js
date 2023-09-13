'use strict';

var APP_PATH = "//admit.lpu.in";

var App = {};
App.blockUI = function () {

	$("#signup").prop('disabled', true);
	$("#signup").html('Please wait <i class="icon icon-spinner icon-spin"></i>');

};
App.unblockUI = function () {

	$("#signup").prop('disabled', false);
	$("#signup").html('REGISTER NOW');
};

$(document).ready(function () {
	var serpath = "//services.lpu.in";

	$('#f_state').select2().on("change", function (e) {
		if ($('#f_state').val() == "") {
			$('#select2-f_state-container').attr('style', 'border-bottom: 1px solid #cc0000 !important');
		} else {
			$('#select2-f_state-container').attr('style', 'border-bottom: 0 !important');
		}
	});
	// $.post(APP_PATH + '/api/Services/LoadddlState')
	// .success(function(response) {
	// $.each(response, function(index, element) {
	// $('#f_state').append('<option value="' + element.StateName + '">' + element.StateName + '</option>');
	// });
	// $('#f_state').select2().on("change", function(e) {
	// if ($('#f_state').val() == "") {
	// $('#select2-f_state-container').attr('style', 'border-bottom: 1px solid #cc0000 !important');
	// } else {
	// $('#select2-f_state-container').attr('style', 'border-bottom: 0 !important');
	// }
	// });
	// });


	//var serpath="//localhost:64383";
	$.post(serpath + '/api/programsearch/GetCountry')
	.success(function (response) {
		$.each(response, function (index, element) {
			if (element.Country == 'India')
				$('#f_country').append('<option selected="true" value="' + element.Country + '">' + element.Country + '</option>');
			else
				$('#f_country').append('<option value="' + element.Country + '">' + element.Country + '</option>');
		});
		$('#f_country').select2({
			placeholder: "Select Nationality",
			allowClear: false,
		}).on("change", function (e) {
			// mostly used event, fired to the original element when the value changes
			$("#f_contactnumber").rules("remove");
			if ($('#f_country').val() != "India") {
				$('.hd-int').css("display", "none");
				$('.spl-msg').css("display", "");
				$("#f_contactnumber").rules("add", {
					required: true,
					minlength: 10,
					maxlength: 15,
					digits: true,
					messages: {
						required: "Phone number is required.",
						minlength: "Please enter minimum 10 digits",
						maxlength: "Maximum 15 digits are allowed",
						digits: "Only numeric digits are allowed"
					}
				});
			} else {
				$('.hd-int').css("display", "");
				$('.spl-msg').css("display", "none");
				$("#f_contactnumber").rules("add", {
					required: true,
					pattern: /^[9876][0-9]{9}$/,
					messages: {
						required: "Phone number is required.",
						pattern: "Please provide a valid indian mobile no. of 10 digits."
					}
				});
			}
		});
	});
	$('#frmSignUp').validate({
		rules: {
			f_state: {
				required: true
			},
			f_contactnumber: {
				required: true,
				pattern: /^[9876][0-9]{9}$/,
				remote: {
					url: '/api/Services/OnlineCheckPhone',
					type: "get",
					data: {
						Phone: function () {
							return $('#f_contactnumber').val();
						}
					},
					dataFilter: function (response) {
						if (response === 'true') {
							return "false";
						} else {
							return "true";
						}
					}
				}
			},
			messages: {
				f_contactnumber: {
					required: " ",
					pattern: "Please provide a valid indian mobile no. of 10 digits.",
					remote: "Phone Number already exists"
				},
				f_state: {
					required: " "
				}
			}
		},
		errorElement: 'div',
		errorClass: 'validate-error',
		errorPlacement: function (error, element) {},
		highlight: function (element, errorClass, validClass) {
			if ($(element).hasClass('psstate')) {
				if ($(element).hasClass('validate-error')) {
					$('#select2-f_state-container').attr('style', 'border-bottom: 1px solid #cc0000 !important');
				}
			}

			if (element.type === "radio") {
				//$(element).addClass(errorClass).removeClass(validClass);
				$('label.gnder').addClass(errorClass).removeClass(validClass);
			} else {
				$(element).addClass(errorClass).removeClass(validClass);
			}
		},
		unhighlight: function (element, errorClass, validClass) {
			if (element.type === "radio") {
				//$(element).removeClass(errorClass).addClass(validClass);
				$('label.gnder').removeClass(errorClass).addClass(validClass);
			} else {
				$(element).removeClass(errorClass).addClass(validClass);
			}
		}

	});
	$("#rotp").click(function (e) {
		if (checkCounter()) {
			countdown();
		} else {
			$("#resentmsg").css('display', 'none');
			$("#rotp").css('display', 'none');
		}
		App.unblockUI();
		var contactrequest = {
			"EmailId": $("#f_email").val(),
			"Name": $("#f_name").val(),
			"Phone": $("#f_contactnumber").val(),
			"Password": $("#f_contactnumber").val(),
			"Logintype": "M",
			"Gender": $('input[name="Gender"]:checked').val(),
			"F_Id": "",
			"L_Id": "",
			"G_Id": "",
			"Nationality": $('#f_country').val(),
			"AgencyName": "2+FnCh9kQ+pFbvnzT6jq32IeAUXOQP/kzA0UjiJHsj0=",
			"State": $('#f_state').val(),
			"OTP": "",
			"ApplyFor": getnestcode()
		}
		signup(contactrequest);

	});
	$("#otpbtn").click(function (e) {
		if ($("#otpform").valid()) {
			var contactrequest = {
				"EmailId": $("#f_email").val(),
				"Name": $("#f_name").val(),
				"Phone": $("#f_contactnumber").val(),
				"Password": $("#f_contactnumber").val(),
				"Logintype": "M",
				"Gender": $('input[name="Gender"]:checked').val(),
				"F_Id": "",
				"L_Id": "",
				"G_Id": "",
				"Nationality": $('#f_country').val(),
				"AgencyName": "2+FnCh9kQ+pFbvnzT6jq32IeAUXOQP/kzA0UjiJHsj0=",
				"State": $('#f_state').val(),
				"OTP": $('#txtotp').val(),
				"ApplyFor": getnestcode()
			}
			signup(contactrequest);
		}
		e.preventDefault();

		return false;
	});

	$("#closeotp").click(function () {
		$("#otp").addClass('hide');
		$(".admissionform").removeClass('hide');
		App.unblockUI();
	});
	$('#frmSignUp').on('submit', function (e) {
		if ($(this).valid()) {

			
			var contactrequest = {
				"EmailId": $("#f_email").val(),
				"Name": $("#f_name").val(),
				"Phone": $("#f_contactnumber").val(),
				"Password": $("#f_contactnumber").val(),
				"Logintype": "M",
				"Gender": $('input[name="Gender"]:checked').val(),
				"F_Id": "",
				"L_Id": "",
				"G_Id": "",
				"Nationality": "India",
				"AgencyName": "2+FnCh9kQ+pFbvnzT6jq32IeAUXOQP/kzA0UjiJHsj0=",
				"State": $('#f_state').val(),
				"OTP": "",
				"ApplyFor": getnestcode()
			}
			signup(contactrequest);
		}

		e.preventDefault();
		return false;
	});
});
var counter = 1;
function checkCounter() {
	if (counter > 2) {
		$("#resentmsg").css('display', 'none');
		return false;
	}

	counter++;
	return true;
}

function getParameterByName(name, url) {
	if (!url)
		url = window.location.href;
	name = name.replace(/[\[\]]/g, "\\$&");
	var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
	results = regex.exec(url);
	if (!results)
		return null;
	if (!results[2])
		return '';
	return decodeURIComponent(results[2].replace(/\+/g, " "));
}
function signup(contactrequest) {
	App.blockUI();
	var lurl = "//www.lpu.in/contact_us/contact-us.php";

	if (typeof $('#Launchh').attr('href') != 'undefined') {
		lurl = $('#Launchh').attr('href');
	}

	if ($("#ps-how-to-apply").css('display') == 'none') {
		lurl = "//www.lpu.in/contact_us/contact-us.php";
	}
	if (lurl != "//www.lpu.in/contact_us/contact-us.php") {
		var jqxhr = $.post(APP_PATH + '/api/Services/OnlineSignUpUser', contactrequest)
			.done(function (response) {

				if (response[0].response_message === "success") {
					swal({
						title: "User Signup Completed",
						html: "Please proceed!",
						type: "success",
						showCancelButton: false,
						confirmButtonColor: "#DD6B55",
						confirmButtonText: "Ok!",
						closeOnConfirm: true
					}).then(function (v) {
						ga('send', 'event', {
							eventCategory: 'Form',
							eventAction: 'RegisterNow',
							eventLabel: 'Programmes'
						});
						window.location = APP_PATH + "/Account/Token?encoding=" + response[0].encoding + "&assoc_handle=" + response[0].assoc_handle + "&checkid_setup=" + response[0].checkid_setup + "&response_state=" + response[0].response_state;
					});

				} else {
					App.unblockUI
					if (response[0].response_message === "Duplicate") {
						swal({
							title: "Email or Phone number already Registered",
							text: "Already Exisits!",
							type: "warning",
							confirmButtonColor: "#DD6B55",
							confirmButtonText: "Ok!",
							closeOnConfirm: false
						});
					} else if (response[0].response_message === "InvalidEmail") {
						swal({
							title: "Invalid Email address",
							text: "Email Address you entered is not valid. Kindly enter a valid Email Address!",
							type: "error",
							confirmButtonColor: "#DD6B55",
							confirmButtonText: "Ok!",
							closeOnConfirm: false
						});
					} else if (response[0].response_message === "SentOTP") {
						$("#otp").removeClass('hide');
						$(".admissionform").addClass('hide');
						countdown();
					} else if (response[0].response_message === "InvalidOTP") {
						swal({
							title: "Invalid OTP",
							text: "OTP you entered is not valid. Kindly enter a valid OTP or click on Resend OTP to get a new one!",
							type: "error",
							confirmButtonColor: "#DD6B55",
							confirmButtonText: "Ok!",
							closeOnConfirm: false
						});
					}
				}
			})
			.fail(function () {
				App.unblockUI
			});
	} else{
		var contactrequest = {
			"name": $("#f_name").val(),
			"email": $("#f_email").val(),
			"mobile": $("#f_contactnumber").val(),
			"course": $('#schoolname').html(),
			"utm_source": "",
			"utm_medium": "",
			"utm_campaign": "",
			"type": "2+FnCh9kQ+pFbvnzT6jq32IeAUXOQP/kzA0UjiJHsj0=",
			"specialization": "",
			"utm_keyword": "",
			"utm_placement": "",
			"utm_campiagncontent": "",
			"mail": "",
			"state": $("#f_state").val()
		}
	var jqxhr = $.post(serpath + '/api/Services/SaveEnquiryLandingPage2017', contactrequest)
		.success(function (response) {
			$("#f_name").val("");
			$("#f_email").val("");
			$("#f_contactnumber").val("");
			$("#f_state").val("");

			swal('Thank You!', 'Your details are successfully submitted. Our representative will get back to you shortly.', 'success');
		});
	}
}
function getnestcode() {
	var lurl = "//www.lpu.in/contact_us/contact-us.php";
	if (typeof $('#Launchh').attr('href') != 'undefined') {
		lurl = $('#Launchh').attr('href');
	}
	var nestAttr = lurl.replace("//admit.lpu.in/index?nest=", "").replace("&Agency=ULTZR9jqWP4fxBDdLk4lwCgUs40WYjgbQmR75UEaJhw=", "");;
	return nestAttr;
}
function fun_RemoteCheckEmail(e) {

	var lurl = "//www.lpu.in/contact_us/contact-us.php";
	if (typeof $('#Launchh').attr('href') != 'undefined') {
		lurl = $('#Launchh').attr('href');
	}
	if (lurl != "//www.lpu.in/contact_us/contact-us.php") {
		if ($('#f_email').valid()) {
			App.blockUI();
			$.ajax({
				url: APP_PATH + '/api/Services/OnlineCheckPhoneorEmail',
				type: "get",
				crossDomain: true,
				data: {
					request: $('#f_email').val()
				},
				success: function (data) {
					data = (data.d != null ? data.d : data);
					if (data !== false) {
						swal({
							title: "Proceed",
							html: "Your Email ID is already exists in our record, you can login to portal with your existing email",
							type: "info",
							showCancelButton: true,
							confirmButtonColor: "#DD6B55",
							confirmButtonText: "Yes, Go to login.",
							closeOnConfirm: true
						}).then(function (v) {
							if (v !== false) {
								window.location = APP_PATH + "/#login";
							} else {
								App.unblockUI();
							}
						});
						$('#f_email').val('');
						$('#f_email').focus();
					} else {
						App.unblockUI();
					}
				},
				error: function (response) {
					App.unblockUI();
					$('#f_email').val('');
					console.error(response);
				}
			});
		}
	}
}


function fun_RemoteCheckPhone(e) {
	
	var lurl = "//www.lpu.in/contact_us/contact-us.php";
	if (typeof $('#Launchh').attr('href') != 'undefined') {
		lurl = $('#Launchh').attr('href');
	}
	
	if (lurl != "//www.lpu.in/contact_us/contact-us.php") {

		if ($('#f_contactnumber').valid()) {
			App.blockUI();
			$.ajax({
				url: APP_PATH + '/api/Services/OnlineCheckPhoneorEmail',
				type: "get",
				crossDomain: true,
				data: {
					request: $('#f_contactnumber').val()
				},
				success: function (data) {
					data = (data.d != null ? data.d : data);
					if (data !== false) {
						swal({
							title: "Proceed",
							html: "Your Phone number already exists in our records",
							type: "info",
							showCancelButton: true,
							confirmButtonColor: "#DD6B55",
							confirmButtonText: "Yes, Go to login.",
							closeOnConfirm: true
						}).then(function (v) {
							if (v !== false) {

								window.location = APP_PATH + "/#login";
							} else {
								App.unblockUI();
							}
						});
						$('#f_contactnumber').val('');
						$('#f_contactnumber').focus();
					} else {
						App.unblockUI();
					}
				},
				error: function (response) {
					App.unblockUI();
					$('#f_contactnumber').val('');
					console.error(response);
				}
			});
		}
	}
}

var counter = 1;
function countdown() {
	$("#rotp").css('display', 'none');
	$("#closeotp").css('display', 'none');

	var counter = 60;
	var interval = setInterval(function () {
			counter--;
			if (counter === 0) {
				$("#resentmsg").css('display', 'none');
				$("#rotp").css('display', 'block');
				$("#closeotp").css('display', '');
				clearInterval(interval);
			} else {
				$("#resentmsg").css('display', '');
				$("#closeotp").css('display', 'none');
				$("#countersec").html(counter);
			}
		}, 1000);
}
