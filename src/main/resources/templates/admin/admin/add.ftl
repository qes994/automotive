<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加管理员</title>
    <link rel="stylesheet" type="text/css" href="/admin/layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="/admin/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="/admin/css/style7.css"/>
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1516038_9xj3nqitnch.css"/>
    <link  rel="stylesheet" href="//at.alicdn.com/t/font_1597383_cm5k7u5qtoq.css"  />
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <#include "../common/head.ftl"/>
  <#include "../common/right.ftl"/>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <div class="box">
                <form class="layui-form" action="">
                    <div class="layui-form-item">
                        <label class="layui-form-label">用户名</label>
                        <div class="layui-input-inline">
                            <input type="text" name="name" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">手机号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="phone" required lay-verify="required" placeholder="请输入手机号" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">密码框</label>
                        <div class="layui-input-inline">
                            <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">选择框</label>
                        <div class="layui-input-inline">
                            <select name="roleId" lay-verify="required">
                                <option value=""></option>
                                <option value="1">老板</option>
                                <option value="2">经理</option>
                                <option value="3">组长</option>
                            </select>
                        </div>
                    </div>
                   <#-- <div class="layui-form-item">
                        <label class="layui-form-label">上传头像</label>
                        <div class="layui-input-block">
                            <div id="test1" class="like-uploader-wrapper" id="contents">
                                <input id="images" type="hidden" name="head" autocomplete="off" class="layui-input">
                                <img src="" id="demo1" height="100px">
                                <div class="like-uploader-selector" id="btn1">
                                <span class="like-upload">
                                    <i aria-label="图标: plus" class="anticon anticon-plus">
                                        <i class="iconfont icon-addTodo-nav"></i>
                                    </i>
                                </span>
                                </div>

                                <p id="demoText"></p>
                            </div>
                        </div>
                    </div>-->
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button id="btn" class="layui-btn" type="button">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <#include "../common/footer.ftl"/>
    </div>


</div>

<script type="text/javascript" src="/admin/layui/layui.all.js"></script>
<script type="text/javascript" src="/admin/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/admin/plugins/jparticle.min.js"></script>
<script>
    var element = layui.element;
    var form=layui.form
    $("#btn").click(function(){
        var data = {}
        var froms = $("form").serializeArray();
        $.each(froms,function () {
            data[this.name]=this.value;
        })
        var admin = JSON.stringify(data);//转换成字符串
        console.log(admin)
        $.ajax({
            url:"/admin/admin/addAdmin",
            contentType:"application/json;charset=utf-8",
            data:admin,
            type:'POST',
            success:function(data){
                console.log(data)
                if (data.code==1){
                    layer.msg(data.msg);
                }
                layer.msg(data.msg);
            }
        })
    })

    layui.use(["element", "jquery", "layer", "upload", "form"], function () {
        var form = layui.form;
        var $ = layui.jquery;
        var upload = layui.upload;
        var layer = layui.layer;
        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            , field: "file"
            , url: '/upload/image'
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                if (res.code == 1) {
                    console.log(res)
                    $("#images").val(res.url)
                    return layer.msg('上传成功');
                }
                return layer.msg('上传失败');
            }
        });
    })

</script>

</body>
</html>