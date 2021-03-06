<%@ page import="classes.MariaConnection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="classes.ProblemInfo" %>
<%@ page import="java.util.DoubleSummaryStatistics" %><%--
  Created by IntelliJ IDEA.
  User: cfenglv
  Date: 2016/12/28
  Time: 20:39
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
		<link rel="stylesheet" href="components/css/details.css">
		<title>Exam - Learninglight</title>
		<style>
			html, body {
				margin: 0;
				padding: 0;
			}
			* {
				box-sizing: border-box;
			}
			.input-group {
				width: 100%;
				margin: 10px;
			}
		</style>
		<%session.setMaxInactiveInterval(100000);%>
		<%
			request.setCharacterEncoding("utf-8");
			String user_name = (String)request.getSession().getAttribute("user_name");
			String course_name =  request.getParameter("course_name");
			if(user_name == null) {
				response.sendRedirect("courses.jsp?user_back=1");
				return ;
			}
			if(course_name == null || course_name == "") {
				response.sendRedirect("courses.jsp?exam_back=1");
				return ;
			}
			course_name = course_name.replace("Sharp", "#");
			course_name = course_name.replace("Cpp", "C++");
			MariaConnection mariaConnection = new MariaConnection();
			Statement stmt = mariaConnection.getStatement();
			if(stmt == null) {
				pageContext.forward("error.jsp");
				return;
			}
			String sql = "select score from user_rel_course where user_name = '" + user_name + "' and course_name = '" + course_name + "'";
			try (ResultSet rs = stmt.executeQuery(sql))  {
				if(rs.next()) {
					String score = rs.getString(1);
					double tmp = Double.parseDouble(score);
					if(tmp >= 0) {
						response.sendRedirect("courses.jsp?already_back=1");
						return ;
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		%>
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
										<input ng-model="user_name" class="form-control" id="user_name" type="text" name="user_name" placeholder="User Name" autocomplete="off">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
				                            <span class="input-group-addon">
					                            <i class="fui-lock"></i>
				                            </span>
										<input ng-model="password" class="form-control" id="password" type="password" name="password" placeholder="Password" autocomplete="off">
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
			<!-- exam form -->
			<div class="container" style="padding-top: 100px">
				<div class="row">
					<div class="col-lg-12 col-xs-12" style="margin: 70px auto 50px auto;float: none;">
						<div class="panel panel-primary" style="padding-left: 0px;padding-right: 0px">
							<div class="panel-heading" style="height: 50px;">
								<div class="panel-title" style="text-align: left;">
									<%=course_name%> - Exam
								</div>
							</div>
							<div class="panel-body">
								<button type="button" class="btn btn-primary" style="width: 100%" ng-click="submit_choice()">Submit your answer</button>
								<table class="table table-hover" style="margin-top: 50px;">
									<tr>
										<td style="text-align: center;">Question</td>
										<td style="text-align: center; border-left:#cccccc solid 1px;">Options</td>
									</tr>
									<%
										sql = "select problem from exam where course_name = '" + course_name + "'";
										int pro_cnt = 1;
										try (ResultSet rs = stmt.executeQuery(sql)) {
											if (rs.next()) {
												String problem = rs.getString(1);
												String[] problems = problem.split("p\\|\\|p");
												int len = problems.length, cnt = 0;
												pro_cnt = (len + 1) / 5;
												for(int i = 0; i < len; i += 5, ++cnt) {
													ProblemInfo pro = new ProblemInfo(problems[i], problems[i+1], problems[i+2], problems[i+3], problems[i+4]);
												%>
									<tr>
										<td style="text-align: left;"><%=pro.getProblem()%></td>
										<td style="text-align: left; border-left:#cccccc solid 1px;">
											<div style="float: left"><input type="radio" id="<%=cnt%>_a" name="<%=cnt%>" ng-click="change(<%=cnt%>, 'A')"><label for="<%=cnt%>_a"><%=pro.getA()%></label></div>
											<div style="float: left"><input type="radio" id="<%=cnt%>_b" name="<%=cnt%>" ng-click="change(<%=cnt%>, 'B')"><label for="<%=cnt%>_b"><%=pro.getB()%></label></div>
											<div style="float: left"><input type="radio" id="<%=cnt%>_c" name="<%=cnt%>" ng-click="change(<%=cnt%>, 'C')"><label for="<%=cnt%>_c"><%=pro.getC()%></label></div>
											<div style="float: left"><input type="radio" id="<%=cnt%>_d" name="<%=cnt%>" ng-click="change(<%=cnt%>, 'D')"><label for="<%=cnt%>_d"><%=pro.getD()%></label></div>
										</td>
									</tr>
												<%}
											} else {
												response.sendRedirect("courses.jsp?course_back=1");
												return ;
											}
										} catch (SQLException e) {
											e.printStackTrace();
										}
									%>
								</table>
								<button type="button" class="btn btn-primary" style="width: 100%" ng-click="submit_choice()">Submit your answer</button>
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
		<script src="components/js/vendor/video.js" type="text/javascript"></script>
		<script src="components/js/flat-ui-pro.min.js" type="text/javascript"></script>
		<script src="components/js/angular.min.js" type="text/javascript"></script>
		<script type="text/javascript">
		    // AngularJs code
		    var app = angular.module('myapp', []);
		    app.controller('Ctrl', function($scope, $http) {
		        $scope.wrong = false;
		        $scope.user_name = "";
		        $scope.password = "";
		        $scope.message = "";
                $scope.choices = [];
                $scope.old_password = "";
                $scope.new_password = "";
                for(var i = 0; i < <%=pro_cnt%>; ++i)
                    $scope.choices[i] = ' ';
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
                $scope.change = function(idx, choice){
                    $scope.choices[idx] = choice;
                };
                $scope.submit_choice = function() {
                    var cc = "";
                    for(var i = 0; i < <%=pro_cnt%>; ++i)
                        cc += $scope.choices[i] + ",";
                    $http({
                        method: 'post',
                        url: '/ExamServlet',
                        params: {choices:cc, course_name:'<%=course_name%>'}
                    }).then(function successCallback(response) {
                        window.location.href = '<%=request.getContextPath()%>/courses.jsp';
                    }, function errorCallback(response) {
                        window.location.href = '<%=request.getContextPath()%>/error.jsp';
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