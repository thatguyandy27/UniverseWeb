$(document).ready(function () {    
    $('.menu li').hover(
        function () {
            $('ul', this).stop(true, true).slideDown(200);
        },
        function () {
            $('ul', this).stop(true, true).slideUp(200);            
        });
});

