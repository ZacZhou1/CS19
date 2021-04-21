<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="/WEB-INF/views/include.jsp"%>
<html>
<head>
<title>Psychometric</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="${pageContext.request.contextPath }/asset/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<h1 class="display-4" align="center">Psychometric Mapping Tool</h1>

	<table class="table">
		<thead>
			<tr>
				<th scope="col">User Name</th>
				<th scope="col">psychometricSpace</th>
				<th scope="col">numericSpace</th>
				<th scope="col">Detail</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${map.documentData }" var="data">

				<tr>
					<th >${data.userName} </th>
					<td>${data.psychometricSpace}</td>
					<td>${data.numericSpace}</td>
					<td><a href="/cs19/storedalgorithm/${data.idString}">click</a></td>
				</tr>

			</c:forEach>
		</tbody>
	</table>
	
	
	<div class="container">
		<div class="row">
			<div class="col" align="center">
				
				<div id="container1" style="height: 420px;">
					<div>
						<canvas data-zr-dom-id="zr_0"></canvas>
					</div>
				</div>
			</div>
			
		</div>
	</div>


<form>
  <div class="form-group">
    <label for="formControlRange">Description</label>
    <input>
    <input type="range" class="form-control-range" id="formControlRange" min="0" step=0.1  onchange="checkField()">
  </div>
  <button>Confirm</button>
</form>
<br>




</body>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@5/dist/echarts.min.js"></script>
<script>
var rangeX = ${visMap.rangeX};
var Inputrange = document.getElementById("formControlRange");
Inputrange.setAttribute("max",rangeX+1);

var algorithmtype = '${visMap.algorithmtype}';
function checkField() {
	if (algorithmtype == 'A') {
	    curveFit(); 

	}  
	if (algorithmtype == 'B') {
		linearVis();  
	}
	if (algorithmtype == 'C') {
		cubicVis();
	}
	if (algorithmtype == 'D') {
		shepardVis();
	}
	console.log(Inputrange.value)
}





var psyArr=new Array()
var psyCount = 0
<c:forEach items="${visMap.psylist}" var="psy">
	var psy = "${psy}";
	psyArr[psyCount] = psy;
	psyCount++;
</c:forEach>

var numArr=new Array()
var numCount = 0
<c:forEach items="${visMap.numlist}" var="num">
	var num = "${num}";
	numArr[numCount] = num;
	numCount++;
</c:forEach>

function func(a, b, c, d, x) {
	return a * x * x * x + b * x * x + c * x + d;
}

 function generateData() {
	 
	
	let data = [];

	var a = ${visMap.a};
	var b = ${visMap.b};
	var c = ${visMap.c};
	var d = ${visMap.d};
	
	for (let i = 0; i <= rangeX + 1; i += 0.1) {
		data.push([ i, func(a, b, c, d, i) ]);
	}
	return data;
} 


function generateData2() {
	let data = [];
	let i = 0;
	<c:forEach items="${visMap.linerArrayList }" var="num">
		var numStr = "${num}";
		var numFloat =parseFloat(numStr); 
		data.push([ i, numFloat]);
		i = i +0.1;
	</c:forEach>
	return data;
}

function generateData3() {
	let data = [];
	let i = 0;
	<c:forEach items="${visMap.cubicArrayList }" var="num">
		var numStr = "${num}";
		var numFloat =parseFloat(numStr); 
		data.push([ i, numFloat]);
		i = i +0.1;
	</c:forEach>
	return data;
}

function generateData4() {
	let data = [];
	let i = 0;
	<c:forEach items="${visMap.shepardArrayList }" var="num">
		var numStr = "${num}";
		var numFloat =parseFloat(numStr); 
		data.push([ i, numFloat]);
		i = i +0.1;
	</c:forEach>
	return data;
}




function curveFit() {
	var dom = document.getElementById("container1");
	var myChart = echarts.init(dom);
	var option; 
	
	option = {
			animation : false,
			tooltip : {
				trigger : 'none',
				axisPointer : {
					type : 'cross'
				}
			},
			grid : {
				top : 40,
				left : 50,
				right : 40,
				bottom : 50
			},
			xAxis : {
				name : 'x',
				show : false,
				minorTick : {
					show : true
				},
				minorSplitLine : {
					show : true
				}
			},
			yAxis : {
				name : 'y',
				minorTick : {
					show : true
				},
				minorSplitLine : {
					show : true
				}
			},
			dataZoom : [ {
				show : true,
				type : 'inside',
				filterMode : 'none',
				xAxisIndex : [ 0 ],
				startValue : -20,
				endValue : 20
			}, {
				show : true,
				type : 'inside',
				filterMode : 'none',
				yAxisIndex : [ 0 ],
				startValue : -20,
				endValue : 20
			} ],
			series : [ {
				type : 'line',
				showSymbol : false,
				clip : true,
				data : generateData(),
				markLine: {
	                symbol: ['none', 'none'],
	                data: markline(),
	                lineStyle:{ normal:{ color:'white', opacity:1, } }
	            }
			} ]
		}; 
	
	if (option && typeof option === 'object') {
		myChart.clear();
		myChart.setOption(option);
	} 
	
} 


function linearVis(){

	var dom = document.getElementById("container1");
	var myChart = echarts.init(dom);
	var option; 
	
	option = {
			animation : false,
			tooltip : {
				trigger : 'none',
				axisPointer : {
					type : 'cross'
				}
			},
			grid : {
				top : 40,
				left : 50,
				right : 40,
				bottom : 50
			},
			xAxis : {
				name : 'x',
				show : false,
				minorTick : {
					show : true
				},
				minorSplitLine : {
					show : true
				}
			},
			yAxis : {
				name : 'y',
				minorTick : {
					show : true
				},
				minorSplitLine : {
					show : true
				}
			},
			dataZoom : [ {
				show : true,
				type : 'inside',
				filterMode : 'none',
				xAxisIndex : [ 0 ],
				startValue : -20,
				endValue : 20
			}, {
				show : true,
				type : 'inside',
				filterMode : 'none',
				yAxisIndex : [ 0 ],
				startValue : -20,
				endValue : 20
			} ],
			series : [ {
				type : 'line',
				showSymbol : false,
				clip : true,
				data : generateData2(),
				markLine: {
	                symbol: ['none', 'none'],
	                data: markline(),
	                lineStyle:{ normal:{ color:'white', opacity:1, } }
	            }
			} ]
		}; 
	
	if (option && typeof option === 'object') {
		myChart.clear();
		myChart.setOption(option);
	} 
} 
function cubicVis() {
	var dom = document.getElementById("container1");
	var myChart = echarts.init(dom);
	var option; 
	
	option = {
			animation : false,
			tooltip : {
				trigger : 'none',
				axisPointer : {
					type : 'cross'
				}
			},
			grid : {
				top : 40,
				left : 50,
				right : 40,
				bottom : 50
			},
			xAxis : {
				name : 'x',
				show : false,
				minorTick : {
					show : true
				},
				minorSplitLine : {
					show : true
				}
			},
			yAxis : {
				name : 'y',
				minorTick : {
					show : true
				},
				minorSplitLine : {
					show : true
				}
			},
			dataZoom : [ {
				show : true,
				type : 'inside',
				filterMode : 'none',
				xAxisIndex : [ 0 ],
				startValue : -20,
				endValue : 20
			}, {
				show : true,
				type : 'inside',
				filterMode : 'none',
				yAxisIndex : [ 0 ],
				startValue : -20,
				endValue : 20
			} ],
			series : [ {
				type : 'line',
				showSymbol : false,
				clip : true,
				data : generateData3(),
				markLine: {
	                symbol: ['none', 'none'],
	                data: markline(),
	                lineStyle:{ normal:{ color:'white', opacity:1, } }
	            }
			} ]
		}; 
	
	if (option && typeof option === 'object') {
		myChart.clear();
		myChart.setOption(option);
	} 
} 


function shepardVis() {
	var dom = document.getElementById("container1");
	var myChart = echarts.init(dom);
	var option; 
	
	option = {
			animation : false,
			tooltip : {
				trigger : 'none',
				axisPointer : {
					type : 'cross'
				}
			},
			grid : {
				top : 40,
				left : 50,
				right : 40,
				bottom : 50
			},
			xAxis : {
				name : 'x',
				show : false,
				minorTick : {
					show : true
				},
				minorSplitLine : {
					show : true
				}
			},
			yAxis : {
				name : 'y',
				minorTick : {
					show : true
				},
				minorSplitLine : {
					show : true
				}
			},
			dataZoom : [ {
				show : true,
				type : 'inside',
				filterMode : 'none',
				xAxisIndex : [ 0 ],
				startValue : -20,
				endValue : 20
			}, {
				show : true,
				type : 'inside',
				filterMode : 'none',
				yAxisIndex : [ 0 ],
				startValue : -20,
				endValue : 20
			} ],
			series : [ {
				type : 'line',
				showSymbol : false,
				clip : true,
				data : generateData4(),
				markLine: {
	                symbol: ['none', 'none'],
	                data: markline(),
	                lineStyle:{ normal:{ color:'white', opacity:1, } }
	            }
			} ]
		}; 
	
	if (option && typeof option === 'object') {
		myChart.clear();
		myChart.setOption(option);
	} 
	
}



function markline(){
	var asd =new Array();
	for (var i = 0; i < psyArr.length; i++) {
		console.log(psyArr[i])
		var a = { name:psyArr[i], label:{show:true, position:'start', formatter: '{b}' }, xAxis:i+1 }
		asd[i] = a;
	}
	var as = { name:"choose", label:{show:true, position:'start', formatter: '{b}' }, xAxis:Inputrange.value,lineStyle:{ normal:{ color:'black', opacity:1, } } }
	asd[asd.length] = as;
	return asd
} 



if (algorithmtype == 'A') {
    curveFit(); 

}  
if (algorithmtype == 'B') {
	linearVis();  
}
if (algorithmtype == 'C') {
	cubicVis();
}
if (algorithmtype == 'D') {
	shepardVis();
}

</script>
</html>
