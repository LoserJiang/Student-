<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>课程成绩统计分析</title>
    <!-- 引入 ECharts CDN -->
    <script src="https://cdn.jsdelivr.net/npm/echarts@5/dist/echarts.min.js"></script>
    <style>
        body { font-family: "Microsoft YaHei", sans-serif; padding: 20px; background: #f0f2f5; }
        .container { max-width: 1000px; margin: 0 auto; background: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        h2 { border-left: 6px solid #1890ff; padding-left: 15px; color: #333; }
        .filter-area { margin: 20px 0; }
        .filter-area select, .filter-area button { padding: 8px 16px; font-size: 15px; border-radius: 4px; border: 1px solid #d9d9d9; }
        .filter-area button { background: #1890ff; color: #fff; border: none; cursor: pointer; }
        .filter-area button:hover { background: #40a9ff; }
        .stat-box { display: flex; gap: 20px; flex-wrap: wrap; margin: 20px 0; }
        .stat-item { background: #fafafa; padding: 15px 30px; border-radius: 8px; text-align: center; flex: 1; min-width: 100px; border: 1px solid #e8e8e8; }
        .stat-item .num { font-size: 28px; font-weight: bold; color: #1890ff; }
        .stat-item .label { color: #888; font-size: 14px; margin-top: 5px; }
        #chart { width: 100%; height: 400px; margin-top: 20px; }
        .no-data { text-align: center; color: #999; padding: 50px 0; font-size: 16px; }
    </style>
</head>
<body>
<div class="container">
    <h2>📊 课程成绩统计分析（教务员）</h2>

    <div class="filter-area">
        <form method="get" action="${pageContext.request.contextPath}/ScoreStatServlet">
            <label>选择课程：</label>
            <select name="subId" onchange="this.form.submit()">
                <option value="">-- 请选择 --</option>
                <c:forEach var="sub" items="${subjectList}">
                    <option value="${sub.id}" ${sub.id == selectedSubId ? 'selected' : ''}>
                        ${sub.name}
                    </option>
                </c:forEach>
            </select>
            <button type="submit">查询统计</button>
        </form>
    </div>

    <c:choose>
        <c:when test="${not empty stat && stat.total > 0}">
            <!-- 统计卡片 -->
            <div class="stat-box">
                <div class="stat-item"><div class="num">${stat.total}</div><div class="label">考试人数</div></div>
                <div class="stat-item"><div class="num">${stat.avgScore}</div><div class="label">平均分</div></div>
                <div class="stat-item"><div class="num">${stat.maxScore}</div><div class="label">最高分</div></div>
                <div class="stat-item"><div class="num">${stat.minScore}</div><div class="label">最低分</div></div>
            </div>

            <!-- 柱状图 -->
            <div id="chart"></div>
            <script>
                (function() {
                    var chart = echarts.init(document.getElementById('chart'));
                    var option = {
                        title: { text: '各分数段人数分布', left: 'center' },
                        tooltip: { trigger: 'axis' },
                        xAxis: {
                            type: 'category',
                            data: ['0-59', '60-69', '70-79', '80-89', '90-100']
                        },
                        yAxis: {
                            type: 'value',
                            name: '人数',
                            minInterval: 1
                        },
                        series: [{
                            type: 'bar',
                            data: [
                                ${stat.range1},
                                ${stat.range2},
                                ${stat.range3},
                                ${stat.range4},
                                ${stat.range5}
                            ],
                            itemStyle: {
                                color: function(params) {
                                    var colors = ['#ff4d4f', '#faad14', '#1890ff', '#52c41a', '#1890ff'];
                                    return colors[params.dataIndex];
                                }
                            },
                            label: {
                                show: true,
                                position: 'top',
                                formatter: function(params) {
                                    return params.value + '人';
                                }
                            }
                        }]
                    };
                    chart.setOption(option);
                    window.addEventListener('resize', function() { chart.resize(); });
                })();
            </script>
        </c:when>
        <c:when test="${not empty selectedSubId}">
            <div class="no-data">该课程暂无成绩数据，请先录入成绩。</div>
        </c:when>
        <c:otherwise>
            <div class="no-data">请选择一门课程进行统计。</div>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>