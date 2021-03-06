$(document).ready(function(){
			// 使用jquery方法获取 2d context 对象
			var ctx = $("#myChart").get(0).getContext("2d");

			// 使用$.zui.Chart构造Chart实例
			var myNewChart = new $.zui.Chart(ctx);
			var data = {
			    // labels 数据包含依次在X轴上显示的文本标签
			    labels: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
			    datasets: [{
			        // 数据集名称，会在图例中显示
			        label: "预约成功",
			        color: "red",
			        // 数据集
			        data: [65, 59, 80, 81, 56, 55, 40, 44, 55, 70, 30, 40]
			    }, {
			        label: "预约人数",
			        color: "green",
			        data: [28, 48, 40, 19, 86, 27, 90, 60, 30, 44, 50, 66]
			    }]
			};

			var options = {
				 ///Boolean - 是否在图表上显示网格
			    scaleShowGridLines : true,
			    //String - 网格线条颜色
			    scaleGridLineColor : "rgba(0,0,0,.05)",
			    //Number - 网格宽度
			    scaleGridLineWidth : 1,
			    //Boolean - 是否显示水平坐标，即X轴
			    scaleShowHorizontalLines: true,
			    //Boolean - 是否显示垂直坐标，即Y轴
			    scaleShowVerticalLines: true,
			    //Boolean - 是否显示为平滑曲线
			    bezierCurve : true,
			    //Number - 平滑曲线时所使用的贝塞尔曲线参数
			    bezierCurveTension : 0.4,
			    //Boolean - 是否显示顶点
			    pointDot : true,
			    //Number - 顶点半径，单位像素
			    pointDotRadius : 4,
			    //Number - 顶点描边线条宽度，单位像素
			    pointDotStrokeWidth : 1,
			    //Number - 检测鼠标点击所使用依据的半径大小，单位像素
			    pointHitDetectionRadius : 20,
			    //Boolean - 是否
			    datasetStroke : true,
			    //Number - 数据集线条宽度，单位为像素
			    datasetStrokeWidth : 2,
			    //Boolean - 是否用颜色来填充数据集
			    datasetFill : true,
			    //String - 图例模板
			    legendTemplate : "<ul class='<%=name.toLowerCase()%>-legend'><% for (var i=0; i<datasets.length; i++){%><li><span style='background-color:<%=datasets[i].strokeColor%>'></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"
			}; // 图表配置项，可以留空来使用默认的配置

			var myLineChart = $("#myChart").lineChart(data, options);
		});