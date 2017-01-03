<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <script type="text/javascript" src="../js/jquery-3.1.1.js"></script>
    <script type="text/javascript" src="../js/script.js"></script>
    <script type="text/javascript" src="../bootstrap/js/bootstrap.js"></script><!-- 
    <script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script> -->
    <script type="text/javascript" src="../js/jquery-ui.js"></script>

    <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../css/jquery-ui.css">

</head> 
<body>

    <!--MODERN NAVBAR-->
    <nav class="navbar navbar-default navbar-static collapsed" id="navbar">
        <!--Mobile Menu-->
        <div class="navbar-header">
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>                
            </button>
        </div>
        <!--Desktop/Tablet Menu glyphicon -->

        <% if(session.getAttribute("role") ==  null){ %>
        <div class="collapse navbar-collapse js-navbar-collapse">

            <div class="row">
                <div class="container">
                    <div class="btn-group btn-group-justified">                        
                        <div class="btn-group">
                            <button type="button" class="btn btn-nav" id="btnHome">
                                <span class="glyphicon glyphicon-home"></span>
                                <p class="collapsed" id="home">Home</p>
                            </button>
                        </div>
                        <div class="btn-group">
                            <button type="button" class="btn btn-nav" id="btnLogin">
                                <span class="glyphicon glyphicon-log-in"></span>
                                <p class="collapsed" id="login">Login</p>
                            </button>
                        </div>
                        <div class="btn-group">
                            <button type="button" class="btn btn-nav" id="btnRegister">
                                <span class="glyphicon glyphicon-pencil"></span>
                                <p class="collapsed" id="register">Register</p>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 hidden-xs">
                <toggle href="#" class="glyphicon glyphicon-chevron-down toggle" id="toggle" style="top: -40px"></toggle>
            </div>
        </div>


        <%}else if(session.getAttribute("role") != null){%>

        <div class="collapse navbar-collapse js-navbar-collapse">
            <div class="row">
                <div class="container">
                    <div class="btn-group btn-group-justified">
                        <div class="btn-group">
                            <button type="button" class="btn btn-nav" id="btnHome">
                                <span class="glyphicon glyphicon-home"></span>
                                <p class="collapsed" id="home">Home</p>
                            </button>
                        </div>
                        <!--Wiki-->
                        <div class="btn-group">
                            <button type="button" class="btn btn-nav" id="btnProduct">
                                <span class="glyphicon glyphicon-book"></span>
                                <p class="collapsed" id="product">Product</p>
                            </button>                            
                        </div>
                        <!--TechTicket-->
                        <div class="btn-group">
                            <button type="button" class="btn btn-nav" id="btnMember">
                                <span class="glyphicon glyphicon-ok-sign"></span>
                                <p class="collapsed" id="member">Member</p>
                            </button>
                        </div>
                        <!--Reports-->
                        <div class="btn-group">
                            <button type="button" class="btn btn-nav" id="btnTransaction">
                                <span class="glyphicon glyphicon-list"></span>
                                <p class="collapsed" id="transaction">Transaction</p>
                            </button>
                        </div>
                        <!--Profile-->
                        <div class="btn-group">
                            <button type="button" class="btn btn-nav" id="btnProfile">
                                <span class="glyphicon glyphicon-user"></span>
                                <p class="collapsed" id="profile">Profile</p>
                            </button>
                        </div>

                        <div class="btn-group">
                            <button type="button" class="btn btn-nav" id="btnLogout">
                                <span class="glyphicon glyphicon-log-out"></span>
                                <p class="collapsed" id="logout">Log Out</p>
                            </button>
                        </div>
                    </div><!--end button group-->
                </div><!--end container-->
            </div><!--end collapse-->
        </div>
        <div class="row">
            <div class="col-md-12 hidden-xs">
                <toggle href="#" class="glyphicon glyphicon-chevron-down toggle" id="toggle" style="top: -40px"></toggle>
            </div>
        </div><!--end row-->
        <%}else if(session.getAttribute("role") != null){%>

        <div class="collapse navbar-collapse js-navbar-collapse">
            <div class="row">
                <div class="container">
                    <div class="btn-group btn-group-justified">
                        <div class="btn-group">
                            <button type="button" class="btn btn-nav" id="btnHome">
                                <span class="glyphicon glyphicon-home"></span>
                                <p class="collapsed" id="home">Home</p>
                            </button>
                        </div>
                        <!--Wiki-->
                        <div class="btn-group">
                            <button type="button" class="btn btn-nav" id="btnProduct">
                                <span class="glyphicon glyphicon-book"></span>
                                <p class="collapsed" id="product">Product</p>
                            </button>                            
                        </div>
                        <!--TechTicket-->
                        <div class="btn-group">
                            <button type="button" class="btn btn-nav" id="btnMember">
                                <span class="glyphicon glyphicon-ok-sign"></span>
                                <p class="collapsed" id="member">Member</p>
                            </button>
                        </div>
                        <!--Reports-->
                        <div class="btn-group">
                            <button type="button" class="btn btn-nav" id="btnTransaction">
                                <span class="glyphicon glyphicon-list"></span>
                                <p class="collapsed" id="transaction">Transaction</p>
                            </button>
                        </div>
                        <!--Profile-->
                        <div class="btn-group">
                            <button type="button" class="btn btn-nav" id="btnProfile">
                                <span class="glyphicon glyphicon-user"></span>
                                <p class="collapsed" id="profile">Profile</p>
                            </button>
                        </div>

                        <div class="btn-group">
                            <button type="button" class="btn btn-nav" id="btnCart">
                                <span class="glyphicon glyphicon-shopping-cart"></span>
                                <p class="collapsed" id="cart">Cart</p>
                            </button>
                        </div>

                        <div class="btn-group">
                            <button type="button" class="btn btn-nav" id="btnLogout">
                                <span class="glyphicon glyphicon-log-out"></span>
                                <p class="collapsed" id="logout">Log Out</p>
                            </button>
                        </div>
                    </div><!--end button group-->
                </div><!--end container-->
            </div><!--end collapse-->
        </div>
        <div class="row">
            <div class="col-md-12 hidden-xs">
                <toggle href="#" class="glyphicon glyphicon-chevron-down toggle" id="toggle" style="top: -40px"></toggle>
            </div>
        </div><!--end row-->

        <%}%>
        <%
            Integer totaluser =  (Integer)application.getAttribute("totaluser");
        %>
        <div class="col-md-offset-10">
            <h6>user online : <%= totaluser%></h6>
        </div>

    </nav>
</body>
</html>