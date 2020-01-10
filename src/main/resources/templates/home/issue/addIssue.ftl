<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
		<title></title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link rel="stylesheet" href="/home/icon/iconfont.css" />
		<link href="/home/css/common.css" rel="stylesheet" />
	<link rel="stylesheet" href="/home/webuploader/webuploader.css" charset="UTF-8"/>
	<link rel="stylesheet" type="text/css" href="/home/css/globle.css" />
	<link href="/home/css/mui.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="/home/css/common.css" />
	<link href="/home/css/mui.indexedlist.css" rel="stylesheet" />
	<link href="/home/css/mui.picker.css" rel="stylesheet" />
	<link href="/home/css/mui.poppicker.css" rel="stylesheet" />
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
			margin-top: 0.54rem;
		}
		.fabulist{
			margin-top: 0.1rem;
		}
		.fbname{
			width: 0.62rem;
			line-height: 0.41rem;
		}
		input::-webkit-input-placeholder,
		input:-moz-placeholder,
		input:-moz-placeholder,
		input::-moz-placeholder,
		input:-ms-input-placeholder {
			color: #999999;
			font-size: 0.16rem;
			font-weight: normal;
		}
		.int{
			width: 2.7rem;
			height: 0.41rem;
			background: #F6F6F6;
			border-radius: 0.1rem;
			padding: 0 0.14rem;
		}
		.intwid1{
			width: 2rem;
		}
		.intwid2{
			width: 0.6rem;
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
		.int span.iconfont{
			font-size: 0.12rem;
			color: #999999;
		}
		.intheight{
			height: 1.3rem;
		}
		.int textarea{
			width: 2.2rem;
			margin-bottom: 0;
			height: 1.3rem;
			padding: 0.1rem 0;
			background: none;
			border: none;
			font-size: 0.16rem;
			font-weight: bold;
			font-size: 0.16rem;
		}
		.upload{
			width: 2.7rem;
		}
		.upimg{
			float: left;
			margin-right: 0.07rem;
			position: relative;
		}
		.upimg,.upimg img{
			width: 0.85rem;
			height: 0.85rem;
			border-radius: 0.03rem;
			position: relative;
		}
		.upimg .del-mask{
			height: 0.20rem;
			color: #fff;
			line-height: 0.20rem;
			background-color:rgba(0, 0, 0, 0.4);
			text-align: center;
			position: absolute;
			bottom: 0px;
			width: 100%;
		}
		.upadd{
			float: right;
		}
		.upadd,.upadd img{
			width: 0.85rem;
			height: 0.85rem;
			border-radius: 0.03rem;
		}
		.uptishi{
			margin-top: 0.1rem;
			margin-bottom: 0.08rem;
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
		}
		.tanchuang{
			width: 3rem;
			height: 1.8rem;
			position: fixed;
			top: 0;
			right: 0;
			bottom: 0;
			left: 0;
			margin: auto;
			z-index: 8;
			display: none;
		}
		.tanchuang1{
			width: 3rem;
			height: 1.8rem;
			position: fixed;
			top: 0;
			right: 0;
			bottom: 0;
			left: 0;
			margin: auto;
			z-index: 8;
			display: none;
		}
		.tcbox{
			height: 1.2rem;
			background: #FFFFFF;
			border-radius: 0.1rem;
		}
		.tcbox1{
			height: 1.2rem;
			background: #FFFFFF;
			border-radius: 0.1rem;
		}
		.tcbox div{
			height: 0.6rem;
			line-height: 0.6rem;
			text-align: center;
			border-radius: 0.1rem;
			font-size: 0.18rem;
		}
		.tcbox1 div{
			height: 0.6rem;
			line-height: 0.6rem;
			text-align: center;
			border-radius: 0.1rem;
			font-size: 0.18rem;
		}
		.tcbox div.active{
			background: #FFC700;
			font-weight: bold;
		}
		.tcbox1 div.active1{
			background: #FFC700;
			font-weight: bold;
		}
		.queding{
			height: 0.4rem;
			background: #FFFFFF;
			line-height: 0.4rem;
			text-align: center;
			border-radius: 0.1rem;
			margin-top: 0.2rem;
			font-size: 0.18rem;
		}
		.queding1{
			height: 0.4rem;
			background: #FFFFFF;
			line-height: 0.4rem;
			text-align: center;
			border-radius: 0.1rem;
			margin-top: 0.2rem;
			font-size: 0.18rem;
		}
	</style>
	</head>
	<body class="">
		<div class="app">
			<header class="header mui-bar mui-bar-nav">
	            <span class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></span>
	            <h1 class="mui-title">发布</h1>
	        </header>
			<form id="form">
			<div class="main">
				<div class="fabulist flex space-between">
					<div class="fbname">发布类型</div>
					<div class="int flex align-center xuanze">
						<input  type="text" placeholder="请选择发布类型" name="shop" readonly="readonly" id="shop" class="xzcen"/>
						<span class="iconfont iconxiajiantou"></span>
					</div>
				</div>
				<div class="fabulist flex space-between">
					<div class="fbname">标题</div>
					<div class="int flex align-center">
						<input type="text" placeholder="请输入标题" id="title" name="title"/>
					</div>
				</div>
				
				<div class="fabulist flex space-between">
					<div class="fbname">价格</div>
					<div class="int intwid1 flex align-center">
						<input type="text" placeholder="请输入价格" id="price" name="price"/>
					</div>
					<div class="int intwid2 flex align-center">
						<span class="qubie">万起</span>
					</div>
						<#--<span class="iconfont iconxiajiantou marl5"></span>-->
				</div>
				<div class="fabulist flex space-between xuhide">
					<div class="fbname">品牌</div>
					<div class="int flex align-center" id="brandBtn" >
						<#--<#list brand as item>
						<td>${item.name}<td>
							</#list>-->
						<input type="text"  placeholder="请选择汽车品牌" value="${brand!}" readonly="readonly"/>
						<input type="hidden" id="brandId" name="brandId" value="${brand!}" readonly="readonly"/>
						<span class="iconfont iconarrowRight"></span>
					</div>
				</div>
				<div class="fabulist flex space-between xuhide">
					<div class="fbname">车型</div>
					<div class="int flex align-center amend" id='showUserPicker'>
						<input type="text" id="arcticId"  name="arcticId" class="userResult xzcen1 ui-alert" placeholder="请选择汽车款型" readonly="readonly"/>
						<span class="iconfont iconarrowRight"></span>
					</div>
				</div>
				<div class="fabulist flex space-between">
					<div class="fbname">详细描述</div>
					<div class="int intheight flex align-center">
						<textarea placeholder="请输入汽车详情描述" id="details" name="details"></textarea>
					</div>
				</div>
				<div class="fabulist flex space-between">
					<div class="fbname">详情图片</div>
					<div class="upload">
						<div class="font12 cor9 uptishi">最多上传6张图片</div>
						<div class="upcen">
							<div class="upbox" id="upbox">
							</div>
							<div class="upadd" id="noForbidder">
								<img src="/home/image/upadd.png" />
							</div>
						</div>
					</div>
				</div>
			</div>
				<input type="hidden" name="images" id="images" value="">
			</form>
			<div class="footer">发布</div>
			<!--弹窗-->
			<div class="bg_rgba"></div>
			<div class="tanchuang">
				<div class="tcbox">
					<div class="active">售卖</div>
					<div>求购</div>
				</div>
				<div class="queding">确定</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="/home/js/jquery-2.1.1.min.js" ></script>
	<script type="text/javascript" src="/home/js/common.js" ></script>
<script type="text/javascript" src="/home/js/show-toast.js"></script>
<script type="text/javascript" src="/home/webuploader/webuploader.js"></script>
<script src="/home/js/mui.min.js"></script>
<script src="/home/js/mui.picker.js"></script>
<script src="/home/js/mui.poppicker.js"></script>
<script src="/home/js/mui.indexedlist.js"></script>

<#--	<script type="text/javascript" src="/home/js/api.js" ></script>-->
	<script>
		var html = '售卖';
		var index = 0;
		$('.tcbox').on('click','div',function(){
			$('.tcbox  div').removeClass('active');
			$(this).addClass('active');
			index = $(this).index();
			html = $(this).html();
		})
		$('.xuanze').click(function(){
			$('.tanchuang').show();
			$('.bg_rgba').show();
		})
		$('.queding').click(function(){
			$('.tanchuang').hide();
			$('.bg_rgba').hide();
			$('.xzcen').val(html);
			if(index==1){
				$('.xuhide').hide();
				$('.qubie').html('万起');
			}else{
				$('.xuhide').show();
				$('.qubie').html('万起');
			}
		})
		/*车型*/
			mui.init();
			mui.ready(function() {
				var userPicker = new mui.PopPicker();
				$.ajax({
					url: "/user/arctic",
					dataType: "json",
					/*cache: false,
					async: false,
					data: {},*/
					type: "POST",
					success: function (ret) {
						console.log(ret)
						var data = ret.object
						//var jsonObj =  JSON.parse(data)

						var result=[];
						for(var i =0 ;i < data.length;i++){
								console.log(data[i])
								var item={
									value:data[i].id,
									text: data[i].name,
								}
								result.push(item)
						}
						console.log(result)
						userPicker.setData(result);
						var showUserPickerButton = document.getElementById('showUserPicker');
						//var userResult = document.getElementById('.userResult');
						showUserPickerButton.addEventListener('tap', function(event) {
							userPicker.show(function(items) {
								console.log(items)
								var val = $(".userResult").val(items[0].text);
								console.log(val);
								//返回 false 可以阻止选择框的关闭
								//return false;
							});
						}, false);
					}
					})
			});
		/*
		//input输入键盘顶起定位元素代码
		 var win_h = $(window).height(); //关键代码
         window.addEventListener('resize', function() {
            if($(window).height() < win_h) {
                $('.tijiao').hide();
            } else {
                $('.tijiao').show();
            }
         });*/
		/*跳到品牌页面*/
		$("#brandBtn").click(function () {
			var data = {}
			var froms = $("#form").serializeArray();
			$.each(froms,function () {
				data[this.name]=this.value;
			})
			var issue = JSON.stringify(data);//转换成字符串
			//alert(issue)
			localStorage.setItem('data',issue);//保存
			window.location.href="/issue/brand"
		})
		/*页面加载*/
		$(function(){
			var data = JSON.parse(localStorage.getItem('data'));
			if(data!=null){
				var shop = data.shop　//存储进去的是数字，但是log出的是string
				if(shop!=null&&shop!=""){
					$("#shop").val(shop);
				}
				var title = data.title
				if(title!=null&&title!=""){
					$("#title").val(title);
				}
				var price = parseInt(data.price)
				if(price!=null&&price!=""){
					$("#price").val(price);
				}
				var arcticId = data.arcticId
				if(arcticId!=null&&arcticId!=""){
					$("#arcticId").val(arcticId);
				}
				var details = data.details
				if(details!=null&&details!=""){
					$("#details").val(details);
				}
				var images = data.images
				if(images!=null&&images!=""){
					var arr=images.split(",");
					//var tmp=[];
					for (var i=0;i<arr.length;i++){
						var html='<div class="upimg"><img src="'+arr[i]+'" /><div class="del-mask">删除</div></div>';
						$("#upbox").append(html)
					}
				}
				//赋值就删除完
				if(data!=null){
					localStorage.removeItem("data")
				}
			}

		})


		var uplaoder=WebUploader.create({
			swf: 'https://cdn.staticfile.org/webuploader/0.1.1/Uploader.swf',
			// 存在文件自动上传
			pick:".upadd",
			auto: true,
			// 文件接收服务端地址。
			server: '/upload/image',
			// 限制文件类型
			accept:  {
				title: 'Images',
				extensions: 'gif,jpg,jpeg,bmp,png',
				mimeTypes: 'image/!*'
			},
			fileNumLimit:6,
			//允许重复上传
			duplicate: true,
			//上传方式
			method: 'post',
			//设定单个文件大小 不能超过20M
			fileSingleSizeLimit: 20 * 1024 * 1024

		});
		uplaoder.on('uploadSuccess', function (file, reponse) {
			if(reponse.code==1){
				var html='<div class="upimg"><img src="'+reponse.url+'" /><div class="del-mask">删除</div></div>';
				$("#upbox").append(html)
				var images=$("#images").val();
				var arr=images.split(",");
				var image=[];
				for (var i=0;i<arr.length;i++){
					image.push(arr[i])
				}
				//console.log("图片多少="+image.length)
				if (image.length==5){
					$(".upadd").addClass(".aaaaaaaaa");
					showToast({
						str: "图片最大6张,可删除其他,只能添加六个"
					})
				}
				if(images==""){
					$("#images").val(reponse.url)
				}else{
					$("#images").val(images+","+reponse.url)
				}

			}
		});
		/** 上传失败 */
		uplaoder.on('uploadError', function (file) {
			$('#' + file.id).find('.state').text('上传出错！');
		});

		$("#upbox").on("click",".del-mask",function(){
			var $parent=$(this).parents(".upimg");
			var src=$parent.find("img").attr("src");
			$parent.remove();
			var images=$("#images").val();
			var arr=images.split(",");
			var tmp=[];
			for (var i=0;i<arr.length;i++){
				if(arr[i]!=src && arr[i]!=''){
					tmp.push(arr[i])
				}
			}
			$("#images").val(tmp.join(","))
		})

		/*最终添加*/
		$(".footer").click(function () {
			//图片
			var images = $("#images").val();
			var arr=images.split(",");
			var image=[];
			for (var i=0;i<arr.length;i++){
				image.push(arr[i])
			}
			//类型
			var shop = $("#shop").val();
			//标题
			var title = $("#title").val();
			//价格
			var price = $("#price").val();
			//品牌
			var brand = $("#brandId").val();
			//车型
			var arctic = $("#arcticId").val();
			//详情描述
			var details = $("#details").val();
			var item = {"shop":shop,"title":title,
				"price":price,"brand":brand,"arctic":arctic,
				"details":details,"image":image
			}
			$.ajax({
				url:"/issue/add",
				data:JSON.stringify(item),
				type:"POST",
				contentType:"application/json;charset=utf-8",
				success:function(data){
					if (data.code==0){
						showToast({
							str: data.msg
						})
					}else{
						showToast({
							str: data.msg
						})
						localStorage.removeItem("data")
						window.location.href="/user/home";
					}
				}
			})


		})

	</script>
</html>