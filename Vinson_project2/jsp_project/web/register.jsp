<%--
  Created by IntelliJ IDEA.
  User: cfenglv
  Date: 2016/12/23
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-app="myapp">
<head>
	<meta charset="utf-8"/>
	<!--字符集-->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<!--自适应-->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!--以最高级别的可用模式显示内容-->
	<meta http-equiv="Pragma" content="No-cach">
	<!--不缓存，不能脱机浏览-->
	<meta name="renderer" content="webkit">
	<!--极速核-->
	<meta http-equiv="Cache-Control" content="no-transform"/>
	<!--防止搜索引擎转码-->
	<meta http-equiv="Cache-Control" content="no-siteapp"/>
	<!--防止搜索引擎转码-->
	<link rel="stylesheet" href="components/css/bootstrap.min.css">
	<link rel="stylesheet" href="components/css/flat-ui-pro.min.css">
	<link rel="stylesheet" href="components/css/bootstrapValidator.min.css">
	<link rel="stylesheet" href="components/css/details.css">
	<title>Register - Learninglight</title>
	<style>
		.input-group {
			width: 100%;
			margin: 10px;
		}
	</style>
</head>
<body ng-controller="Ctrl">
	<div id="wapper"> <div id="main-content">
		<!-- 导航栏 -->
		<div class="container">
			<div class="navbar navbar-default navbar-fixed-top" role="navigation">
				<div class="navbar-header">
					<a href="<%=request.getContextPath()%>/index.jsp" class="navbar-brand">Learninglight</a>
				</div>
				<ul class="nav navbar-nav">
					<li><a href="<%=request.getContextPath()%>/courses.jsp">Courses</a></li>
					<li><a href="<%=request.getContextPath()%>/about.jsp">About</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li id="navLogin">
						<a ng-hide="login_status" href="#loginModal" data-toggle="modal"><span class="fui-exit"></span> LOGIN</a>
						<a ng-show="login_status" href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="fui-home"></span> {{login_name}} <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#resetModal" data-toggle="modal"><span class="glyphicon glyphicon-refresh"></span> Reset password</a></li>
							<li class="divider"></li>
							<li><a href="#" ng-click="logout()"><span class="fui-exit"></span> Log out</a></li>
						</ul>
					</li>
					<li><a href="<%=request.getContextPath()%>/register.jsp" target="_blank"><span class="fui-user"></span> REGISTER</a></li>
				</ul>
			</div>
		</div>

	<!-- login modal -->
	<div class="container">
		<form id="loginModal" class="modal fade" aria-hidden="true" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel">
			<div class="modal-dialog" style="z-index:1050">
				<div class="modal-content" style="padding-left: 0px;padding-right: 0px">
					<div class="modal-header">
						<button type="button" class="close fui-cross" data-dismiss="modal" aria-hidden="true"></button>
						<h1 class="text-left text-primary modal-title" id="loginModalLabel">Login</h1>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
	                                <span class="input-group-addon">
	                                    <i class="fui-user"></i>
	                                </span>
								<input ng-model="login_user_name" class="form-control" id="login_user_name" type="text" name="login_user_name" placeholder="User Name" autocomplete="off">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
		                            <span class="input-group-addon">
			                            <i class="fui-lock"></i>
		                            </span>
								<input ng-model="login_password" class="form-control" id="login_password" type="password" name="login_password" placeholder="Password" autocomplete="off">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<div ng-show="wrong" class="alert alert-danger text-left">
							<strong>{{message}}</strong>
						</div>
						<div class="form-group text-right">
							<button type="button" class="btn btn-lg btn-primary" ng-click="login()">Login now</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- reset modal -->
	<div class="container">
		<form id="resetModal" class="modal fade" aria-hidden="true" tabindex="-1" role="dialog" aria-labelledby="resetModalLabel">
			<div class="modal-dialog" style="z-index:1050">
				<div class="modal-content" style="padding-left: 0px;padding-right: 0px">
					<div class="modal-header">
						<button type="button" class="close fui-cross" data-dismiss="modal" aria-hidden="true"></button>
						<h1 class="text-left text-primary modal-title" id="resetModalLabel">Login</h1>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<div class="input-group">
                            <span class="input-group-addon">
                                <i class="fui-lock"></i>
                            </span>
								<input ng-model="old_password" class="form-control" id="old_password" type="text" name="old_password" placeholder="Old Password" autocomplete="off">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
                            <span class="input-group-addon">
	                            <i class="glyphicon glyphicon-refresh"></i>
                            </span>
								<input ng-model="new_password" class="form-control" id="new_password" type="password" name="new_password" placeholder="New Password" autocomplete="off">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<div ng-show="reset_wrong" class="alert alert-danger text-left">
							<strong>{{reset_message}}</strong>
						</div>
						<div class="form-group text-right">
							<button type="button" class="btn btn-lg btn-primary" ng-click="resetPassword()">Reset now</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- register form -->
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-xs-8" style="margin: 70px auto 50px auto;float: none;">
				<div class="panel panel-primary" style="padding-left: 0px;padding-right: 0px">
					<div class="panel-heading" style="height: 50px;">
						<div class="panel-title" style="text-align: left;">Register</div>
					</div>
					<div class="panel-body">
						<form id="registerForm">
							<div class="form-group" >
								<div class="col-sm-12">
									<div class="input-group">
	                                <span class="input-group-addon">
	                                    <i class="fui-user"></i>
	                                </span>
										<input ng-model="user_name" class="form-control" id="user_name" type="text" name="user_name"  placeholder=" User Name(*required)" autocomplete="off">
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12">
									<div class="input-group">
		                                <span class="input-group-addon">
		                                    <i class="fui-mail"></i>
		                                </span>
										<input ng-model="email_id" class="form-control" id="email_id" type="text" name="email_id"  placeholder=" Email ID(*required)" autocomplete="off">
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12">
									<div class="input-group">
	                                <span class="input-group-addon">
	                                    <i class="fui-lock"></i>
	                                </span>
										<input ng-model="password" class="form-control" id="password" type="password" name="password"  placeholder=" Password(*required)" autocomplete="off">
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12">
									<div class="input-group">
	                                <span class="input-group-addon">
	                                    <i class="fui-lock"></i>
	                                </span>
										<input ng-model="confirm" class="form-control" id="confirm" type="password" name="confirm"  placeholder=" Ensure your Password(*required)" autocomplete="off">
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12">
									<div class="input-group">
										<span class="input-group-addon"><i class="fui-calendar"></i></span>
										<%--<input ng-model="Birthday" class="form-control" id="Birthday" type="text" name="Birthday" placeholder="Birthday" autocomplete="off">--%>
										<input ng-model="Birthday" class="form-control timepicker-with-dropdowns" id="Birthday" type="text" name="Birthday" placeholder="Birthday" autocomplete="off">
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12">
									<div class="input-group">
										<span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
										<input ng-model="phone_number" class="form-control" id="phone_number" type="text" name="phone_number" placeholder="Phone Number" autocomplete="off">
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12">
									<div class="input-group">
										<span class="input-group-addon"><i class="glyphicon glyphicon-globe"></i></span>
										<%--<select ng-model="country" class="form-control" id="country" name="country" autocomplete="off"><option value="" disabled selected>Select your country</option><option value="Afghanistan">Afghanistan</option><option value="Albania">Albania</option><option value="Algeria">Algeria</option><option value="American Samoa">American Samoa</option><option value="Andorra">Andorra</option><option value="Angola">Angola</option><option value="Anguilla">Anguilla</option><option value="Antarctica">Antarctica</option><option value="AG">Antigua and Barbuda</option><option value="AR">Argentina</option><option value="AM">Armenia</option><option value="AW">Aruba</option><option value="AU">Australia</option><option value="AT">Austria</option><option value="AZ">Azerbaijan</option><option value="BH">Bahrain</option><option value="BD">Bangladesh</option><option value="BB">Barbados</option><option value="BY">Belarus</option><option value="BE">Belgium</option><option value="BZ">Belize</option><option value="BJ">Benin</option><option value="BM">Bermuda</option><option value="BT">Bhutan</option><option value="BO">Bolivia</option><option value="BA">Bosnia and Herzegovina</option><option value="BW">Botswana</option><option value="BV">Bouvet Island</option><option value="BR">Brazil</option><option value="IO">British Indian Ocean Territory</option><option value="VG">British Virgin Islands</option><option value="BN">Brunei</option><option value="BG">Bulgaria</option><option value="BF">Burkina Faso</option><option value="BI">Burundi</option><option value="CI">Côte d'Ivoire</option><option value="KH">Cambodia</option><option value="CM">Cameroon</option><option value="CA">Canada</option><option value="CV">Cape Verde</option><option value="KY">Cayman Islands</option><option value="CF">Central African Republic</option><option value="TD">Chad</option><option value="CL">Chile</option><option value="CN">China</option><option value="CX">Christmas Island</option><option value="CC">Cocos (Keeling) Islands</option><option value="CO">Colombia</option><option value="KM">Comoros</option><option value="CG">Congo</option><option value="CK">Cook Islands</option><option value="CR">Costa Rica</option><option value="HR">Croatia</option><option value="CU">Cuba</option><option value="CY">Cyprus</option><option value="CZ">Czech Republic</option><option value="CD">Democratic Republic of the Congo</option><option value="DK">Denmark</option><option value="DJ">Djibouti</option><option value="DM">Dominica</option><option value="DO">Dominican Republic</option><option value="TP">East Timor</option><option value="EC">Ecuador</option><option value="EG">Egypt</option><option value="SV">El Salvador</option><option value="GQ">Equatorial Guinea</option><option value="ER">Eritrea</option><option value="EE">Estonia</option><option value="ET">Ethiopia</option><option value="FO">Faeroe Islands</option><option value="FK">Falkland Islands</option><option value="FJ">Fiji</option><option value="FI">Finland</option><option value="MK">Former Yugoslav Republic of Macedonia</option><option value="FR">France</option><option value="FX">France, Metropolitan</option><option value="GF">French Guiana</option><option value="PF">French Polynesia</option><option value="TF">French Southern Territories</option><option value="GA">Gabon</option><option value="GE">Georgia</option><option value="DE">Germany</option><option value="GH">Ghana</option><option value="GI">Gibraltar</option><option value="GR">Greece</option><option value="GL">Greenland</option><option value="GD">Grenada</option><option value="GP">Guadeloupe</option><option value="GU">Guam</option><option value="GT">Guatemala</option><option value="GN">Guinea</option><option value="GW">Guinea-Bissau</option><option value="GY">Guyana</option><option value="HT">Haiti</option><option value="HM">Heard and Mc Donald Islands</option><option value="HN">Honduras</option><option value="HK">Hong Kong</option><option value="HU">Hungary</option><option value="IS">Iceland</option><option value="IN">India</option><option value="ID">Indonesia</option><option value="IR">Iran</option><option value="IQ">Iraq</option><option value="IE">Ireland</option><option value="IL">Israel</option><option value="IT">Italy</option><option value="JM">Jamaica</option><option value="JP">Japan</option><option value="JO">Jordan</option><option value="KZ">Kazakhstan</option><option value="KE">Kenya</option><option value="KI">Kiribati</option><option value="KW">Kuwait</option><option value="KG">Kyrgyzstan</option><option value="LA">Laos</option><option value="LV">Latvia</option><option value="LB">Lebanon</option><option value="LS">Lesotho</option><option value="LR">Liberia</option><option value="LY">Libya</option><option value="LI">Liechtenstein</option><option value="LT">Lithuania</option><option value="LU">Luxembourg</option><option value="MO">Macau</option><option value="MG">Madagascar</option><option value="MW">Malawi</option><option value="MY">Malaysia</option><option value="MV">Maldives</option><option value="ML">Mali</option><option value="MT">Malta</option><option value="MH">Marshall Islands</option><option value="MQ">Martinique</option><option value="MR">Mauritania</option><option value="MU">Mauritius</option><option value="YT">Mayotte</option><option value="MX">Mexico</option><option value="FM">Micronesia</option><option value="MD">Moldova</option><option value="MC">Monaco</option><option value="MN">Mongolia</option><option value="ME">Montenegro</option><option value="MS">Montserrat</option><option value="MA">Morocco</option><option value="MZ">Mozambique</option><option value="MM">Myanmar</option><option value="NA">Namibia</option><option value="NR">Nauru</option><option value="NP">Nepal</option><option value="NL">Netherlands</option><option value="AN">Netherlands Antilles</option><option value="NC">New Caledonia</option><option value="NZ">New Zealand</option><option value="NI">Nicaragua</option><option value="NE">Niger</option><option value="NG">Nigeria</option><option value="NU">Niue</option><option value="NF">Norfolk Island</option><option value="KP">North Korea</option><option value="MP">Northern Marianas</option><option value="NO">Norway</option><option value="OM">Oman</option><option value="PK">Pakistan</option><option value="PW">Palau</option><option value="PS">Palestine</option><option value="PA">Panama</option><option value="PG">Papua New Guinea</option><option value="PY">Paraguay</option><option value="PE">Peru</option><option value="PH">Philippines</option><option value="PN">Pitcairn Islands</option><option value="PL">Poland</option><option value="PT">Portugal</option><option value="PR">Puerto Rico</option><option value="QA">Qatar</option><option value="RE">Reunion</option><option value="RO">Romania</option><option value="RU">Russia</option><option value="RW">Rwanda</option><option value="ST">São Tomé and Príncipe</option><option value="SH">Saint Helena</option><option value="PM">St. Pierre and Miquelon</option><option value="KN">Saint Kitts and Nevis</option><option value="LC">Saint Lucia</option><option value="VC">Saint Vincent and the Grenadines</option><option value="WS">Samoa</option><option value="SM">San Marino</option><option value="SA">Saudi Arabia</option><option value="SN">Senegal</option><option value="RS">Serbia</option><option value="SC">Seychelles</option><option value="SL">Sierra Leone</option><option value="SG">Singapore</option><option value="SK">Slovakia</option><option value="SI">Slovenia</option><option value="SB">Solomon Islands</option><option value="SO">Somalia</option><option value="ZA">South Africa</option><option value="GS">South Georgia and the South Sandwich Islands</option><option value="KR">South Korea</option><option value="ES">Spain</option><option value="LK">Sri Lanka</option><option value="SD">Sudan</option><option value="SR">Suriname</option><option value="SJ">Svalbard and Jan Mayen Islands</option><option value="SZ">Swaziland</option><option value="SE">Sweden</option><option value="CH">Switzerland</option><option value="SY">Syria</option><option value="TW">Taiwan</option><option value="TJ">Tajikistan</option><option value="TZ">Tanzania</option><option value="TH">Thailand</option><option value="BS">The Bahamas</option><option value="GM">The Gambia</option><option value="TG">Togo</option><option value="TK">Tokelau</option><option value="TO">Tonga</option><option value="TT">Trinidad and Tobago</option><option value="TN">Tunisia</option><option value="TR">Turkey</option><option value="TM">Turkmenistan</option><option value="TC">Turks and Caicos Islands</option><option value="TV">Tuvalu</option><option value="VI">US Virgin Islands</option><option value="UG">Uganda</option><option value="UA">Ukraine</option><option value="AE">United Arab Emirates</option><option value="GB">United Kingdom</option><option value="US">United States</option><option value="UM">United States Minor Outlying Islands</option><option value="UY">Uruguay</option><option value="UZ">Uzbekistan</option><option value="VU">Vanuatu</option><option value="VA">Vatican City</option><option value="VE">Venezuela</option><option value="VN">Vietnam</option><option value="WF">Wallis and Futuna Islands</option><option value="EH">Western Sahara</option><option value="YE">Yemen</option><option value="ZM">Zambia</option><option value="ZW">Zimbabwe</option></select>--%>
										<select ng-model="country" class="form-control" id="country" name="country" autocomplete="off">
											<option value="" disabled selected>Select your country</option>
											<option ng-repeat="c in allCountry" value="{{c}}">{{c}}</option>
										</select>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12">
									<div class="input-group">
										<span class="input-group-addon"><i class="fui-alert-circle"></i></span>
										<input ng-model="captcha" class="form-control" id="captcha" name="captcha" autocomplete="off" type="text" placeholder="Captcha(*required)" style="width: 60%;border-radius: 0 4px 4px 0;">
										<img src="{{imgSrc}}" alt="captcha" style="display: inline;cursor:pointer;width:100px;margin-left:10px;height:42px;" ng-click="changeImg()" id="captchaImg">
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12">
									<div class="input-group">
										<button type="button" class="btn btn-primary btn-block" ng-click="register()">Register</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<footer id="footer">
		<div class="mtl navbar-bottom" style="padding-left: 0;padding-right: 0;">
			<div class="bottom-menu">
				<div class="container">
					<div class="row">
						<div class="text-center">
							<span class="glyphicon glyphicon-copyright-mark"></span>2008 Learninglight Virtual Academy
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	</div>
	<script src="components/js/vendor/jquery.min.js" type="text/javascript"></script>
	<script src="components/js/flat-ui-pro.min.js" type="text/javascript"></script>
	<script src="components/js/angular.min.js" type="text/javascript"></script>
	<script src="components/js/vendor/video.js" type="text/javascript"></script>
	<script type="text/javascript" src="components/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="components/js/register.js"></script>
	<script type="text/javascript">
        $(document).ready(function(){
            init();
        });
        // AngularJs code
        var app = angular.module('myapp', []);
        app.controller('Ctrl', function($scope, $http) {
            $scope.user_name = "";
            $scope.password = "";
            $scope.email_id = "";
            $scope.confirm = "";
            $scope.captcha = "";
            $scope.phone_number = "";
            $scope.birthday = "";
            $scope.country = "";
            $scope.old_password = "";
            $scope.new_password = "";
            $scope.imgSrc = "CaptchaImageServlet";
            $scope.allCountry = ["Albania","Algeria","American Samoa","Andorra","Angola","Anguilla","Antarctica","Antigua and Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia and Herzegovina","Botswana","Bouvet Island","Brazil","British Indian Ocean Territory","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Côte d'Ivoire","Cambodia","Cameroon","Canada","Cape Verde","Cayman Islands","Central African Republic","Chad","Chile","China","Christmas Island","Cocos (Keeling) Islands","Colombia","Comoros","Congo","Cook Islands","Costa Rica","Croatia","Cuba","Cyprus","Czech Republic","Democratic Republic of the Congo","Denmark","Djibouti","Dominica","Dominican Republic","East Timor","Ecuador","Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Faeroe Islands","Falkland Islands","Fiji","Finland","Former Yugoslav Republic of Macedonia","France","France, Metropolitan","French Guiana","French Polynesia","French Southern Territories","Gabon","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guadeloupe","Guam","Guatemala","Guinea","Guinea-Bissau","Guyana","Haiti","Heard and Mc Donald Islands","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Israel","Italy","Jamaica","Japan","Jordan","Kazakhstan","Kenya","Kiribati","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Martinique","Mauritania","Mauritius","Mayotte","Mexico","Micronesia","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Myanmar","Namibia","Nauru","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Niue","Norfolk Island","North Korea","Northern Marianas","Norway","Oman","Pakistan","Palau","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Pitcairn Islands","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","São Tomé and Príncipe","Saint Helena","St. Pierre and Miquelon","Saint Kitts and Nevis","Saint Lucia","Saint Vincent and the Grenadines","Samoa","San Marino","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Georgia and the South Sandwich Islands","South Korea","Spain","Sri Lanka","Sudan","Suriname","Svalbard and Jan Mayen Islands","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","The Bahamas","The Gambia","Togo","Tokelau","Tonga","Trinidad and Tobago","Tunisia","Turkey","Turkmenistan","Turks and Caicos Islands","Tuvalu","US Virgin Islands","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States","United States Minor Outlying Islands","Uruguay","Uzbekistan","Vanuatu","Vatican City","Venezuela","Vietnam","Wallis and Futuna Islands","Western Sahara","Yemen","Zambia","Zimbabwe"];
            $scope.changeImg = function() {
                var time = new Date().getTime(); //防止由于缓存而不更新图片
                $scope.imgSrc ="<%=request.getContextPath()%>/CaptchaImageServlet?d="+time;
            }
            $scope.register = function(){
                $('#registerForm').data('bootstrapValidator').validate();
                if($('#registerForm').data('bootstrapValidator').isValid()){
                    $http({
                        method: 'post',
                        url: '/RegisterServlet',
                        params: {user_name:$scope.user_name,
                            password:$scope.password,
                            email_id:$scope.email_id,
                            confirm:$scope.confirm,
                            captcha:$scope.captcha,
                            phone_number:$scope.phone_number,
                            birthday:$scope.birthday,
                            country:$scope.country}
                    }).then(function successCallback(response) {
                        window.location.href = '<%=request.getContextPath()%>/index.jsp';
                    }, function errorCallback(response) {
                        if(response.data == "Database connect failed") {
                            window.location.href = '<%=request.getContextPath()%>/error.jsp';
                        } else {
                            $('#registerForm')
                                .data('bootstrapValidator')
                                .updateStatus(response.data, 'INVALID', 'callback')
                                .validateField(response.data);
                            var time = new Date().getTime(); //防止由于缓存而不更新图片
                            $scope.imgSrc ="<%=request.getContextPath()%>/CaptchaImageServlet?d="+time;
                        }
                    });
                }
            };
            $scope.wrong = false;
            $scope.login_user_name = "";
            $scope.login_password = "";
            $scope.message = "";
            <% if (session.getAttribute("user_name") == null) { %>
            $scope.login_status = false;
            <% } else { %>
            $scope.login_status = true;
            $scope.login_name = '<%=session.getAttribute("user_name")%>';
            <% } %>
            $scope.login = function() {
                $http({
                    method: 'post',
                    url: '/LoginServlet',
                    params: {user_name:$scope.user_name, password:$scope.password}
                }).then(function successCallback(response) {
                    $scope.wrong = false;
                    $scope.success = false;
                    $scope.login_name = $scope.user_name;
                    $scope.login_status = true;
                    $("#loginModal").modal('hide');
                }, function errorCallback(response) {
                    $scope.success = false;
                    $scope.message = response.data;
                    $scope.wrong = true;
                });
            }
            $scope.logout = function() {
                $http({
                    method: 'post',
                    url: '/LogoutServlet'
                }).then(function successCallback(response) {
                    $scope.login_status = false;
                }, function errorCallback(response) {

                });
            }
            $scope.resetPassword = function() {
                $http({
                    method: 'post',
                    url: '/ResetPasswordServlet',
                    params: {old_password:$scope.old_password, new_password:$scope.new_password}
                }).then(function successCallback(response) {
                    $http({
                        method: 'post',
                        url: '/LogoutServlet'
                    }).then(function successCallback(response) {
                        $scope.login_status = false;
                        window.location.href = "index.jsp";
                    }, function errorCallback(response) {
                    });
                }, function errorCallback(response) {
                    $scope.success = false;
                    $scope.reset_message = response.data;
                    $scope.reset_wrong = true;
                });
            }
        });
	</script>
</body>
</html>
