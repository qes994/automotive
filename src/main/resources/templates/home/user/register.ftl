<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>注册界面</title>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<link href="/home/css/mui.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="/home/icon/iconfont.css" />
	<link href="/home/css/common.css" rel="stylesheet" />
	<link rel="stylesheet" href="/home/css/swiper.min.css" />
		<style>
			body{
				background: #ffffff;
			}
			.header{
				background: #ffffff;
			}
			.main{
				margin-top: 0.74rem;
			}
			.logo{
				margin: 0 auto;
			}
			.logo,.logo img{
				width: 0.97rem;
				height: 0.97rem;
			}
			.login{
				padding: 0 0.38rem;
			}
			.int{
				padding: 0.35rem 0 0.05rem 0;
				border-bottom: 1px solid #DBDBDB;
			}
			.int input{
				height: 0.21rem;
				line-height: 0.21rem;
				border: none;
				font-size: 0.16rem;
				margin-bottom: 0;
			}
			.int input.wid1{
				width: 2.7rem;
			}
			.int input.code{
				width: 1.9rem;
			}
			.int span.iconfont{
				font-size: 0.18rem;
				color: #C2C2C2;
			}
			input::-webkit-input-placeholder,
			input:-moz-placeholder,
			input:-moz-placeholder,
			input::-moz-placeholder,
			input:-ms-input-placeholder {
				color: #C2C2C2;
				font-size: 0.16rem;
				font-weight: normal;
			}
			.queding{
				width: 2.97rem;
				height: 0.49rem;
				line-height: 0.49rem;
				background:#FFC700;
				border-radius:0.25rem;
				text-align: center;
				color: #463C17;
				font-size: 0.16rem;
				margin: 0 auto;
				margin-top: 0.5rem;
			}
			.huoqu{
				color: #FFC700;
				font-size: 0.16rem;
				font-weight: bold;
			}
			.noHit{
				pointer-events: none;
			}
			.sign_up{
				width: 3rem;
				height: 0.45rem;
				line-height: 0.45rem;
				background: #FFC700;
				text-align: center;
				font-size: 0.17rem;
				color: #333333;
				border-radius: 0.23rem;
				margin: 0 auto;
				margin-top: 0.3rem;
			}
			.mima{
				width: 3rem;
				margin: 0 auto;
				margin-top: 0.1rem;
				font-size: 0.14rem;
				color: #262626;
				text-align: right;
			}
		</style>
	</head>
	<body>
		<div class="app">
			<header class="header mui-bar mui-bar-nav">
	            <span class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></span>
	            <span id="login" class="mui-pull-right">登录</span>
	        </header>
			<div class="main">
				<div class="logo">
					<img src="/home/image/logo.png" />
				</div>
				<div class="login">
					<div class="int">
						<span class="iconfont iconxingzhuang2"></span>
						<input type="text" placeholder="请输入手机号" id="phone" class="wid1" name="phone" />
					</div>
					<div class="int">
						<span class="iconfont iconxingzhuang1"></span>
						<input type="text" placeholder="请输入验证码" class="code" name="Lordcode" />
						<span class="huoqu"><div id="counter">获取验证码</div></span>
					</div>
				</div>
				<div id="regis" class="sign_up">注册</div>
			</div>
		</div>
	</body>
<script type="text/javascript" src="/home/js/jquery-2.1.1.min.js" ></script>
<script type="text/javascript" src="/home/js/common.js" ></script>
<script type="text/javascript" src="/home/js/show-toast.js"></script>
<script type="text/javascript" src="/home/js/mui.min.js"></script>
<#--<script type="text/javascript" src="/home/js/api.js" ></script>-->
	<script>
		$("#login").click(function () {
			window.location.href="/user/login"
		})
		$(".mui-pull-right").click(function () {
			window.location.href="/user/login"
		})
		$("#counter").click(function () {
			var phone = $("#phone").val();
			//alert(phone)
			$.ajax({
				url:"/user/code",
				type:"POST",
				data:{"phone":phone},
				dataType: "json",
				success: function(data) {
					if(data.code==0){
						showToast({
							str: data.msg
						})
					}else if (data.code==1){
						showToast({
							str: "你的验证码:"+data.data
						})
						$(".code").val(data.data)
						$("#counter").html("60");
						var intval=setInterval(function(){
							var $counter=$("#counter");
							var html=$counter.html();//60
							var countDwon=parseInt(html);//
							$counter.addClass("noHit");
							$counter.html(countDwon-1 + "秒后重新获取");
							if(countDwon<=0){
								$counter.removeClass("noHit");
								$counter.html("重新获取")
								clearInterval(intval);
								return;
							}
						},1000);
					}
				}
			})
		})
		$("#regis").click(function () {
			//var password = $("#password").val();
			var phone = $("#phone").val();
			var code = $(".code").val();
			$.ajax({
				url:"/user/register",
				data:{"phone":phone,"code":code},
				type:'POST',
				dataType:"json",
				success:function(data){
					console.log(data)
					if(data.code==0){
						mui.toast(data.msg,{ duration:'long', type:'div' })
					}else {
						showToast({
							str:data.msg
						})
						//mui.toast(data.msg,{ duration:'long', type:'div' })
						window.location.href="/user/home";
					}
				}
			})
		})

	</script>

</html>