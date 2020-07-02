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
    // setdatatables();
    displayTimeDate();
    signupFormRadioButton();
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
            'timeFormat': 'g:ia'
        });

        $('#available_doctor_time_custom_availabe_date').datepicker({
            'format': 'd/mm/yyyy',
            'startDate': '-0m'
        });
    }
}
