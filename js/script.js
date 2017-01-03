//ENSURE THAT EVERYTHING IS FILLED OUT BEFORE BEING ABLE TO SUBMIT***********************
$(document).ready(function(){
    $('#toggle').click(function () {
        $('#navbar').toggleClass('collapsed expanded');
        $('#home').toggleClass('collapsed expanded');
        $('#register').toggleClass('collapsed expanded');
        $('#login').toggleClass('collapsed expanded');
        $('#product').toggleClass('collapsed expanded');
        $('#member').toggleClass('collapsed expanded');
        $('#transaction').toggleClass('collapsed expanded');
        $('#logout').toggleClass('collapsed expanded');
        $('#cart').toggleClass('collapsed expanded');
        $('#profile').toggleClass('collapsed expanded');
        $('toggle').toggleClass('collapsed expanded')
    });
});

$(document).ready(function(){
    $('#btnHome').click(function(){
        window.location.href='index.jsp';
    });

    $('#btnRegister').click(function(){
        window.location.href='register.jsp';
    });

    $('#btnLogin').click(function(){
        window.location.href='login.jsp';
    });

    $('#btnProduct').click(function(){
        window.location.href='product.jsp';
    });

    $('#btnMember').click(function(){
        window.location.href='member.jsp';
    });

    $('#btnTransction').click(function(){
        window.location.href='transaction.jsp';
    });

    $('#btnProfile').click(function(){
        window.location.href='profile.jsp';
    });

    $('#btnCart').click(function(){
        window.location.href='cart.jsp';
    });

    $('#btnLogout').click(function(){
        window.location.href='../logical/doLogout.jsp';
    });
})
