<%--
  Created by IntelliJ IDEA.
  User: 21989
  Date: 2020/6/5
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://"
          + request.getServerName() + ":" + request.getServerPort()
          + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
  <base href="<%=basePath%>">

  <%--图标--%>
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/m1.png">

  <title>前台登录页面</title>
  <!-- 屏幕和设备的屏幕一致，初始缩放为1:1，进制用户缩放 -->
  <meta name="viewport"
        content="width=device-width,initial-scale=1,user-scalable=no">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">
  <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
  <meta http-equiv="description" content="This is my page">

  <!-- 引入外部的bootstrap中的css文件 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- jquery文件，务必在bootstrap.min.js之前引入 -->
  <script type="text/javascript" src="jquery/jquery.min.js"></script>
  <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

  <!-- 引入自定义样式 -->
  <link rel="stylesheet" href="css/index.css">
  <script type="text/javascript" src="js/index.js">

  </script>

  <script type="text/javascript">
    function refreshCode() {
      //获取图片对象
      var img = document.getElementById("changeCode");
      img.onclick = function () {
        //获取时间戳
        var date = new Date().getTime();
        <%--img.src = "${pageContext.request.contextPath}/checkCode.action?date=" + date;--%>
          img.src = "${pageContext.request.contextPath}/checkCode.action?date=" + date;
      }
    }
  </script>
</head>

<body>
<!-- bootstrap布局容器    固定宽度  1170px  -->
<div class="container">
  <div class="row">
    <div class="col-md-4 col-md-offset-4 col-xs-10 col-xs-offset-1">
      <!-- 登录主体框 -->
      <div class="main-box" style="background: rgba(255, 255, 255, 0.6)">
        <img  class="img-responsive" alt="财务管理系统" src="${pageContext.request.contextPath}/images/logo.jpg" id="logo">
        <hr />
        <h3>用户登录</h3>
        <form
                action="${pageContext.request.contextPath}/user/login.action "
                id="myform" method="post" onsubmit="return validateForm()">
          <!-- 输入框组 -->
          <!-- 用户名或者密码输入错误，请重新输入 -->
          <div>
            <label id="msgLabel">${msg}</label>
          </div>
          <!-- 输入框组 -->
          <div class="form-group">
            <div class="input-group">
              <div class="input-group-addon">
                <!-- <div class="input-group-addon">用户名</div> -->
                <span class="glyphicon glyphicon-user" id="icon"></span>
              </div>
              <input type="text" class="form-control" placeholder="请输入用户名"
                     name="username" id="username">
              <!-- required="required" -->
            </div>
          </div>

          <!-- 输入框组 -->
          <div class="form-group">
            <div class="input-group">
              <div class="input-group-addon">
                <!-- <div class="input-group-addon">密码</div> -->
                <span class="glyphicon glyphicon-lock" id="icon"></span>
              </div>
              <input type="password" class="form-control" placeholder="请输入密码"
                     name="password" id="password">
              <!-- required="required" -->
            </div>
<%--            <label id="passwordLabel"></label>--%>
          </div>

          <%-- 输入框组--%>
          <div class="form-group">
            <div class="input-group">
              <div class="input-group-addon">
                <span class="glyphicon glyphicon-barcode" id="icon"></span>
              </div>
              <input type="text" class="form-control" placeholder="请输入验证码"
                     name="checkCode" id="checkCode"  style="width: 62%; float: left">
<%--              <img src="${pageContext.request.contextPath}/checkCode.action" title="看不清点击刷新" id="changeCode"--%>
<%--                   style="width: 35%; float: right" onclick="refreshCode();" >--%>
                <img src="${pageContext.request.contextPath}/checkCode.action" title="看不清点击刷新" id="changeCode"
                     style="width: 35%; float: right" onclick="refreshCode();" >
            </div>
            <label id="passwordLabel"></label>
          </div>

          <!-- 输入框组 -->
          <div class="form-group">
            <input type="submit" value="登录"
                   class="btn btn-primary  loginbtn" id="loginbtn"> <input
                  type="reset" value="重置" class="btn btn-primary  resetbtn">
          </div>
          <!-- 输入框组 -->
          <div class="form-group a">
            <a href="${pageContext.request.contextPath}/admin/index.jsp" class="pull-left" style="color: black; font-weight: bold">管理员登录</a>
            <!-- 忘记密码   触发模态框 -->
            <a href="#" data-toggle="modal" data-target="#passwordModal">
              忘记密码 </a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}/regist.jsp">免费注册</a>
          </div>

        </form>
      </div>
      <!-- col-md-4 -->
    </div>
    <!-- row -->

    <!-- row -->
    <div class="row">
      <div class="col-md-4 col-md-offset-4 col-xs-10 col-xs-offset-1">
        <!-- 忘记密码模态框passwordModal -->
        <div class="modal fade" id="passwordModal" tabindex="-1" role="dialog"
             aria-labelledby="passwordModal-label" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <!-- 为模态窗口的头部定义样式的类 -->
              <div class="modal-header">
                <!-- &times; -->
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">
                  <span class="glyphicon glyphicon-remove myclosebtn"></span>
                </button>
                <h4 class="modal-titile" id="passwordModal-label">忘记密码</h4>
              </div>

              <form id="passwordform" method="post" action="${pageContext.request.contextPath}/user/findPassword.action">
                <!-- 为模态窗口的主体设置样式 -->
                <div class="modal-body">
                  <!-- 错误提示标签 -->
                  <label id="forgetmsg"></label>
                  <!--这里添加一些文本【主体】  -->
                  <div class="form-group">
                    <label for="username">用户名</label> <input type="text"
                                                             name="username" id="form2-username" class="form-control"
                                                             required="required" placeholder="请输入用户名">
                  </div>
                  <div class="form-group">
                    <label for="password">新密码</label> <input type="password"
                                                             name="password" id="form2-password" class="form-control"
                                                             required="required" placeholder="请输入新密码">
                  </div>
                  <div class="form-group">
                    <label for="repassword">确认密码</label> <input type="password"
                                                                name="repassword" id="form2-repassword" class="form-control"
                                                                required="required" placeholder="请再次输入新密码">
                  </div>

                  <div class="form-group form-inline">
                      <div>
                          <label for="phone">手机号</label>
                      </div>
                      <input type="text" name="phone" id="phone" class="form-control col-xs-8" required="required" placeholder="请输入手机号">
                      <input type="button" name="msgcodebt" value="获取验证码" style="float: right;" id="msgcodebt" class="form-control col-xs-4 btn-default">
                  </div>

                  <%--隐藏提示框--%>
                  <div id="disappare" style="display: none">
                    <p style="vertical-align: middle; line-height: 40px">验证码发送成功</p>
                  </div>

                    <div class="form-group" >
                        <br><br>
                        <label for="msgcode">验证码</label>
                        <input type="text" name="msgCode" id="msgcode" class="form-control" required="required" placeholder="请输入手机验证码">
                     </div>
                </div>

                <!-- 为模态窗口的底部设置样式 -->
                <div class="modal-footer">
                  <button type="button" class="btn btn-default myclosebtn"
                          data-dismiss="modal">关闭</button>
                  <button type="submit" id="changePasswordbtn"
                          class="btn btn-primary">提交更改</button>
                </div>
              </form>

            </div>
          </div>
        </div>
        <!-- 忘记密码模态框passwordModal -->
      </div>
    </div>
  </div>
  <!--main-box  -->
</div>
<!-- container -->


</body>
</html>