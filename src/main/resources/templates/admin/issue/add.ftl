<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加发布</title>
    <link rel="stylesheet" type="text/css" href="/admin/layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="/admin/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="/admin/css/style7.css"/>
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1516038_9xj3nqitnch.css"/>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <#include "../common/head.ftl"/>
  <#include "../common/right.ftl"/>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <div class="box">
                <form class="layui-form" id="form" method="post">
                    <div class="layui-form-item">
                        <label class="layui-form-label">标题</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" required lay-verify="required" placeholder="请输入发布标题" value=""
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">所属类型</label>
                        <div class="layui-input-block">
                            <select name="topic_id" lay-verify="required">
                                <option value="">请选择车型</option>
                                <option value="1">售卖</option>
                                <option value="2">求购</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">价格</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" required lay-verify="required" placeholder="请输入价格" value=""
                                   autocomplete="off" class="layui-input">万
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">所属品牌</label>
                        <div class="layui-input-block">
                            <input type="text"  placeholder="请选择汽车品牌" value="${brand!}" readonly="readonly"/>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">所属车型</label>
                        <div class="layui-input-block">
                            <select name="topic_id" lay-verify="required">
                                <option value="">请选择车型</option>
                                <option value="2">求助</option>
                                <option value="3">吐槽</option>
                                <option value="4">社区</option>
                                <option value="5">系统</option>
                                <option value="6">热门</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">上传图片</label>
                        <div class="layui-input-block">
                            <div class="like-uploader-wrapper" id="contents">
                                <input type="hidden" name="cover">
                                <div class="like-uploader-selector" id="btn1">
                                <span class="like-upload">
                                    <i aria-label="图标: plus" class="anticon anticon-plus">
                                        <i class="iconfont icon-addTodo-nav"></i>
                                    </i>
                                </span>
                                </div>
                                <div id="cover"></div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">详情</label>
                        <div class="layui-input-block">
                            <textarea name="details" placeholder="请输入帖子内容" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">置顶</label>
                        <div class="layui-input-block">
                            <input type="radio" name="is_top" value="1" title="是">
                            <input type="radio" name="is_top" value="2" title="否" checked>
                        </div>
                    </div>
                    <div class="layui-form-item" style="padding-top: 10px">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit lay-filter="infoForm">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

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