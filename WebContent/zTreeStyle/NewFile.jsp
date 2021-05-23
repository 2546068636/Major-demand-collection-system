<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>网站注册页面</title>
        <style>
            #contanier{
                border: 0px solid white;
                width: 1300px;
                margin: auto;
            }
            
            #top{
                border: 0px solid white;
                width: 100%;
                height: 50px;
            }
            #menu{
                border: 0px solid white;
                height: 40px;
                background-color: black;
                padding-top: 10px;
                margin-bottom: 15px;
                margin-top: 10px;
            }
            .top{
                border: 0px solid white;
                width: 405px;
                height: 100%;
                float: left;
                padding-left: 25px;
            }
            #top1{
                padding-top: 15px;
            }
            #bottom{
                margin-top: 13px;
                text-align: center;
            }
            
            #form{
                height: 500px;
                padding-top: 70px;
                background-image: url(img/regist_bg.jpg);
                margin-bottom: 10px;
            }
            a{
                text-decoration: none;
            }
            
            label.error{
                padding-left: 30px;
                font-family:georgia;
                font-size: 15px;
                font-style: normal;
                color: red;
            }
            
            label.success{
                background:url(img/checked.gif) no-repeat 10px 3px;
                padding-left: 30px;
            }
            
            #father{
                border: 0px solid white;
                padding-left: 307px;
            }
            
            #form2{
                border: 5px solid gray;
                width: 660px;
                height: 450px;
            }
            
        </style>
            <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<!--             validate.js是建立在jQuery之上的，因此需要先导入jQuery的类库 -->
            <script type="text/javascript" src="js/jquery.validate.min.js"></script>
<!--             导入jQuery的类库 -->
            <script type="text/javascript" src="js/messages_zh.js"></script>
<!--             导入国家化处理类库 -->
<!--             顺序必须先导入jQuery的类库再导入validate和国际化处理的类库 -->
<script>
$(function(){
    $("#registForm").validate({
        rules:{
            user:{
                required:true,
                minlength:3
            },
            password:{
                required:true,
                digits:true,
                minlength:6
            },
            repassword:{
                required:true,
                equalTo:"[name='password']"
            },
            email:{
                required:true,
                email:true
            },
            username:{
                required:true,
                maxlength:5
            },
            sex:{
                required:true
            }
        },
            messages:{
                user:{
                    required:"用户名不为空",
                    minlength:"最小长度为3"
                },
                password:{
                    required:"密码不为空",
                    minlength:"最小长度为6",
                    digits:"密码必须为数字"
                },
                repassword:{
                    required:"确认密码不能为空",
                    equalTo:"与之前的密码不相等"
                    
                },
                email:{
                    required:"邮箱不为空",
                    email:"邮箱格式不正确"
                },
                username:{
                    required:"用户名不为空",
                    maxlength:"最大长度为5"
                },
                sex:{
                    required:"性别不为空"
                }    
            },
            errorElement:"label",<!--用来创建错误提示信息标签 validate插件默认的就是label-->
            success:function(label){<!-- 验证成功后执行的回调方法-->
            //label指向上面错误提示信息的标签label
            label.text(" ")//将文本内容清空
            .addClass("success");//添加自己定义的success类
                
            }
            
        
            
        });
        
    });
    </script>
    </head>
    <body>
        <div id="contanier">
            <div id="form">
                <form action="#" method="get" id="registForm">
                    <div id="father">
                        <div id="form2">
                            <table border="0px" width="100%" height="100%" align="center" cellpadding="0px" cellspacing="0px" bgcolor="white">
                                <tr>
                                    <td colspan="2" >
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <font size="5">会员注册</font>&nbsp;&nbsp;&nbsp;USER REGISTER 
                                    </td>
                                </tr>
                                <tr>
                                    <td width="180px">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;
                                        <label for="user" >用户名</label>
                                    </td>
                                    <td>
                                        <em style="color: red;">*</em>&nbsp;&nbsp;&nbsp;<input type="text" name="user" size="35px" id="user"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;
                                        密码
                                    </td>
                                    <td>
                                        <em style="color: red;">*</em>&nbsp;&nbsp;&nbsp;<input type="password"  name="password" size="35px" id="password" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;
                                        确认密码
                                    </td>
                                    <td>
                                        <em style="color: red;">*</em>&nbsp;&nbsp;&nbsp;<input type="password" name="repassword" size="35px"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;
                                        Email
                                    </td>
                                    <td>
                                        <em style="color: red;">*</em>&nbsp;&nbsp;&nbsp;<input type="text" name="email" size="35px" id="email"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;
                                        姓名
                                    </td>
                                    <td>
                                        <em style="color: red;">*</em>&nbsp;&nbsp;&nbsp;<input type="text" name="username" size="35px"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;
                                        性别
                                    </td>
                                    <td>
                                        <span style="margin-right: 155px;">
                                            <em style="color: red;">*</em>&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" value="男"/>男
                                            <input type="radio" name="sex" value="女"/>女<em></em>
                                            <label for="sex" class="error" style="diaplay:none"></label>
                                        </span>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;
                                        出生日期
                                    </td>
                                    <td>
                                        <em style="color: red;">*</em>&nbsp;&nbsp;&nbsp;<input type="text" name="birthday"  size="35px"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;
                                        验证码
                                    </td>
                                    <td>
                                        <em style="color: red;">*</em>&nbsp;&nbsp;&nbsp;<input type="text" name="yanzhengma" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="submit" value="注      册" height="50px"/>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>