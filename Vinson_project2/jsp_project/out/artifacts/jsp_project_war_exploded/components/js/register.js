/**
 * Created by cfenglv on 2016/12/24.
 */
function init() {
    // $('#Birthday').datepicker({
    //     format:'yyyy/mm/dd',
    //     viewMode:2,
    //     minViewMode:0
    // });
    $('#Birthday').datepicker({
        showOtherMonths: true,
        selectOtherMonths: true,
        dateFormat: "yy-m-d",
        changeMonth: true,
        changeYear: true,
        yearRange: '-100:+0'
    }).prev().on('click', function (e) {
        e && e.preventDefault();
        $('#Birthday').focus().blur();
    });
    $.extend($.datepicker, {_checkOffset:function(inst,offset,isFixed){return offset}});
    $('#Birthday').datepicker('widget').css({'margin-left': -$('#Birthday').prev('.input-group-btn').find('.btn').outerWidth()});
    $('#registerForm').bootstrapValidator({
        message: 'This value is not valid',
        // feedbackIcons: {
        //     valid: 'fui-check',
        //     invalid: 'fui-cross',
        //     validating: 'glyphicon glyphicon-refresh'
        // },
        fields: {
            user_name: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'The username is required and cannot be empty'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'The username must be more than 6 and less than 30 characters long'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_]+$/,
                        message: 'The username can only consist of alphabetical, number and underscore'
                    },
                    callback: {
                        message: 'The username is already existed',
                        callback: function(value, validator) {
                            return true;
                        }
                    }
                }
            },
            email_id: {
                validators: {
                    notEmpty: {
                        message: 'The email is required and cannot be empty'
                    },
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    },
                    stringLength: {
                        min: 0,
                        max: 45,
                        message: 'The email must be less than 45 characters long'
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'The password is required and cannot be empty'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'The password must be more than 6 and less than 30 characters long'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_]+$/,
                        message: 'The password can only consist of alphabetical, number and underscore'
                    }
                }
            },
            confirm: {
                validators: {
                    notEmpty: {
                        message: 'The password confirm is required and cannot be empty'
                    },
                    identical: {
                        field: 'password',
                        message: 'Please confirm your password carefully'
                    }
                }
            },
            phone_number:{
                validators: {
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'The telephone can only consist of number'
                    }
                }
            },
            captcha:{
                message: 'The captcha is not correct',
                validators: {
                    notEmpty: {
                        message: 'The captcha is required and cannot be empty'
                    },
                    regexp: {
                        regexp: /^-?[0-9]+$/,
                        message: 'The captcha can only consist of number'
                    },
                    callback: {
                        message: 'The captcha is not correct',
                        callback: function(value, validator) {
                            return true;
                        }
                    }
                }
            },
            Birthday:{
                validators: {
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The Birthday must be less than 100 characters long'
                    }
                }
            },
            country:{
                validators: {
                    stringLength: {
                        min: 0,
                        max: 100,
                        message: 'The Country must be less than 100 characters long'
                    }
                }
            }
        }
    });
}


