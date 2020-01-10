<style>
    body {
        background: #F5F5F7;
    }

    .mui-tab-item div.mui-tab-label {
        font-size: 0.1rem;
        color: #BBBBBB;
        margin-top: 1px;
        line-height: 0.12rem;
    }

    .mui-bar-tab {
        height: 0.54rem;
    }

    .mui-bar {
        background: #FFFFFF;
        box-shadow: 0px -1px 4px 0px rgba(248, 248, 248, 1);
    }

    .mui-bar-tab .mui-tab-item.mui-active .mui-tab-label {
        color: #FFB734;
        font-weight: bold;
    }

    .mui-bar-tab .mui-tab-item {
        color: #BBBBBB;
        position: relative;
        line-height: 0.17rem;
        height: 0.56rem;
    }

    .addicon, .addhover {
        width: 0.28rem;
        height: 0.28rem;
        margin: 0 auto;
    }

    .addicon {
        display: block;
    }

    .addhover {
        display: none;
    }

    .addhover img, .addicon img {
        width: 0.28rem;
        height: 0.28rem;
    }

    .mui-active .addhover {
        display: block;
    }

    .mui-active .addicon {
        display: none;
    }

    .nav img {
        width: 0.45rem;
        height: 0.45rem;
        position: relative;
        top: 0.02rem;
    }
</style>
<nav class="mui-bar mui-bar-tab" id="nav">
    <a id="page" href="/" class="mui-tab-item <#if controller=="PageController"!>mui-active</#if>"  >
        <div class="addicon"><img src="/home/image/nav1.png"/></div>
        <div class="addhover"><img src="/home/image/nav1h.png"/></div>
        <div class="mui-tab-label">首页</div>
    </a>
    <a id="CarCricle" href="/car/cricle" class="mui-tab-item <#if controller=="CarController"!>mui-active</#if>" >
        <div class="addicon"><img src="/home/image/nav2.png"/></div>
        <div class="addhover"><img src="/home/image/nav2h.png"/></div>
        <div class="mui-tab-label">汽车圈</div>
    </a>
    <a id="toIssue" class="mui-tab-item nav" href="/issue/issue">
        <img src="/home/image/nav.png"/>
    </a>
        <a id="my" href="/user/home" class="mui-tab-item <#if controller="UserController"!>mui-active</#if>" >
        <div class="addicon"><img src="/home/image/nav4.png"/></div>
        <div class="addhover"><img src="/home/image/nav4h.png"/></div>
        <div class="mui-tab-label">我的</div>
        </a>
</nav>
<script type="text/javascript" src="/home/js/common.js"></script>
<script type="text/javascript" src="/home/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/home/js/show-toast.js"></script>
<script type="text/javascript" src="/home/js/mui.min.js"></script>
<script>
    $('#nav').on('click', '.mui-tab-item', function () {
    })

        $("#toIssue").click(function () {
            window.location.href = "/issue/issue"
        })
       $("#page").click(function () {
            window.location.href = "/"
        })
        $("#my").click(function () {
            window.location.href = "/user/home"
        })
        //汽车圈
        $("#CarCricle").click(function () {
            window.location.href = "/car/cricle"
        })



</script>