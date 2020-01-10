<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
		<title>个人中心</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="/home/css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="/home/icon/iconfont.css" />
		<link href="/home/css/common.css" rel="stylesheet" />
		<style>
			body {
				background: #F7F7F7;
			}
			
			.main {
				margin-top: 0;
			}
			.user{
				background: #ffffff;
				width: 100%;
				padding: 0.3rem 0 0.5rem 0.14rem;
			}
			.usertou,.usertou img{
				width: 0.6rem;
				height: 0.6rem;
				border-radius: 0.6rem;
			}
			.usermess{
				margin-left: 0.2rem;
			}
			.username span{
				font-size: 0.25rem;
				font-weight: bold;
				margin-right: 0.1rem;
			}
			.username img{
				width: 0.25rem;
				height: 0.25rem;
			}
			.userid{
				font-size: 0.16rem;
				color: #999999;
				margin-top: 0.1rem;
			}
			.useright{
				width: 0.95rem;
				height: 0.26rem;
				line-height: 0.26rem;
				background:linear-gradient(90deg,rgba(255,248,225,1),rgba(255,242,226,1));
				border-radius: 0.13rem 0 0 0.13rem;
			}
			.useright span{
				font-size: 0.12rem;
				color: #FF9B2E;
			}
			.useright img{
				width: 0.13rem;
				height: 0.13rem;
				margin-right: 0.05rem;
			}
			
			.mycen{
				width: 100%;
				height: 100%;
				background: #F7F7F7;
				border-radius: 0.25rem 0.25rem 0 0;
				position: relative;
				top: -0.25rem;
				padding: 0.2rem;
			}
			.cenbox{
				background: #FFFFFF;
				border-radius: 0.1rem;
				padding: 0.05rem 0.14rem;
			}
			.cenleft img{
				width: 0.25rem;
				height: 0.25rem;
				margin-right: 0.14rem;
			}
			.cenleft span{
				font-size: 0.16rem;
			}
			.cenlist{
				padding: 0.15rem 0;
			}
			.iconarrowRight{
				font-size: 0.16rem;
				color: #999999;
			}
			.tuichu{
				height: 0.4rem;
				line-height: 0.4rem;
				background: #EDEDED;
				border-radius: 0.1rem;
				text-align: center;
				font-size: 0.16rem;
				margin-top: 1.5rem;
			}
		</style>
	</head>

	<body>
		<div class="app">
			<div class="main">
				<div class="user flex space-between align-center">
					<div class="userleft flex align-center">
						<div class="usertou">
							<#if user.head??>
								<img src="${user.head!}" class="srcs">
							<#else>
								<img class="srcs" src="/home/image/tou.png" />
							</#if>
							<#--<img src="/home/image/usertou.png" />-->
						</div>
						<div class="usermess">
							<div class="username flex align-center">
								<#if user.name??>
									<span>${user.name!}</span>
								<#else>
									<span>车友</span>
								</#if>
							</div>
							<div class="userid">ID：${user.id}</div>
						</div>
					</div>
					<div class="useright flex align-center flex-center">
						<img src="/home/image/shiming.png" />
						<span>实名制认证</span>
					</div>
				</div>
				
				<div class="mycen">
					<div class="cenbox">
						<div id="myIssue" class="cenlist flex space-between align-center">
							<div class="cenleft flex align-center">
								<img src="/home/image/list1.png" />
								<span>我的发布</span>
							</div>
							<div class="iconfont iconarrowRight"></div>
						</div>
						<div class="opinion cenlist flex space-between align-center">
							<div class="cenleft flex align-center">
								<img src="/home/image/list3.png" />
								<span>意见反馈</span>
							</div>
							<div class="iconfont iconarrowRight"></div>
						</div>
					</div>
					<div class="tuichu">退出</div>
				</div>
			</div>
		</div>
	<#include "../common/botton.ftl"/>
	</body>
	<script type="text/javascript" src="/home/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="/home/js/common.js"></script>
<script type="text/javascript" src="/home/js/show-toast.js"></script>
<script type="text/javascript">
	/*前往修改头像*/
	$(".userleft").click(function () {
		window.location.href="/user/head";
	})
	/*前往实名认证*/
	$(".useright").click(function () {
		window.location.href="/user/auth";
	})

	/*退出*/
	$(".tuichu").click(function () {
		window.location.href="/user/quit";
	})
	/*意见反馈*/
	$(".opinion").click(function () {
		window.location.href="/user/opinion";
	})
	/*我的发布*/
	$("#myIssue").click(function () {
		window.location.href="/user/MyIssue";
	})
</script>
</html>