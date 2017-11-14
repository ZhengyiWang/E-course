<%@ page import="classes.MariaConnection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="classes.CourseInfo" %><%--
  Created by IntelliJ IDEA.
  User: cfenglv
  Date: 2016/12/26
  Time: 17:40
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
	<title>Courses - Learninglight</title>

	<link rel="stylesheet" href="components/css/bootstrap.min.css">
	<link rel="stylesheet" href="components/css/flat-ui-pro.min.css">
	<link rel="stylesheet" href="components/css/details.css">

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

		.popover-inner{
			padding-left: 0;
			padding-right: 0;
		}
	</style>
</head>
	<body ng-controller="Ctrl">
	<!-- 导航栏 -->
	<div id="wapper"> <div id="main-content">
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
		<!-- exam modal -->
		<div class="container">
			<form id="examModal" class="modal fade" aria-hidden="true" tabindex="-1" role="dialog" aria-labelledby="examModalLabel">
				<div class="modal-dialog" style="z-index:1050">
					<div class="modal-content" style="padding-left: 0px;padding-right: 0px">
						<div class="modal-header">
							<button type="button" class="close fui-cross" data-dismiss="modal" aria-hidden="true"></button>
							<h1 class="text-left text-primary modal-title" id="examModalLabel">Login</h1>
						</div>
						<div class="modal-body">

						</div>
						<div class="modal-footer">
							<div ng-show="exam_wrong" class="alert alert-danger text-left">
								<strong>{{message}}</strong>
							</div>
							<div class="form-group text-right">
								<button type="button" class="btn btn-lg btn-primary" ng-click="exam()">Login now</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>


		<div class="container" style="padding-top: 100px">
			<div class="row" style="padding-left:0;padding-right:0">
				<div>
					<div ng-show="learn_wrong" class="alert alert-danger text-left">
						<strong>{{message}}</strong>
					</div>
					<div ng-show="learn_success" class="alert alert-success text-left">
						<strong>{{message}}</strong>
					</div>
				</div>
				<div class="col-md-12">
					<div class="tabbable">
						<ul id="myTab" class="nav nav-tabs nav-append-content">
							<li class="active"><a href="#all" data-toggle="tab">All</a></li>
							<%--<li><a href="#Learning" data-toggle="tab">Learning</a></li>--%>
							<li><a href="#completed" data-toggle="tab">Completed</a></li>
						</ul>
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane fade in active" id="all">
								<div class="row">
									<%
										MariaConnection mariaConnection = new MariaConnection();
										Statement stmt = mariaConnection.getStatement();
										String sql = "select * from course";
										if(stmt == null) {
											pageContext.forward("error.jsp");
											return;
									    } else {
										try (ResultSet rs = stmt.executeQuery(sql)) {
											while(rs.next()) {
												String course_name = rs.getString(1);
												String file_name = course_name.replace("#", "Sharp");
												String url_name = file_name;
												url_name = url_name.replace("+", "p");
												String id_name = url_name.replace(".", "dot");
												String course_intro = rs.getString(3);
									%>

									<div class="col-sm-6 col-md-3">
										<div class="thumbnail" style="padding-bottom: 0;min-height: 248px" >
											<a href="details.jsp?course_name=<%=url_name%>"><img src="components/img/<%=file_name%>.jpg" alt="<%=course_name%>" style="min-height:120px"></a>
											<div class="caption" style="padding-top: 0">
												<a href="details.jsp?course_name=<%=url_name%>">
													<h3 style="padding-top: 5px;margin-top: 5px" class="text-center"><%=course_name%></h3>
												</a>
												<p class="text-center">
													<div class="row text-center">
														<div style="padding-bottom: 5px">
															<a id="<%=id_name%>-add" uib-popover="<%=course_intro%>" ng-click="addCourse('<%=course_name%>','#<%=id_name%>-add')"
														        popover-title="Course Introduction" popover-trigger="'mouseenter'"
														        popover-append-to-body="true" popover-animation="true" class="btn btn-primary">
															Add to profile
															</a>
														</div>
														<div>
															<a id="<%=id_name%>-del" uib-popover="<%=course_intro%>" ng-click="deleteCourse('<%=course_name%>','#<%=id_name%>-del')"
															   popover-title="Course Introduction" popover-trigger="'mouseenter'"
															   popover-append-to-body="true" popover-animation="true" class="btn btn-primary">
																Delete from profile
															</a>
														</div>
													</div>
												</p>
											</div>
										</div>
									</div>
									<%			}
									} catch (SQLException e) {
										e.printStackTrace();
									}
									}
									%>
								</div>
							</div>
							<%
								sql = "select user_rel_course.course_name, learned, course_number, course_list, score " +
										"from user_rel_course left join course on user_rel_course.course_name = course.course_name" +
										" where user_name = '" + session.getAttribute("user_name") + "'";
								ArrayList<CourseInfo> array = new ArrayList<>();
								try (ResultSet rs = stmt.executeQuery(sql)) {
									while(rs.next()) {
										array.add(new CourseInfo(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
									}
								}catch (SQLException e) {
									e.printStackTrace();
								}
							%>
							<div class="tab-pane fade" id="completed">
								<div class="row">
								<%
									int len = array.size();
									for(CourseInfo tmp : array) {
										if(tmp.check()) {
											String course_name = tmp.getCourse_name();
											String file_name = course_name.replace("#", "Sharp");
											String url_name = file_name;
											url_name = url_name.replace("+", "p");
								%>
								<div class="col-sm-6 col-md-3">
									<div class="thumbnail" style="padding-bottom: 0;min-height: 248px" >
										<a href="details.jsp?course_name=<%=url_name%>"><img src="components/img/<%=file_name%>.jpg" alt="<%=course_name%>" style="min-height:120px"></a>
										<div class="caption" style="padding-top: 0">
											<a href="details.jsp?course_name=<%=url_name%>">
												<h3 style="padding-top: 5px;margin-top: 5px" class="text-center"><%=course_name%></h3>
											</a>
											<p class="text-center">
												<%
													if(tmp.getScore() < 0) { %>
												<a class="btn btn-primary" href="<%=request.getContextPath()%>/exam.jsp?course_name=<%=url_name%>">
													Take the exam
												</a>
												<%	} else { %>
												<a class="btn btn-info">
													Score:<%=String.format("%.2f", tmp.getScore())%>
												</a>
												<%}%>

											</p>
										</div>
									</div>
								</div>
								<%		}
									}
								%>
								</div>
							</div>
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
		<script src="components/js/ui-bootstrap-tpls-2.3.1.min.js" type="text/javascript"></script>
		<script type="text/javascript">

			//tab activate
            $('#myTab a').click(function (e) {
                e.preventDefault();
                $(this).tab('show');
            })

            // AngularJs code
            var app = angular.module('myapp', ['ui.bootstrap']);
            app.controller('Ctrl', function($scope, $http) {
                $scope.wrong = false;
                $scope.user_name = "";
                $scope.password = "";
                $scope.message = "";
                $scope.old_password = "";
                $scope.new_password = "";
                $scope.learn_wrong = false;
                $scope.learn_success = false;
                <% if (session.getAttribute("user_name") == null) { %>
                $scope.login_status = false;
                <% } else { %>
                $scope.login_status = true;
                $scope.login_name = '<%=session.getAttribute("user_name")%>';
                <% } %>
                <% String back = request.getParameter("back");
                   String exam_back = request.getParameter("exam_back");
                   String course_back = request.getParameter("exam_back");
                   String user_back = request.getParameter("user_back");
                   String already_back = request.getParameter("already_back");
                if(back != null && back.equals("1")) { %>
                $scope.message = "This course is not in your profile, you can't learn it.";
                $scope.learn_wrong = true;
                <%} else if(exam_back != null && exam_back.equals("1")) { %>
                $scope.message = "This course is not completed yet, you can't take this exam.";
                $scope.learn_wrong = true;
                <%} else if(course_back != null && course_back.equals("1")) { %>
                $scope.message = "This course is not existed.";
                $scope.learn_wrong = true;
                <%} else if(user_back != null && user_back.equals("1")) { %>
                $scope.message = "You haven't login yet.";
                $scope.learn_wrong = true;
                <%} else if(already_back != null && already_back.equals("1")) { %>
                $scope.message = "You have taken the exam already.";
                $scope.learn_wrong = true;
                <%}%>
                $scope.login = function() {
                    $http({
                        method: 'post',
                        url: '/LoginServlet',
                        params: {user_name:$scope.user_name, password:$scope.password}
                    }).then(function successCallback(response) {
                        window.location.href = '<%=request.getContextPath()%>/courses.jsp';
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
                $scope.addCourse = function(obj, id) {
                    $http({
                        method: 'post',
                        url: '/LearnServlet',
                        params: {course_name:obj}
                    }).then(function successCallback(response) {
                        $scope.learn_wrong = false;
                        $scope.message = "Course added to profile";
                        $scope.learn_success = true;
                        $(id).removeClass().addClass('btn btn-success');
                    }, function errorCallback(response) {
                        $scope.learn_success = false;
                        $scope.message = response.data;
                        $scope.learn_wrong = true;
                        $(id).removeClass().addClass('btn btn-danger');
                    });
                }
                $scope.deleteCourse = function(obj, id) {
                    $http({
                        method: 'post',
                        url: '/DeleteServlet',
                        params: {course_name:obj}
                    }).then(function successCallback(response) {
                        $scope.learn_wrong = false;
                        $scope.message = "Course deleted from profile";
                        $scope.learn_success = true;
                        $(id).removeClass().addClass('btn btn-success');
                    }, function errorCallback(response) {
                        $scope.learn_success = false;
                        $scope.message = response.data;
                        $scope.learn_wrong = true;
                        $(id).removeClass().addClass('btn btn-danger');
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
