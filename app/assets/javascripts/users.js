$(document).ready(function(){
    $("#search").keyup(function(){
        $.ajax({
            url:  '/users',
            type: 'GET',
            data: {q: $(this).val()},
            success: function(data){
                $("#users_list").html(data);
            }
        });
    });
});
