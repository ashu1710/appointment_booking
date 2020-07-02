// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require jquery_ujs
//= require popper
//= require turbolinks
//= require bootstrap
//= require bootstrap-datepicker
//= require jquery.timepicker.js
//= require toastr
//= require jquery.validate
//= require jquery.validate.additional-methods 
//= require_tree .



$( document ).on('turbolinks:load', function() {
	submitSignUpForm();
    displayTimeDate();
    signupFormRadioButton();
    book_appointment();
 });

function submitSignUpForm(){
	$('.btn-signup, .btn-login, .btn-forget-password, .btn-forget-password').click(function(){
		$('#new_user').validate({
		    rules: {
		    	'user[email]':{
		    		required: true
		    	},
                'user[hospital_name]':{
                    required: true
                },
                'user[hospital_address]':{
                    required: true
                },
                'user[hospital_mobile_number]':{
                    required: true,
                    minlength: 10
                },
                'user[password]': {
                    required: true,
                    minlength: 6
                },
                'user[password_confirmation]': {
                    equalTo: "#user_password"
                }
            },
            messages: {
                'user[password_confirmation]': "Enter Confirm Password Same as Password"
            }
		});
	});

    $('.btn-change-password').click(function(){
        $('#edit_user').validate({
            rules: {
                'user[current_password]':{
                    required: true
                },
                'user[password]': {
                    required: true,
                    minlength: 6
                },
                'user[password_confirmation]': {
                    equalTo: "#user_password"
                }
            },
            messages: {
                'user[password_confirmation]': "Enter Confirm Password Same as Password"
            }
        });
    });
}

function signupFormRadioButton(){
    $('input[type=radio][name=register_as]').change(function() {
        $('#new_user').validate();
        if($('input[name=register_as]:checked').val() == 'user'){
            $('.doctorDetails').addClass('d-none');
            $("#user_hospital_name").rules("remove", "required");
            $("#user_hospital_address").rules("remove", "required");
            $("#user_hospital_mobile_number").rules("remove", "required");
            $("#user_hospital_mobile_number").rules("remove", "minlength");
        }else{
            $('.doctorDetails').removeClass('d-none');
            $("#user_hospital_name").rules("add", "required");
            $("#user_hospital_address").rules("add", "required");
            $("#user_hospital_mobile_number").rules("add", "required");
            $("#user_hospital_mobile_number").rules("add", "minlength");
        }
    });
}

function displayTimeDate(){
    if($('.set-time-picker').length > 0)
    {
        $('.set-time-picker').timepicker({
            'showDuration': true,
            'timeFormat': 'g:ia',
            'minTime': '7:00am',
            'maxTime': '5:00pm'
        });

        $('.set-date-picker').datepicker({
            'format': 'dd/mm/yyyy',
            'startDate': '-0m'
        }).on('change', function(e) {
            var doctorID = $(this).closest('tr').attr('id');
            var selectedDate = $(this).val();
            $.ajax({
              url: "/check_doctor_avaibility",
              type: "get",
              dataType: 'script',
              data: { doctor_id: doctorID, selected_date: selectedDate}
            });
        });
    }
}


function book_appointment(){
    $('.booking_btn').on('click', function(e){
        var bookingDate = $(this).closest('tr').find('#custom_availabe_date').val();
        var fromTime = $(this).closest('tr').find('#from_time').val();
        var toTime = $(this).closest('tr').find('#to_time').val();
        var doctorID = $(this).closest('tr').attr('id');

        if(bookingDate == ''){
            toastr.error("Select booking date.");
        }
        else if(fromTime == ''){
            toastr.error("Select from time.");
        }
        else if(toTime == ''){
            toastr.error("Select to time.");
        }else{
            $.ajax({
                url: "/book_appointment",
                type: "get",
                dataType: 'script',
                data: { booking_date: bookingDate, from_time: fromTime, to_time: toTime, doctor_id: doctorID}
            });
        }
        
    })
    
}