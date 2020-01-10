
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>管理后台</title>
    <link rel="stylesheet" href="/admin/layui/css/layui.css">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1516038_9xj3nqitnch.css"/>
    <link rel="stylesheet" href="/admin/css/style.css?t=1578049660"/>
    <link rel="stylesheet" href="/admin/css/style1.css"/>
    <link  rel="stylesheet" href="//at.alicdn.com/t/font_1597383_cm5k7u5qtoq.css"  />
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
   <#include "common/head.ftl"/>

   <#include "common/right.ftl"/>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">

            <script src="https://code.highcharts.com.cn/highcharts/highcharts.js"></script>
            <div class="box">
                <div class="title">快捷方式</div>
                <div class="body">
                    <ul class="ul_list menu_list clearfloat">
                        <li onclick="openurl('/admin/user/index');">
                            <i class="iconfont icon-geren"></i>
                            <div class="name">用户管理</div>
                        </li>
                        <li onclick="openurl('/admin/issue/index');">
                            <i class="iconfont icon-wenzhang-copy"></i>
                            <div class="name">发布管理</div>
                        </li>
                        <li onclick="openurl('/admin/admin/index');">
                            <i class="iconfont icon-pinglunguanli"></i>
                            <div class="name">权限管理</div>
                        </li>
                        <li onclick="openurl('/admin/admin/addAdmin');">
                            <i class="iconfont icon-increase"></i>
                            <div class="name">添加管理员</div>
                        </li>
                        <div class="clear"></div>
                    </ul>
                </div>
            </div>
        </div>
        <#include "common/footer.ftl"/>
    </div>


</div>

<script src="/admin/layui/layui.all.js"></script>
<script>
    layui.use(['table', 'element', 'jquery'], function () {})
    function openurl(url) {
        window.location.href=url;
    }
</script>

</body>
</html>