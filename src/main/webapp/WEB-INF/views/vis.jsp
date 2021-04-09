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

<div id="container" style="height: 100%; -webkit-tap-highlight-color: transparent; user-select: none;" ><div style="position: relative; width: 1280px; height: 609px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;"><canvas data-zr-dom-id="zr_0" width="2560" height="1218" style="position: absolute; left: 0px; top: 0px; width: 1280px; height: 609px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas></div></div>

</body>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@5/dist/echarts.min.js"></script>
<script>


var dom = document.getElementById("container");
var myChart = echarts.init(dom);
var app = {};

var option;


var a =${visMap.a };
var b =${visMap.b };
var c =${visMap.c };
var d =${visMap.d };
var rangeX = ${visMap.rangeX };
var minY =${visMap.minY };
var maxY = ${visMap.maxY };

function func(a,b,c,d,x) {
    return a*x*x*x + b*x*x + c*x + d;
}

function generateData() {
    let data = [];
    for (let i = 0; i <= rangeX+0.1; i += 0.1) {
        data.push([i, func(a,b,c,d,i)]);
    }
    return data;
}

option = {
    animation: false,
    tooltip: {
        trigger: 'none',
        axisPointer: {
            type: 'cross'
        }
    },
    grid: {
        top: 40,
        left: 50,
        right: 40,
        bottom: 50
    },
    xAxis: {
        name: 'x',
        minorTick: {
            show: true
        },
        minorSplitLine: {
            show: true
        }
    },
    yAxis: {
        name: 'y',
        min: func(a,b,c,d,0)-1,
        max: maxY+1,
        minorTick: {
            show: true
        },
        minorSplitLine: {
            show: true
        }
    },
    dataZoom: [{
        show: true,
        type: 'inside',
        filterMode: 'none',
        xAxisIndex: [0],
        startValue: -20,
        endValue: 20
    }, {
        show: true,
        type: 'inside',
        filterMode: 'none',
        yAxisIndex: [0],
        startValue: -20,
        endValue: 20
    }],
    series: [
        {
            type: 'line',
            showSymbol: false,
            clip: true,
            data: generateData()
        }
    ]
};

if (option && typeof option === 'object') {
    myChart.setOption(option);
}

        
        
</script>
</html>
