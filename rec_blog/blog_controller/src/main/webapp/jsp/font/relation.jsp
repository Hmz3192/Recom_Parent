<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path"
       scope="page"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <script type="text/javascript" src="${path}/resource/neo4j/js/plugins/d3/d3.v4.js"></script>
    <script type="text/javascript" src="${path}/resource/neo4j/js/plugins/jquery/jquery-1.9.1.js"></script>
</head>
<body>
<script type="text/javascript">
    d3.json("${path}/resource/neo4j/Neo4jSon.json", function(json) {
        new GroupExplorer('#infoId',{
            data:json
        });
        function GroupExplorer(wrapper,config){
            var defaultConfig={
                data:{"nodes":[],"links":[]},
                width:340,
                height:600,
                distance:100
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
            this.vis = d3.select("body").append("svg:svg")
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
            d3.select("body").on('dblclick',function(){
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


