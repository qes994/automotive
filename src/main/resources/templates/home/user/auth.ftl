<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>实名认证</title>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<link href="/home/css/mui.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="/home/icon/iconfont.css" />
	<link href="/home/css/common.css" rel="stylesheet" />
	<link rel="stylesheet" href="/home/webuploader/webuploader.css" charset="UTF-8"/>

	<style>
			body{
				background: #ffffff;
			}
			.header{
				background: #ffffff;
				border-bottom: 1px solid #EEEEEE;
			}
			.main{
				padding: 0 0.14rem;
				margin-top: 0.64rem;
			}
			.fabulist{
				margin-top: 0.1rem;
			}
			.fbname{
				width: 1.07rem;
				line-height: 0.41rem;
			}
			.int{
				width: 2.55rem;
				height: 0.41rem;
				background: #F6F6F6;
				border-radius: 0.1rem;
				padding: 0 0.14rem;
			}
			.int input{
				width: 2.2rem;
				margin-bottom: 0;
				height: 0.21rem;
				padding: 0;
				background: none;
				border: none;
				font-size: 0.16rem;
				font-weight: bold;
				font-size: 0.16rem;
			}
			.upload{
				width: 2.6rem;
				padding-top: 0.1rem;
			}
			.upadd1{
				margin-bottom: 0.05rem;
			}
		
			.upadd img{
				width: 100%;
			}
			.tablist{
				width: 50%;
				text-align: center;
				float: left;
				font-size: 0.14rem;
				color: #999999;
			}
			.tablist.active{
				color: #3B2D13;
				font-size: 0.18rem;
				font-weight: bold;
			}
			.tablist .border{
				width: 0.1rem;
				height: 0.04rem;
				background: #FFC700;
				margin: 0 auto;
				display: none;
				margin-top: -0.04rem;
			}
			.tablist.active .border{
				display: block;
			}
			.queding{
				width: 2.5rem;
				height: 0.41rem;
				background: #FFC700;
				border-radius: 0.21rem;
				line-height: 0.41rem;
				text-align: center;
				font-size: 0.16rem;
				color: #463C17;
				margin: 0 auto;
				margin-top: 0.5rem;
			}
			.upadd div:nth-child(2){width:100%!important;height:100%!important;}
		</style>
	</head>
	<body>
		<div class="app">
			<header class="header mui-bar mui-bar-nav">
	            <span class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></span>
	            <div class="mui-title ultab clearfloat">
					<div class="tablist active">
						<div>个人实名</div>
						<div class="border"></div>
					</div>
					<#--<div class="tablist">
						<div>店铺实名制</div>
						<div class="border"></div>
					</div>-->
				</div>
	        </header>
			<div class="main">
				<form id="from">
				<div class="fabulist flex space-between">
					<div class="fbname">姓名</div>
					<div class="int flex align-center">
						<input type="text" id="name" name="name"/>
					</div>
				</div>
				<div class="fabulist flex space-between">
					<div class="fbname">身份证号</div>
					<div class="int flex align-center">
						<input type="text" id="idCard" name="idCard" />
					</div>
				</div>
				
				<div class="fabulist flex space-between">
					<div class="fbname">上传身份证</div>
					<div class="upload">
						<div class="front upadd upadd1">
							<img src="/home/image/upadd1.png" id="frontImage"/>
						</div>
						<input type="hidden" id="front" name="frontImage">
						<div class="back upadd upadd2">
							<img src="/home/image/upadd2.png" id="backImage"/>
						</div>
						<input type="hidden" id="back" name="backImage">

					</div>
				</div>
				
				<div class="queding">确定</div>
				</form>
			</div>
			
		</div>
	</body>
<script type="text/javascript" src="/home/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="/home/js/common.js"></script>
<script type="text/javascript" src="/home/js/show-toast.js"></script>
<script type="text/javascript" src="/home/webuploader/webuploader.js"></script>
	<script>
		//input输入键盘顶起定位元素代码
		 var win_h = $(window).height(); //关键代码
         window.addEventListener('resize', function() {
            if($(window).height() < win_h) {
                $('.tijiao').hide();
            } else {
                $('.tijiao').show();
                
            }
         });
		$('.ultab').on('click','.tablist',function(){
			$('.ultab .tablist').removeClass('active');
			$(this).addClass('active');
		})
		/*返回上一级*/
		$(".mui-action-back").click(function () {
			window.location.href="/user/home"
		})
		//正面图片
		var uplaoder=WebUploader.create({
			swf: 'https://cdn.staticfile.org/webuploader/0.1.1/Uploader.swf',
			// 存在文件自动上传
			pick:".front",
			auto: true,
			// 文件接收服务端地址。
			server: '/upload/image',
			// 限制文件类型
			accept:  {
				title: 'Images',
				extensions: 'gif,jpg,jpeg,bmp,png',
				mimeTypes: 'image/!*'
			},
			//允许重复上传
			duplicate: true,
			//上传方式
			method: 'post',
			//设定单个文件大小 不能超过20M
			fileSingleSizeLimit: 20 * 1024 * 1024

		});
		uplaoder.on('uploadSuccess', function (file, reponse) {
			console.log(reponse);
			$("#front").val(reponse.url)
			$("#frontImage").attr("src",reponse.url)
			if(reponse.state == 'succ'){
				console.log(response);
				//alert(reponse.msg);
				//alert(reponse.url);
				//this.options.formData.type = '';
				this.options.formData.age = '';
				this.options.formData.uname = '';
				this.options.formData.pw = '';
				//uplaoder.removeFile(uploader.getFile(file.id));
				//uplaoder.getFiles('inited');
			}else{
				//上传失败将文件从队列中移出避免再次添加统一文件时不显示名称
				//uplaoder.removeFile(uplaoder.getFile(file.id));
				//uplaoder.getFiles('inited');
				//alert(reponse.msg);
			}
		});
		/** 上传失败 */
		uplaoder.on('uploadError', function (file) {
			$('#' + file.id).find('.state').text('上传出错！');
		});

		var uplaoder2=WebUploader.create({
			swf: 'https://cdn.staticfile.org/webuploader/0.1.1/Uploader.swf',
			// 存在文件自动上传
			auto: true,
			// 文件接收服务端地址。
			server: '/upload/image',
			// 限制文件类型
			accept:  {
				title: 'Images',
				extensions: 'gif,jpg,jpeg,bmp,png',
				mimeTypes: 'image/*'
			},
			//允许重复上传
			duplicate: true,
			/** 上传方式 */
			method: 'post',
			//设定单个文件大小 不能超过20M
			fileSingleSizeLimit: 20 * 1024 * 1024,
			pick:".back"
		});
		/** 完成上传 */
		uplaoder2.on('uploadSuccess', function (file, reponse) {
			console.log(reponse);
			$("#back").val(reponse.url)
			$("#backImage").attr("src",reponse.url)
			if(reponse.state == 'succ'){
				console.log(response);
				//alert(reponse.msg);
				//alert(reponse.url);
				//this.options.formData.type = '';
				this.options.formData.age = '';
				this.options.formData.uname = '';
				this.options.formData.pw = '';
				/*uplaoder2.removeFile(uploader.getFile(file.id));
				uplaoder2.getFiles('inited');*/
			}else{
				//上传失败将文件从队列中移出避免再次添加统一文件时不显示名称
				/*uplaoder2.removeFile(uploader.getFile(file.id));
				uplaoder2.getFiles('inited');*/
				//alert(reponse.msg);
			}
		});
		/** 上传失败 */
		uplaoder2.on('uploadError', function (file) {
			$('#' + file.id).find('.state').text('上传出错！');
		});

		/*添加*/
		$(".queding").click(function () {
			var name = $("#name").val()
			var idCard = $("#idCard").val()
			var frontImage = $("#front").val()
			var backImage = $("#back").val()
			var userAuth = {"name":name,"idCard":idCard
			,"frontImage":frontImage,"backImage":backImage}
			var userAuth = JSON.stringify(userAuth)
			//alert(userAuth)
			$.ajax({
				url:"/user/auth",
				data:userAuth,
				type:'POST',
				contentType:"application/json;charset=utf-8",
				success:function(data){
					console.log(data);
					if (data.code==1){
						showToast({
							str: data.msg
						})
					}else{
						showToast({
							str: data.msg
						})
					}
				}
			})
		})
	</script>

</html>