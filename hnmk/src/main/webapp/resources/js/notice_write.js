$(document).ready(function() {
    $('#ntit').on('keyup', function() {
        $('#ntit_cnt').html("("+$(this).val().length+" / 최대 50자)");

        if($(this).val().length > 50) {
            $(this).val($(this).val().substring(0, 50));
            $('#ntit_cnt').html("(50 / 최대 50자)");
        }
    });
});

$(document).ready(function() {
    $('#ncon').on('keyup', function() {
        $('#ncon_cnt').html("("+$(this).val().length+" / 최대 2000자)");

        if($(this).val().length > 2000) {
            $(this).val($(this).val().substring(0, 2000));
            $('#ncon_cnt').html("(2000 / 최대 2000자)");
        }
    });
});