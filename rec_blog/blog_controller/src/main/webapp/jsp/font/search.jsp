<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"
       scope="page"/>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>搜索页-NewsPro</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
    <meta name="renderer" content="webkit">
    <meta name="baidu-site-verification" content="R9XA5lWxu2"/>
    <meta name="author" content="NewsPro">
    <link rel="stylesheet" type="text/css" href="${path}/resource/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/resource/css/build.css">
    <link rel="stylesheet" type="text/css" href="${path}/resource/css/activity.css">
    <link href="${path}/resource/css/login.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/resource/css/zzsc.css" rel="stylesheet" type="text/css"/>
    <link href="${path}/resource/css/dlzc.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" type="text/css" href="${path}/resource/css/nanoscroller.css">

    <script type="text/javascript" src="${path}/resource/neo4j/js/plugins/d3/d3.v4.js"></script>

    <script type="text/javascript" src="${path}/resource/js/jquery.js"></script>

    <style>
        .search-sort-wrap {
            margin: 24px 0 18px;
            height: 26px;
            width: 121px;
            border: 1px solid #43a7f3;
            line-height: 27px;
            display: flex;
            font-size: 0
        }

        .search-sort-wrap a {
            display: inline-block;
            font-size: 14px;
            color: #43a7f3;
            width: 50%;
            text-align: center
        }

        .search-sort-wrap a.active {
            background: #43a7f3;
            color: #fff
        }

        .search-wrap-list-ul h2 {
            font-size: 18px;
            line-height: 28px
        }

        .search-list-warp .no-relevant-info {
            text-align: center;
            margin-left: 0
        }
    </style>
</head>
<body>
<%@include file="header.jsp" %>
<div class="placeholder-height"></div>

<div class="container" id="index">
    <div class="wrap-left pull-left">

        <form role="search" method="post" action="${path}/query">
            <input class="search-input-list" name="queryString" value="${queryString}">
            <button type="submit" style="background-color: #e19d5e" class="search-btn transition"><i class="icon icon-search-list"></i></button>
        </form>
        <!--<div class="search-sort-wrap">
            <a class="js-search-sort active" href="#">相关度</a>
            <a class="js-search-sort" href="#">最新</a>
        </div>-->
        <hr>
        <span style="font-size: 15px">为您找到一共 <span style="font-size: 20px;color: red">${num}</span> 条相关资讯</span>
        <hr>

        <c:if test="${num == 0}">
            <div class="search-list-warp">
                <div class="no-relevant-info">
                    暂无相关内容
                </div>
            </div>
        </c:if>
        <c:if test="${num !=null}">
            <div class="search-list-warp">
                <ul class="search-wrap-list-ul">
                    <c:forEach items="${requestScope.searchList}" var="map">
                        <li>
                            <a href="${path}/toarticle/${map.id }" target="_blank"><span style="font-size: 20px"> ${map.title }</span></a>
                            <span style="font-style: oblique;float:right;color: red;font-size: 30px" > <u>${map.hit }</u></span>
                            <br>
                            <div class="mob-summay">
                                    <font size="3px" style="color: #9E9E9E">概要</font>：${map.summ }...
                            </div>
                            <div class="mob-summay">
                                <font size="3px" style="color: #9E9E9E">内容</font>：${map.conten }...
                            </div>
                            <div class="mob-summay">
                                <font size="3px" style="color: #9E9E9E">附件Ⅰ</font>：${map.klAppendix1 }...
                            </div>
                            <div class="mob-summay">
                                <font size="3px" style="color: #9E9E9E">附件Ⅱ</font>：${map.klAppendix2 }...
                            </div>
                            <div class="mob-summay">
                                <font size="3px" style="color: #9E9E9E">附件Ⅲ</font>：${map.klAppendix3 }...
                            </div>
                            <div class="mob-summay">
                                <font size="3px" style="color: #9E9E9E">附件Ⅳ</font>：${map.klAppendix4 }...
                            </div>
                            <div class="mob-summay">
                                <font size="3px" style="color: #9E9E9E">附件Ⅴ</font>：${map.klAppendix5 }...
                            </div>
                            <div class="mob-author"><span class="name">国仁</span>
                                <span class="time">2018-03-08 07:53</span>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                <nav class="page-nav">
                    <ul class="pagination">
                        <li class="disabled"><a href="#" aria-label="First"><span aria-hidden="true"><i
                                class="icon icon-first"></i></span></a></li>
                        <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true"><i
                                class="icon icon-lt"></i></span></a></li>
                        <li class="active"><a>1</a></li>
                        <c:if test="${num>10}">
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                        </c:if>
                        <li><a href="#"><i
                                class="icon icon-gt"></i></a></li>
                        <li><a href="#"><i
                                class="icon icon-last"></i></a></li>
                    </ul>
                </nav>
            </div>
        </c:if>
    </div>
    <div class="wrap-right pull-right">
        <div class="box-moder moder-project-list moder-user-list">
            <h3><b>相关信息</b></h3>
            <span class="span-mark"></span>
            <c:if test="${neoTotal > 0}">
            <div class="no-relevant-info" style="margin: 0px" id="infoId">
            </div>
            <div class="no-relevant-info" style="margin: 0px">
                <b>姓名：</b><i style="font-size: 25px;color: #1d1d1d">${neoUser.neoName}</i>
                <hr>
                <b>性别：</b><i style="font-size: 25px;color: #1d1d1d">${neoUser.neoSex}</i>
                <hr>
                <b>年龄：</b><i style="font-size: 25px;color: #1d1d1d">"36"</i>
                <hr>
                <b>职位：</b><i style="font-size: 25px;color: #1d1d1d">${neoUser.neoPower}</i>
                <hr>
                <b>介绍：</b><i style="font-size: 25px;color: #1d1d1d">${neoUser.neoIntro}</i>
            </div>
            </c:if>
            <c:if test="${neoTotal == 0}">
                <div class="no-relevant-info" style="margin: 0px">
                    未找到更多信息
                </div>
            </c:if>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>

<script type="text/javascript" src="${path}/resource/js/mouse.js"></script>

<script type="text/javascript">

    d3.json("${path}/rel/${queryString}", function(json) {
        new GroupExplorer({
            data:json
        });
        function GroupExplorer(config){
            var defaultConfig={
                data:{"nodes":[],"links":[]},
                width:340,
                height:370,
                distance:50
            };
            $.extend(true,defaultConfig,config);

            defaultConfig.data.links.forEach(function (e) {
                if(typeof e.source=="number"&&typeof e.target=="number"){
                    var sourceNode = defaultConfig.data.nodes.filter(function (n) {
                            return n.id === e.source;
                        })[0],
                        targetNode = defaultConfig.data.nodes.filter(function (n) {
                            return n.id === e.target;
                        })[0];
                    e.source = sourceNode;
                    e.target = targetNode;
                }
            });

            var _this=this,highlighted=null,dependsNode=[],dependsLinkAndText=[];

            //定义缩放zoom
            var zoom = d3.zoom()
                .scaleExtent([0.2,10])
                .on("zoom",function(){
                    _this.zoomed();
                });
            //定义图谱
            this.vis = d3.select("#infoId").append("svg:svg")
                .attr("width", defaultConfig.width)
                .attr("height", defaultConfig.height)
                .call(zoom).on("dblclick.zoom", null);

            this.vis=this.vis.append('g').attr('class','all')
                .attr("width", defaultConfig.width)
                .attr("height", defaultConfig.height)

            //定义force对象，力导图
            this.force = d3.forceSimulation()
                .nodes(defaultConfig.data.nodes)
                .force("link", d3.forceLink(defaultConfig.data.links).distance(defaultConfig.distance))
                .force("charge", d3.forceManyBody())
                .force("center", d3.forceCenter(defaultConfig.width / 2, defaultConfig.height / 2))
                .force("charge",d3.forceManyBody())
                .force("collide",d3.forceCollide(60).strength(0.2).iterations(5))

            //设置箭头属性
            this.vis.append("svg:defs").selectAll("marker")
                .data(["end"])
                .enter().append("svg:marker")
                .attr("id","arrow")
                .attr('class','arrow')
                .attr("viewBox", "0 -5 10 10")
                .attr("refX", 27)
                .attr("refY", 0)
                .attr("markerWidth", 9)
                .attr("markerHeight", 16)
                .attr("markerUnits","userSpaceOnUse")
                .attr("orient", "auto")
                .append("svg:path")
                .attr("d", "M0,-5L10,0L0,5")
                .attr('fill','#666');

            this.link = this.vis.selectAll("line.link")
                .data(defaultConfig.data.links)
                .enter().append("svg:line")
                .attr("class", "link")
                .attr('stroke-width',1)
                .attr("x1", function(d) { return d.source.x; })
                .attr("y1", function(d) { return d.source.y; })
                .attr("x2", function(d) { return d.target.x; })
                .attr("y2", function(d) { return d.target.y; })
                .attr("marker-end","url(#arrow)")
                .attr('stroke','#999');

            var dragstart=function(d, i) {
                console.info(d3.event.subject)
                _this.force.stop();
                d3.event.sourceEvent.stopPropagation();
            };

            var dragmove=function(d, i) {
                d.px += d3.event.dx;
                d.py += d3.event.dy;
                d.x += d3.event.dx;
                d.y += d3.event.dy;
                _this.tick();
            };

            var dragend=function(d, i) {
                d3.event.subject.fx = null;
                d3.event.subject.fy = null;
                _this.force.restart();
                _this.tick();
            };

            this.nodeDrag = d3.drag()
                .on("start", dragstart)
                .on("drag", dragmove)
                .on("end", dragend);


            this.highlightObject=function(obj){
                if (obj) {
                    var objIndex= obj.index;
//                    dependsNode=dependsNode.concat([objIndex]);
                    dependsLinkAndText=dependsLinkAndText.concat([objIndex]);
                    defaultConfig.data.links.forEach(function(lkItem){
                        if(objIndex==lkItem['source']['index']){
                            dependsNode=dependsNode.concat([lkItem.target.index])
                        }else if(objIndex==lkItem['target']['index']){
                            dependsNode=dependsNode.concat([lkItem.source.index])
                        }
                    });
                    _this.node.classed('inactive',function(d){
                        return (dependsNode.indexOf(d.index)==-1)
                    });
                    _this.link.classed('inactive', function(d) {

                        return ((dependsLinkAndText.indexOf(d.source.index)==-1)&&(dependsLinkAndText.indexOf(d.target.index)==-1))
                    });

                    _this.linetext.classed('inactive',function(d){
                        return ((dependsLinkAndText.indexOf(d.source.index)==-1)&&(dependsLinkAndText.indexOf(d.target.index)==-1))
                    });
                } else {
                    _this.node.classed('inactive', false);
                    _this.link.classed('inactive', false);
                    _this.linetext.classed('inactive', false);
                }
            };

            this.node = this.vis.selectAll("g.node")
                .data(defaultConfig.data.nodes)
                .enter().append("svg:g")
                .attr("class", "node")
                .call(_this.nodeDrag)    //绘图
                .on('mouseover', function(d) {
                    if (_this.node.mouseoutTimeout) {
                        clearTimeout(_this.node.mouseoutTimeout);
                        _this.node.mouseoutTimeout = null;
                    }
//                    _this.highlightToolTip(d);
                })
                .on('mouseout', function() {
                    if (_this.node.mouseoutTimeout) {
                        clearTimeout(_this.node.mouseoutTimeout);
                        _this.node.mouseoutTimeout = null;
                    }
                    _this.node.mouseoutTimeout=setTimeout(function() {
//                        _this.highlightToolTip(null);
                    }, 300);
                })
                .on('dblclick',function(d){
                    _this.highlightObject(d);
                    d3.event.stopPropagation();
                });
            d3.select("#infoId").on('dblclick',function(){
                dependsNode=dependsLinkAndText=[];
                _this.highlightObject(null);
            });

            //定义图片
            this.node.append("svg:image")
                .attr("class", "circle")
                //                .attr("xlink:href", "images/chenhai.png")
                .attr("xlink:href", function(d){return "${path}/resource/neo4j/images/"+d.image})
                .attr("x", "-15px")
                .attr("y", "-15px")
                .attr("width", "40px")
                .attr("height", "40px");
            //节点下方文字
            this.node.append("svg:text")
                .attr("class", "nodetext")
                .attr("dy", "30px")
                .attr('text-anchor','middle')
                .text(function(d) { return d.name });

            //边上的文字
            this.linetext=this.vis.selectAll('.linetext')
                .data(defaultConfig.data.links)
                .enter()
                .append("text")
                .attr("class", "linetext")
                .attr("x",function(d){ return (d.source.x + d.target.x) / 2})
                .attr("y",function(d){ return (d.source.y + d.target.y) / 2})
                .text(function (d) {
                    return d.type
                })
                .call(d3.drag());

            this.zoomed=function(){
                _this.vis.attr("transform", d3.event.transform);
            };

            //移动时进行重新调整位置
            this.tick=function() {
                _this.link.attr("x1", function(d) { return d.source.x; })
                    .attr("y1", function(d) { return d.source.y; })
                    .attr("x2", function(d) { return d.target.x})
                    .attr("y2", function(d) { return d.target.y;});
                _this.linetext.attr("x",function(d){ return (d.source.x + d.target.x) / 2})
                    .attr("y",function(d){ return (d.source.y + d.target.y) / 2});
                _this.node.attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });
            };
            _this.force.on("tick", this.tick);

        }

    });
</script>
</body>
</html>
