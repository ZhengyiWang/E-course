<%-- 
    Document   : index
    Created on : Dec 28, 2016, 2:26:52 PM
    Author     : vinson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="botDetect" uri="https://captcha.com/java/jsp"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>注册-NetCourse</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="asset/css/bootstrap/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="asset/css/Admin/AdminLTE.min.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="asset/css/skins/_all-skins.min.css">
        <!-- iCheck -->
        <link rel="stylesheet" href="asset/css/plugins/iCheck/blue.css">
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body class="hold-transition register-page">
        <div class="register-box">
            <div class="register-logo">
                <a href="../../index2.html"><b>Net</b>Course</a>
            </div>
            <div class="register-box-body">
                <p class="login-box-msg">Register a new membership</p>
                <form action="RegisterServlet" method="post">
                    <div class="form-group has-feedback">
                        <input name="username" type="text" class="form-control" placeholder="UserName">
                        <span class="glyphicon glyphicon-user form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <input name="email" type="email" class="form-control" placeholder="Email">
                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <input id="inputassword" name="password" type="password" class="form-control" placeholder="Password">
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <input name="phone" type="text" class="form-control" placeholder="Phone">
                        <span class="glyphicon glyphicon-user form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <input name="country" type="text" class="form-control" placeholder="Country">
                        <span class="glyphicon glyphicon-user form-control-feedback"></span>
                    </div>
                    <hr>
                    <div class="form-group">
                        <botDetect:captcha  id="exampleCaptchaTag"
                                            userInputID="captchaCode"
                                            imageWidth="300"
                                            codeLength="5"
                                            codeStyle="ALPHA"/>
                        <hr>
                        <input name="captchaCode" type="text" id="captchaCode" class="form-control" placeholder="Captcha"/>
                    </div>

                    <div class="row">
                        <div class="col-xs-8">
                            <div class="checkbox icheck">
                                <label>
                                    <input type="checkbox"> I agree to the <a href="#">terms</a>
                                </label>
                            </div>
                        </div>
                        <!-- /.col -->
                        <div class="col-xs-4">
                            <button type="submit" class="btn btn-primary btn-block btn-flat">Register</button>
                        </div>
                        <!-- /.col -->
                    </div>
                </form>
                <a href="login.jsp" class="text-center">I already have a membership</a>
            </div>
            <!-- /.form-box -->
        </div>
        <!-- /.register-box -->
    </body>
    <!-- /.login-box -->
    <!-- jQuery 2.2.3 -->
    <script src="asset/js/jquery-2.2.3.min.js"></script>
    <!-- Bootstrap 3.3.6 -->
    <script src="asset/js/bootstrap.min.js"></script>
    <!-- iCheck -->
    <script src="asset/js/icheck.min.js"></script>
    <script>
        $(function () {
            $('input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });
        });
    </script>
</html>

