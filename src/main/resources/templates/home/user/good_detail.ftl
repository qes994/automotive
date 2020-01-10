<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>详情页</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="/home/css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="/home/icon/iconfont.css" />
		<link href="/home/css/common.css" rel="stylesheet" />
		<link rel="stylesheet" href="/home/css/swiper.min.css" />
		<style>
			body {
				background: #ffffff;
			}
			.main {
				margin-top: 0;
			}
			.banner{
				position: relative;
				z-index: 6;
			}
			.banner img {
				width: 100%;
			}
			.iconfanhui{
				width: 0.24rem;
				height: 0.24rem;
				background: rgba(0,0,0,0.5);
				font-size: 0.14rem;
				color: #FFFFFF;
				text-align: center;
				line-height: 0.24rem;
				border-radius: 0.24rem;
				position: fixed;
				top:0.1rem;
				left: 0.14rem;
				z-index: 9;
			}
			.center{
				padding: 0.3rem 0.2rem;
				border-radius: 0.25rem 0.25rem 0 0;
				z-index: 12;
				background: #ffffff;
				position: relative;
				/*top: -0.25rem;*/
    			top: 0.48rem;
    			box-shadow:0px -2px 16px 0px rgba(0, 0, 0, 0.1);
			}
			.title{
				font-size: 0.18rem;
				font-weight: bold;
			}
			.guige{
				margin: 0.15rem 0;
			}
			.price{
				font-size: 0.18rem;
				font-weight: bold;
				color: #FF5757;
			}
			.state{
				font-size: 0.12rem;
				font-weight: bold;
			}
			.state1{
				color: #5F97FF;
			}
			.state2{
				color: #46D48D;
			}
			.time{
				font-size: 0.13rem;
				margin-top: 0.1rem;
			}
			.yonghu{
				padding: 0.1rem;
				background: #FFF9EB;
				border-radius: 0.1rem;
				margin-top: 0.25rem;
			}
			.touxiang,.touxiang img{
				width: 0.6rem;
				height: 0.6rem;
				border-radius: 0.6rem;
			}
			.usermess{
				margin-left: 0.2rem;
			}
			.username{
				font-size: 0.18rem;
				color: #333333;
				font-weight: bold;
			}
			.userid{
				font-size: 0.14rem;
				color: #999999;
				margin-top: 0.1rem;
			}
			.yhright{
				font-size: 0.14rem;
				color: #FFA000;
				font-weight: bold;
			}
			.yhright span.iconfont{
				font-weight: normal;
				font-size: 0.08rem;
				margin-left: 0.05rem;
			}
			.mstitle{
				font-size: 0.16rem;
				font-weight: bold;
				margin: 0.3rem 0 0.15rem 0;
			}
			.mscen{
				font-size: 0.14rem;
				color: #333333;
			}
			.footer{
				width: 100%;
				height: 0.49rem;
				line-height: 0.49rem;
				background:linear-gradient(90deg,rgba(255,223,148,1),rgba(255,155,46,1));
				border-radius:0.1rem 0.1rem 0px 0px;
				position: fixed;
				bottom: 0;
				text-align: center;
				color: #FFFFFF;
				font-size: 0.16rem;
				font-weight: bold;
				z-index: 14;
			}
		</style>
	</head>

	<body>
	<input type="hidden" id="id" value="${issue.id}">
		<div class="app">
			<div class="main">
				<div class="banner">
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<#list issuePrints as item>
									<div class="swiper-slide"><img src="${item.cover!}"></div>
							</#list>
						</div>
					</div>
					<div class="iconfont iconfanhui fanhui"></div>
				</div>
				<div class="center">
					<div class="title">${issue.title!}</div>
					<div class="guige font12 cor9">${issue.arctic!}</div>
					<div class="flex space-between">
						<span class="price">￥${issue.price}万</span>
						<#if issue.shop =="BUY">
							<span class="state state1">求购</span>
						<#else>
							<span class="state state1">售卖</span>
						</#if>

					</div>
					<div class="time"></div><#--${item.createTime}-->
					<div class="yonghu flex space-between align-center">
						<div class="yhleft flex align-center">
							<div class="touxiang">
								<img src="${user.head}" />
							</div>
							<div class="usermess">
								<div class="username">${user.name}</div>
								<div class="userid">ID：${user.id}</div>
							</div>
						</div>
						<div class="yhright">
							<span>${count!}</span>
							<span class="iconfont iconjuxing"></span>
						</div>
					</div>

					<div class="mstitle">详情描述</div>
					<div class="mscen">${issue.details!}</div>
				</div>
			</div>
			<div id="edit" class="footer">编辑</div>
		</div>
	<input type="hidden" id="issueId" value="${issue.id!}">
	</body>
	<script type="text/javascript" src="/home/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="/home/js/common.js"></script>
	<script type="text/javascript" src="/home/js/swiper.min.js"></script>
	<script type="text/javascript" src="/home/js/show-toast.js"></script>
	<script>
		/*banner*/
		var swiper = new Swiper('.swiper-container', {
			loop: true,
			autoplay: {
				disableOnInteraction: false,
			},
		});
		//前往我的发布
		$(".yonghu").click(function () {
			var IssueId = $("#issueId").val()
			window.location.href="/user/homePage?IssueId="+IssueId;
		})
		//返回上一页
		$(".iconfont").click(function () {
			window.location.href="/user/MyIssue"
		})
			//编辑
		$("#edit").click(function () {
			var id = $("#id").val();
			console.log("发布id="+id)
			window.location.href="/user/editIssue?id="+id;
			/*$.ajax({
				url:"/user/updata",
				data:{"id":id},
				type:"GET",
				success:function () {

				}
			})*/
		})
	</script>


</html>