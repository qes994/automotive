<!doctype html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
	<meta charset="UTF-8">
	<title>汽车圈</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<link href="/home/css/mui.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="/home/icon/iconfont.css" />
	<link href="/home/css/common.css" rel="stylesheet" />
	<link rel="stylesheet" href="/home/css/swiper.min.css" />
	<link href="/home/css/mui.min.css" rel="stylesheet" />
	<link href="/home/css/mui.indexedlist.css" rel="stylesheet" />
	<link href="/home/css/mui.picker.css" rel="stylesheet" />
	<link href="/home/css/mui.poppicker.css" rel="stylesheet" />


		<style>
			body {
				background: #ffffff;
			}
			
			.main {
				margin-top: 1rem;
			}
			.headtop{
				width: 100%;
				background: #ffffff;
				position: fixed;
				top: 0;
				z-index: 99;
			}
			
			.ultab{
				padding: 0 0.1rem;
				border-bottom: 1px solid #EEEEEE;
				padding-top: 0.1rem;
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
				margin-top: 0.08rem;
				display: none;
			}
			.tablist.active .border{
				display: block;
			}
			.fenlei{
				padding: 0.15rem 0;
				background: #ffffff;
				position: relative;
			}
			.flist{
				width: 33.33333%;
				text-align: center;
			}
			.flist img{
				width: 0.08rem;
				height: 0.08rem;
				margin-left: 0.05rem;
			}
			.splist{
				width: 3.47rem;
				padding: 0.1rem;
				background:rgba(255,255,255,1);
				box-shadow:0px 1px 6px 0px rgba(232,235,238,1);
				border-radius:0.1rem;
				margin: 0 auto; 
				margin-bottom: 0.1rem;
			}
			.spleft,.spleft img{
				width: 1.25rem;
				height: 0.9rem;
				border-radius: 0.03rem;
			}
			.spright{
				width: 1.9rem;
				margin-left: 0.1rem;
			}
			.sptit{
				font-size: 0.16rem;
				color: #333333;
				font-weight: bold;
				line-height: 0.18rem;
				margin-top: 0.05rem;
			}
			.show{
				margin-top: 0.3rem;
			}
			.price{
				font-size: 0.18rem;
				color: #FF5757;
				font-weight: bold;
			}
			.zaishou{
				color: #5F97FF;
				font-size: 0.12rem;
				font-weight: bold;
			}
			.qiugou{
				color: #46D48D;
				font-size: 0.12rem;
				font-weight: bold;
			}
			.seadtop{
				height: 0.44rem;
				background: #ffffff;
				border-bottom: 1px solid #EEEEEE;
			}
			
			/*车行*/
			.chexing{
				width: 100%;
				padding: 0.1rem 0.2rem;
				background: rgba(255,255,255,0.9);
				border-radius: 0 0 0.2rem 0.2rem;
				position: absolute;
				top: 0.5rem;
				z-index: 99;
				display: none;
			}
			.cxtit{
				padding: 0.12rem 0;
			}
			.cxbox span{
				width: 45%;
				padding: 0.08rem 0;
				display: inline-block;
			}
			.jiage{
				width: 100%;
				padding: 0.1rem 0.2rem;
				background: rgba(255,255,255,0.9);
				border-radius: 0 0 0.2rem 0.2rem;
				position: absolute;
				top: 0.5rem;
				z-index: 99;
				display: none;
			}
			.jiage span{
				width: 45%;
				padding: 0.08rem 0;
				display: inline-block;
			}
			.spright2{
				width: 100%;
			}
		</style>
	</head>

	<body>
	<div id="offCanvasWrapper" class="mui-off-canvas-wrap mui-draggable">
		<aside id="offCanvasSide" class="mui-off-canvas-right">
			<div id="offCanvasSideScroll" class="mui-scroll-wrapper">
				<div class="mui-content mui-scroll">
					<div id='list' class="mui-indexed-list">
						<div class="mui-indexed-list-search mui-input-row mui-search">
						<input type="search" class="mui-input-clear mui-indexed-list-search-input" placeholder="搜索">
						</div>
						<div class="mui-indexed-list-bar">
							<a>A</a>
							<a>B</a>
							<a>C</a>
							<a>D</a>
							<a>E</a>
							<a>F</a>
							<a>G</a>
							<a>H</a>
							<a>I</a>
							<a>J</a>
							<a>K</a>
							<a>L</a>
							<a>M</a>
							<a>N</a>
							<a>O</a>
							<a>P</a>
							<a>Q</a>
							<a>R</a>
							<a>S</a>
							<a>T</a>
							<a>U</a>
							<a>V</a>
							<a>W</a>
							<a>X</a>
							<a>Y</a>
							<a>Z</a>
						</div>
						<div class="mui-indexed-list-alert"></div>
						<div class="mui-indexed-list-inner">
							<div class="mui-indexed-list-empty-alert">没有数据</div>
							<ul class="mui-table-view">
								<li data-group="A" class="mui-table-view-divider mui-indexed-list-group">A</li>
								<li data-group="B" class="mui-table-view-divider mui-indexed-list-group">B</li>
								<li data-group="C" class="mui-table-view-divider mui-indexed-list-group">C</li>
								<li data-group="D" class="mui-table-view-divider mui-indexed-list-group">D</li>
								<li data-group="E" class="mui-table-view-divider mui-indexed-list-group">E</li>
								<li data-group="F" class="mui-table-view-divider mui-indexed-list-group">F</li>
								<li data-group="G" class="mui-table-view-divider mui-indexed-list-group">G</li>
								<li data-group="H" class="mui-table-view-divider mui-indexed-list-group">H</li>
								<li data-group="I" class="mui-table-view-divider mui-indexed-list-group">I</li>
								<li data-group="J" class="mui-table-view-divider mui-indexed-list-group">J</li>
								<li data-group="K" class="mui-table-view-divider mui-indexed-list-group">K</li>
								<li data-group="L" class="mui-table-view-divider mui-indexed-list-group">L</li>
								<li data-group="M" class="mui-table-view-divider mui-indexed-list-group">M</li>
								<li data-group="N" class="mui-table-view-divider mui-indexed-list-group">N</li>
								<li data-group="O" class="mui-table-view-divider mui-indexed-list-group">O</li>
								<li data-group="P" class="mui-table-view-divider mui-indexed-list-group">P</li>
								<li data-group="Q" class="mui-table-view-divider mui-indexed-list-group">Q</li>
								<li data-group="R" class="mui-table-view-divider mui-indexed-list-group">R</li>
								<li data-group="S" class="mui-table-view-divider mui-indexed-list-group">S</li>
								<li data-group="T" class="mui-table-view-divider mui-indexed-list-group">T</li>
								<li data-group="U" class="mui-table-view-divider mui-indexed-list-group">U</li>
								<li data-group="V" class="mui-table-view-divider mui-indexed-list-group">V</li>
								<li data-group="W" class="mui-table-view-divider mui-indexed-list-group">W</li>
								<li data-group="X" class="mui-table-view-divider mui-indexed-list-group">X</li>
								<li data-group="Y" class="mui-table-view-divider mui-indexed-list-group">Y</li>
								<li data-group="Z" class="mui-table-view-divider mui-indexed-list-group">Z</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</aside>
		<div class="mui-inner-wrap">
			<div id="offCanvasContentScroll" class="mui-content mui-scroll-wrapper">
				<div class="mui-scroll">
		<div class="app">
			<div class="main">
				<div class="headtop">
					<div class="ultab clearfloat" id="ultab">
						<div class="tablist active">
							<div>在售</div>
							<div class="border"></div>
						</div>
						<div class="tablist">
							<div>求购</div>
							<div class="border"></div>
						</div>
					</div>
					<div class="fenlei flex font14 cor3">
						<div class="flist" id="offCanvasShow">
							<span>品牌</span>
							<img src="/home/image/bottom.png" />
						</div>
						<div class="flist chexingbtn" id="showUserPicker">
							<span>车型</span>
							<img src="/home/image/bottom.png" />
						</div>
						<div class="flist jiagebtn" id="showUserPicker1">
							<span>价格</span>
							<img src="/home/image/bottom.png" />
						</div>
						
						<div class="chexing">
							<div class="cxtit">不限车型</div>
							<div class="cxbox">
								<span>舒适性</span>
								<span>轿车型</span>
								<span>商务型</span>
								<span>加长型</span>
							</div>
						</div>
						<div class="jiage">
							<span>5万以下</span>
							<span>5-10万</span>
							<span>10-15万</span>
							<span>15-20万</span>
							<span>20-25万</span>
							<span>25-30万</span>
						</div>
					</div>
				</div>
				<#--品牌-->
				<input type="hidden" id="brand" class="brand" name="brand" value="${brand!}">
				<#--车型-->
				<input type="hidden" id="arctic" class="arctic" name="arctic" value="">
				<#--价格-->
				<input type="hidden" id="price" name="price" value="">
				<div class="bg_rgba"></div>
				<div class="center">
					<div class="mui-content mui-scroll-wrapper" style="position: static; padding-top: 0.12rem;" id="salesContainer">
						<div class="mui-scrol">
							<div id="slist">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
					<#include "../common/botton.ftl"/>
				</div>
			</div>
		</div>
	</div>
		<script type="text/javascript" src="/home/js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="/home/js/common.js"></script>
		<script type="text/javascript" src="/home/js/mui.min.js"></script>
		<script type="text/javascript" src="/home/js/mui.picker.js"></script>
		<script type="text/javascript" src="/home/js/mui.poppicker.js"></script>
		<script type="text/javascript" src="/home/js/swiper.min.js"></script>
		<script type="text/javascript" src="/home/js/pinyinUtil.js"></script>
		<script src="/home/js/mui.indexedlist.js"></script>
	<script>
		/*banner*/
		var swiper = new Swiper('.swiper-container', {
			loop: true,
			pagination: {
				el: '.swiper-pagination',
				clickable: true,
			},
			autoplay: {
				disableOnInteraction: false,
			},
		});

		$(function () {
			//首页导航条滚动
			$(window).scroll(function () {
				var top = $(window).scrollTop();
				var banner = $(".banner").height();
				var winheight = document.body.clientHeight;
				if (top >= banner) {
					$('.headtop').css('height', '1.3rem');
					var height = $('.headtop').height();
					$(".headtop").addClass("fixed");
					$('.pinpai').css('height', winheight - height);
				} else {
					$(".headtop").removeClass("fixed");
					$('.headtop').css('height', 'auto');
				}

			});

		});
	</script>
	<script>
		mui("#ultab").on("tap",".tablist",function () {
			var $tab = $(this);
			var $parent = $(this).parents("#ultab");
			$parent.find(".active").removeClass("active");
			$tab.addClass("active");
			//var newVar = $tab.index()+1;
			param.type = $tab.index() + 1;
			param.page = 1;

			$("#slit").html("");
			mui('#salesContainer').pullRefresh().refresh(true);
			pullupRefresh();
		})
	</script>
	<script>
	/*	var arctic = $("#arctic").val();
		var brand = $("#brand").val()
		var price = $("#price").val()
		var param = {
			"type": 1,
			"page": 1,
			"brand": brand,
			"arctic": arctic,
			"price": price
		};*/

		var param = {
			"type": 1,
			"page": 1,
		};

		var is_loading = false;
		mui.init({
			pullRefresh: {
				container: '#salesContainer',
				up: {
					auto: true,
					contentrefresh: '正在加载...',
					callback: pullupRefresh
				}
			}
		});

		function pullupRefresh() {
			// $("#slist").empty();
			$("#slist").html("");
			//mui('#salesContainer').pullRefresh().endPullupToRefresh(false); //参数为true代表没有更多数据了。
			var url = '/car/index';
			$.ajax({
				url: url,
				data: param,
				type: 'POST',
				beforeSend: function () {
					if (is_loading == true) {
						return false;
					}
					is_loading = true;
				},
				complete: function (xhr, status) {
					is_loading = false;
				},
				success: function (response) {

					if (response.code == 0) {
						mui.toast(response.msg, {duration: "short", type: "div"})
						return false;
					}
					var items = response.data;
					if (items.length == 0) {
						mui('#salesContainer').pullRefresh().endPullupToRefresh(true);
						return false;
					}
					$("#slist").empty();
					mui('#salesContainer').pullRefresh().endPullupToRefresh(false);
					for (var i = 0; i < items.length; i++) {
						var html = '<div class="splist clearfloat">\n' +
								'\t\t\t\t\t\t\t\t\t<a href="/user/details?id=' + items[i].id + '"><div class="spleft fl">\n' +
								'\t\t\t\t\t\t\t\t\t\t<img src="' + items[i].issuePrints[0].cover + '" />\n' +
								'\t\t\t\t\t\t\t\t\t</div>\n' +
								'\t\t\t\t\t\t\t\t\t<div class="spright fr">\n' +
								'\t\t\t\t\t\t\t\t\t\t<div class="sptit w_s_2">' + items[i].title + '</div>\n' +
								'\t\t\t\t\t\t\t\t\t\t<div class="show flex space-between">\n' +
								'\t\t\t\t\t\t\t\t\t\t\t<span class="price">￥' + items[i].price + '万</span>\n' +
								'\t\t\t\t\t\t\t\t\t\t\t<span class="zaishou">' + items[i].shop.name + '</span>\n' +
								'\t\t\t\t\t\t\t\t\t\t</div>\n' +
								'\t\t\t\t\t\t\t\t\t</div>\n' +
								'\t\t\t\t\t\t\t\t</div></a>'
						$("#slist").append(html)
					}
					param.page = param.page + 1;
				}
			})
		};

		//--------------------------------------------------------------------
		//车型
		mui.init();
		mui.ready(function () {
			var userPicker = new mui.PopPicker();
			$.ajax({
				url: "/user/arctic",
				dataType: "json",
				type: "POST",
				success: function (ret) {
					//console.log(ret)
					var data = ret.object
					//var jsonObj =  JSON.parse(data)
					var result = [];
					for (var i = 0; i < data.length; i++) {
						//console.log(data[i])
						var item = {
							value: data[i].id,
							text: data[i].name,
						}
						result.push(item)
					}
					//console.log(result)
					userPicker.setData(result);
					var showUserPickerButton = document.getElementById('showUserPicker');
					//var userResult = document.getElementById('.userResult');
					showUserPickerButton.addEventListener('tap', function (event) {
						userPicker.show(function (items) {
							//console.log(items)
							var val = $("#arctic").val(items[0].text);

							//var arctic = $("#arctic").val();
							var arctic = $("#arctic").val();
							var brand = $("#brand").val()
							param.arctic=arctic
							console.log(param);
							$("#slist").html("");
							pullupRefresh();
						});
					}, false);
				}
			})
		});
		//价格
		mui.init();
		mui.ready(function () {
			var userPicker = new mui.PopPicker();
			$.ajax({
				url: "/issue/price",
				dataType: "json",
				type: "POST",
				success: function (ret) {
					//console.log(ret)
					var data = ret.object
					console.log(data)
					//var jsonObj =  JSON.parse(data)
					var result = [];
					for (var i = 0; i < data.length; i++) {
						//console.log(data[i])

						if (data[i].floorPrice == 0 && data[i].ceilingPrice == 10) {
							var item = {
								value: data[i].id,
								text: data[i].ceilingPrice + "万以下",
							}
						}
						var item = {
							value: data[i].id,
							text: data[i].ceilingPrice + "-" + data[i].floorPrice + "万",
						}
						if (data[i].ceilingPrice == 0 && data[i].floorPrice == 30) {
							var item = {
								value: data[i].id,
								text: data[i].floorPrice + "万以下",
							}
						}
						result.push(item)
					}
					//console.log(result)
					userPicker.setData(result);
					var showUserPickerButton = document.getElementById('showUserPicker1');
					//var userResult = document.getElementById('.userResult');
					showUserPickerButton.addEventListener('tap', function (event) {
						userPicker.show(function (items) {
							//console.log(items)
							var val = $("#price").val(items[0].value);
							//alert(val)
							param.price=price
							$("#slist").html("");
							pullupRefresh();
						});
					}, false);
				}
			})
		});
	</script>
	<script>
		mui.init({
			swipeBack: false,
		});
		//侧滑容器父节点
		var offCanvasWrapper = mui('#offCanvasWrapper');
		//主界面容器
		var offCanvasInner = offCanvasWrapper[0].querySelector('.mui-inner-wrap');
		//菜单容器
		var offCanvasSide = document.getElementById("offCanvasSide");
		//移动效果是否为整体移动
		var moveTogether = false;
		//侧滑容器的class列表，增加.mui-slide-in即可实现菜单移动、主界面不动的效果；
		var classList = offCanvasWrapper[0].classList;
		offCanvasWrapper[0].insertBefore(offCanvasSide, offCanvasWrapper[0].firstElementChild);
		classList.add('mui-scalable');
		offCanvasWrapper.offCanvas().refresh();
		mui("body").on("tap", "#offCanvasShow", function () {
			offCanvasWrapper.offCanvas('show');
			return false;
		})
		//主界面和侧滑菜单界面均支持区域滚动；
		mui('#offCanvasSideScroll').scroll();
		mui('#offCanvasContentScroll').scroll();
	</script>
	<script>
		mui.ready(function () {
			var url = '/car/brand';
			$.ajax({
				url: url,
				type: "POST",
				success: function (data) {
					if (data.code == 0) {
						mui.toast(data.msg, {duration: "short", type: "div"})
						return false;
					}
					var data = data.data;
					//console.log(data)
					for (var i in data) {
						//取出中文转换的第一个拼音字母
						var pinyin = ConvertPinyin(data[i].name).substring(0, 1);
						//循环字母列表
						$(".mui-table-view .mui-indexed-list-group").each(function () {
							if ($(this).html() == pinyin) {
								var html = '<li class="mui-table-view-cell mui-indexed-list-item" brand_id="' + data[i].id + '">' + data[i].name + '</li>'
								$(this).after(html);
							}
						})
					}
				}
			})
			var header = document.querySelector('header.mui-bar');
			var list = document.getElementById('list');
			//calc hieght
			list.style.height = (document.body.offsetHeight) + 'px';
			//create
			window.indexedList = new mui.IndexedList(list);
		});
		mui("#list").on("tap", ".mui-indexed-list-item", function () {
			var id = $(this).attr("brand_id");
			var name = $(this).html();
			var arctic = $("#arctic").val()
			offCanvasWrapper.offCanvas('close');
			param.brand = name;
			$("#slist").html("");
			mui('#salesContainer').pullRefresh().refresh(true);
			pullupRefresh();
		})
	</script>
</body>
</html>