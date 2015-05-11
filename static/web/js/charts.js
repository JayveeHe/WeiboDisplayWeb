	 function donut(data)
       {   
           var min = -100;
           var max = 100;
           var meter1 = new RGraph.Meter('meter1', min, max, data);
           var grad1 = RGraph.RadialGradient(meter1, meter1.canvas.width / 6, 200, 50, meter1.canvas.height - 10, 200, 200, '#10a300', '#10a300');
           var grad2 = RGraph.RadialGradient(meter1, meter1.canvas.width / 2, 200, 50, meter1.canvas.height - 25, 200, 200, '#1a4ec8', '#1a4ec8');
           var grad3 = RGraph.RadialGradient(meter1, meter1.canvas.width / 2, 200, 50, meter1.canvas.height - 25, 200, 200, '#c2006f', '#c2006f');
           meter1.Set('chart.green.color', grad1);        
           meter1.Set('chart.green.start',60);    
           meter1.Set('chart.yellow.color', grad2);
           meter1.Set('chart.yellow.end', 60);
           meter1.Set('chart.yellow.start', -60);
           meter1.Set('chart.red.color', grad3);
           meter1.Set('chart.red.end', -60);
           meter1.Set('chart.border', false);//整体边框
           meter1.Set('chart.needle.linewidth', 5);
           meter1.Set('chart.needle.tail', true);
           meter1.Set('chart.tickmarks.big.num', 0);//标尺散点
           meter1.Set('chart.tickmarks.small.num', 0);//标尺
           meter1.Set('chart.segment.radius.start', 93);//颜色宽度
           meter1.Set('chart.needle.radius', 80);
           meter1.Set('chart.needle.linewidth', 4);
         // meter1.Set('chart.linewidth.segments', 3);//边框
           //meter1.Set('chart.strokestyle', 'black');
           meter1.Set('chart.text.size', 0);//文字尺寸
         //  meter1.Set('chart.background.color', 'rgba(0,0,0,0)');
         
          RGraph.isOld() ? meter1.Draw() : RGraph.Effects.Meter.Grow(meter1);var min = -10;
       }
	 //层级分析棒图
	 function bar(data){
	 var chart;
     chart = new Highcharts.Chart({
         chart: {
             renderTo: 'cj_column',
             type: 'column',
             backgroundColor:null,
             margin: [ 10, 0, 30, 3],
         },
         title: {
             text: ' '
         },
         subtitle: {
             text: ' '
         },
         xAxis: {
        	 categories:["第一层","第二层","第三层","第四层","四层+"],
              gridLineColor:null,
               labels: {
                 rotation: -35,
                 align: 'center',
                 y:20,
                 style: {
                     fontSize: '9px',
                     color:'#fff',
                     fontFamily:'微软雅黑',
                 }
             }
         },
         yAxis: {
             min: 0,
             title: {
                 text: 'Rainfall (mm)'
             },
              gridLineColor:null
         },
         legend: {
					enabled: false

         },
         tooltip: {
             formatter: function() {
                 return ''+
                     this.x +': '+ this.y +'';
             }
         },
         plotOptions: {
             column: {
                 pointPadding: 0.2,
                 borderWidth: 0
             }
         },
             series: [{
             color:{linearGradient: ["0%", "0%", "0%","100%"],
                 stops: [
                     [0, '#06babc'],
                     [1, '#2e5ea6']
                 ]},
             data: data,
             dataLabels: {
					enabled: true,
					rotation: 0,
					color: '#FFFFFF',
					align: 'center',
					x: 0,
					y: 0,
					formatter: function() {
						return this.y;
					},
					style: {
						font: 'normal 13px Verdana, sans-serif'
					}
				}
 
         },]
     });
	 }
     //水军分析
	function shuijun(data){
		var chart;
		var data0 = ~~data[0].toFixed(0);
		var data1 = ~~data[1].toFixed(0);
	     chart = new Highcharts.Chart({
	         chart: {
	             renderTo: 'sj_pie',
	             type: 'pie',
	             backgroundColor:null,
	             margin: [ 0, 0, 0, 0],
	         },
	         title: {
	                text: ''
	            },
	            tooltip: {
	        	    pointFormat: '{point.y}%</b>',
	            	percentageDecimals: 1
	            },
	            plotOptions: {
	                pie: {
	                	borderWidth:0,
	                    allowPointSelect: true,
	                    cursor: 'pointer',
	                    dataLabels: {
	                        enabled: false,
	                        color: '#000000',
	                        connectorColor: '#000000',
	                        formatter: function() {
	                            return '<b>'+ this.point.name +'</b>: '+ this.percentage +' %';
	                        }
	                    }
	                }
	            },
	            colors: [{linearGradient: ["0%", "0%", "0%", "100%"],
	                 stops: [
	                         [0, '#1a8db1'],
	                         [1, '#05bcbc']
	                     ]},{linearGradient: ["0%", "100%", "0%", "0%"],
	    	                 stops: [
	    	                         [0, '#1a8db1'],
	    	                         [1, '#1a4ec8']
	    	                     ]}],
	            series: [{
	            	type: 'pie',
	            	data:[["水军账户",data0],["真实用户",data1]],
	            }]
	     });
	}
	//转发时间曲线
	function area(data,time,kol1,kol2,kol3,kol1Name,kol2Name,kol3Name){
	 var interval ; 
		timeLength = time.length;
		if(timeLength  > 7){
			interval = ~~(timeLength/7);
		}else{
			interval = timeLength;
		}
		var chart;
		for(var i = 0 ; i <data.length; i ++){
			data[i] = eval("("+data[i]+")");
		}
	     chart = new Highcharts.Chart({
	         chart: {
	             renderTo: 'time_line',
	             type: 'area',
	             backgroundColor:null,
	             margin: [ 10, 23, 29, 40],
	         },
	         title: {
	             text: ' '
	         },
	         subtitle: {
	             text: ' '
	         },
	         xAxis: {
	        	// type :"datatime",
	        	 categories:time,
	        	 tickInterval :interval, 
	             lineColor: '#00d2ff',
	             lineWidth: 2,
	               labels: {
	                 rotation: 0,
	                 align: 'center',
	                 style: {
	                     fontSize: '9px',
	                     color:'#d9d9d9',
	                     fontFamily:'微软雅黑'
	                 }
	             }
	         },
	         yAxis: {
	        	 labels: {
	        		 y:1,
	             },
	        	 min:0,
	                title: {
	                    text: ''
	                },
	                
	         
	            },
	            tooltip: {
	                shared: true,
	                formatter: function() {
                        if(this.x == kol1 && this.x != kol2 && this.x!=kol3){
						return  kol1Name;
						}
						else if(this.x == kol2 && this.x != kol1 && this.x!=kol3){
						return  kol2Name;
						}
						else if(this.x == kol3 && this.x != kol1 && this.x!=kol2){
						return  kol3Name;
						}
						else if(this.x == kol1 && this.x == kol2 && this.x!=kol3){
						return  kol1Name +'<br/>'+kol2Name;
						}
						else if(this.x == kol1 && this.x == kol3 && this.x!=kol2){
						return  kol1Name +'<br/>'+kol3Name;
						}
						else if(this.x == kol2 && this.x == kol3 && this.x!=kol1){
						return  kol2Name +'<br/>'+kol3Name;
						}
						else if(this.x == kol1 && this.x == kol2 && this.x==kol3){
						return  kol1Name +'<br/>'+kol2Name+'<br/>'+kol3Name;
						}
						else{
						return this.x;
						}
					
					}

	            },
	            legend: {
	                enabled: false
	            },
	            plotOptions: {
	                area: {
	                    fillColor: {
	                        linearGradient: { x1: "0%", y1: "0%", x2: "0%", y2: "150%"},
	                        stops: [
	                            [0, "#ea9f27"],
	                            [1, "rgba(74,51,28,0)"]
	                        ]
	                    },
	                    lineWidth: 2,
	                    marker: {
	                    	radius: 2.5,
	                        enabled: true,
	                    },
	                    shadow: false,
	                    states: {
	                        hover: {
	                            lineWidth: 1
	                        }
	                    },
	                    threshold: null
	                }
	            },
	         series: [{
	                color:"#ff9300",
	                data: data,
	            }]
	     });
	}
	     //企业认证
	function qiye(data){
	var chart;
	     chart = new Highcharts.Chart({
	         chart: {
	             renderTo: 'v_donut',
	             type: 'pie',
	             backgroundColor:null,
	             margin: [ 0, 0, 0, 0],
	         },
	         title: {
	                text: ''
	            },
	            tooltip: {
	        	    pointFormat: '{point.percentage}%</b>',
	            	percentageDecimals: 1
	            },
	            plotOptions: {
	                pie: {
	                	size:160,
	                	borderWidth:0,
	                    allowPointSelect: true,
	                    cursor: 'pointer',
	                    dataLabels: {
	                        enabled: false,
	                        color: '#000000',
	                        connectorColor: '#000000',
	                        formatter: function() {
	                            return '<b>'+ this.point.name +'</b>: '+ this.percentage +' %';
	                        }
	                    },
	                    events: {
	                        click: function(e) {
	                        	var datatotal = 0;
	                        	for( var i = 0 ; i < data.length ; i ++){
	                        		datatotal = datatotal + data[i];
	                        	}
	                        	$(".v_middle span:eq(0)").text(e.point.name);
	                        	$(".v_middle span:eq(1)").text((e.point.y/datatotal*100).toFixed(1)+"%");
	                        },
	                    }
	                },
	                    
	            
	            },
	            colors: ["#1a4ec8","#b61c1c","#ea9f27","#05bcbc"],
	            series: [{
	            	 innerSize: '63%',
	            	type: 'pie',
	            	data:[["企业认证",data[3]]
	            		,["微博达人",data[1]]
	            		,["个人认证",data[2]]
	            		,["普通用户",data[0]]
	            	],
	            	
	            },
	           
	            ]
	          
	     });
	}
	   //男女认证
	function nannv(data){
		var chart ;
	chart = new Highcharts.Chart({
	         chart: {
	             renderTo: 'nv_donut',
	             type: 'pie',
	             backgroundColor:null,
	             margin: [ 0, 0, 0, 0],
	         },
	         title: {
	                text: ''
	            },
	            tooltip: {
	        	    pointFormat: '{point.percentage}%</b>',
	            	percentageDecimals: 1
	            },
	            plotOptions: {
	                pie: {
	                	size:160,
	                	borderWidth:0,
	                    allowPointSelect: true,
	                    cursor: 'pointer',
	                    dataLabels: {
	                        enabled: false,
	                        color: '#000000',
	                        connectorColor: '#000000',
	                        formatter: function() {
	                            return '<b>'+ this.point.name +'</b>: '+ this.percentage +' %';
	                        }
	                    },
	                    events: {
	                        click: function(e) {
	                        	var datatotal = 0;
	                        	for( var i = 0 ; i < data.length ; i ++){
	                        		datatotal = datatotal + data[i];
	                        	}
	                        	$(".nv_middle span:eq(0)").text(e.point.name);
	                        	$(".nv_middle span:eq(1)").text((e.point.y/datatotal*100).toFixed(1)+"%");
	                        },
	                    }
	                },
	              
	            },
	            colors: ["#ff4ddc","#05bcbc"],
	            series: [{
	            	 innerSize: '63%',
	            	type: 'pie',
	            	data:[["女",data[0]]
	            		,["男",data[1]]
	            	],
	            }]
	          
	     });
	}
	   //地图
	function map(data){
		window.data = window.data ||{}; 
		var dataProvince = new Array;
				dataProvince =data;
			$("#province-info-mod").empty();
		window.data['province-info1'] = window.data['province-info1']||dataProvince;
		var provinceView = new shu.ProvinceView($('#province-info-mod')[0]);
		var options = document.location.href.indexOf('searchindex') == -1 ? {} : {tips_name: '搜索人数'};
		provinceView.render(window.data['province-info1'], options);
	}
		//传播图
	function zhiweigexf(data){
	dataxxx = data+"sina.gexf";
		init(dataxxx);
		 function init() {
				document.getElementById("sigma-example").innerHTML = " ";
				var sigInst = sigma.init(document.getElementById('sigma-example')).drawingProperties({
					defaultLabelColor: '#fff',
					defaultLabelSize: 14,
					defaultLabelBGColor: '#fff',
					defaultLabelHoverColor: '#000',
					labelThreshold: 6,
					defaultEdgeType: 'curve'
				}).graphProperties({
					minNodeSize: 0.1,
					maxNodeSize: 10,
					minEdgeSize: 1,
					maxEdgeSize: 1
				}).mouseProperties({
					maxRatio: 32
				});
				sigInst.parseGexf(dataxxx);
				sigInst.draw();
				document.getElementById('hidden').addEventListener('click', hidden, true);
				document.getElementById('init').addEventListener('click', init, true);
				document.getElementById('advanced').addEventListener('click', advanced, true);
				document.getElementById('custom').addEventListener('click', custom, true);
				document.getElementById('attri').addEventListener('click', attri, true);
			}


			function hidden() {
				document.getElementById("sigma-example").innerHTML = " ";
				var sigInst = sigma.init(document.getElementById('sigma-example')).drawingProperties({
					defaultLabelColor: '#fff',
					defaultLabelSize: 14,
					defaultLabelBGColor: '#fff',
					defaultLabelHoverColor: '#000',
					labelThreshold: 6,
					defaultEdgeType: 'curve'
				}).graphProperties({
					minNodeSize: 0.5,
					maxNodeSize: 5,
					minEdgeSize: 1,
					maxEdgeSize: 1
				}).mouseProperties({
					maxRatio: 4
				});
				sigInst.parseGexf(dataxxx);
				sigInst.bind('overnodes',
				function(event) {
					var nodes = event.content;
					var neighbors = {};
					sigInst.iterEdges(function(e) {
						if (nodes.indexOf(e.source) >= 0 || nodes.indexOf(e.target) >= 0) {
							neighbors[e.source] = 1;
							neighbors[e.target] = 1
						}
					}).iterNodes(function(n) {
						if (!neighbors[n.id]) {
							n.hidden = 1
						} else {
							n.hidden = 0
						}
					}).draw(2, 2, 2)
				}).bind('outnodes',
				function() {
					sigInst.iterEdges(function(e) {
						e.hidden = 0
					}).iterNodes(function(n) {
						n.hidden = 0
					}).draw(2, 2, 2)
				});
				sigInst.draw()
			}
			function advanced() {
				document.getElementById("sigma-example").innerHTML = " "; (function() {
					var FishEye = function(sig) {
						sigma.classes.Cascade.call(this);
						var self = this;
						var isActivated = false;
						this.p = {
							radius: 200,
							power: 2
						};
						function applyFishEye(mouseX, mouseY) {
							var newDist, newSize, xDist, yDist, dist, radius = self.p.radius,
							power = self.p.power,
							powerExp = Math.exp(power);
							sig.graph.nodes.forEach(function(node) {
								xDist = node.displayX - mouseX;
								yDist = node.displayY - mouseY;
								dist = Math.sqrt(xDist * xDist + yDist * yDist);
								if (dist < radius) {
									newDist = powerExp / (powerExp - 1) * radius * (1 - Math.exp( - dist / radius * power));
									newSize = powerExp / (powerExp - 1) * radius * (1 - Math.exp( - dist / radius * power));
									if (!node.isFixed) {
										node.displayX = mouseX + xDist * (newDist / dist * 3 / 4 + 1 / 4);
										node.displayY = mouseY + yDist * (newDist / dist * 3 / 4 + 1 / 4)
									}
									node.displaySize = Math.min(node.displaySize * newSize / dist, 10 * node.displaySize)
								}
							})
						};
						function handler() {
							applyFishEye(sig.mousecaptor.mouseX, sig.mousecaptor.mouseY)
						}
						this.handler = handler;
						this.activated = function(v) {
							if (v == undefined) {
								return isActivated
							} else {
								isActivated = v;
								return this
							}
						};
						this.refresh = function() {
							sig.draw(2, 2, 2)
						}
					};
					sigma.publicPrototype.activateFishEye = function() {
						if (!this.fisheye) {
							var sigmaInstance = this;
							var fe = new FishEye(sigmaInstance._core);
							sigmaInstance.fisheye = fe
						}
						if (!this.fisheye.activated()) {
							this.fisheye.activated(true);
							this._core.bind('graphscaled', this.fisheye.handler);
							document.getElementById('sigma_mouse_' + this.getID()).addEventListener('mousemove', this.fisheye.refresh, true)
						}
						return this
					};
					sigma.publicPrototype.desactivateFishEye = function() {
						if (this.fisheye && this.fisheye.activated()) {
							this.fisheye.activated(false);
							this._core.unbind('graphscaled', this.fisheye.handler);
							document.getElementById('sigma_mouse_' + this.getID()).removeEventListener('mousemove', this.fisheye.refresh, true)
						}
						return this
					};
					sigma.publicPrototype.fishEyeProperties = function(a1, a2) {
						var res = this.fisheye.config(a1, a2);
						return res == s ? this.fisheye: res
					}
				})();
				var sigInst = sigma.init(document.getElementById('sigma-example')).drawingProperties({
					defaultLabelColor: '#fff',
					defaultLabelSize: 14,
					defaultLabelBGColor: '#fff',
					defaultLabelHoverColor: '#000',
					labelThreshold: 6,
					defaultEdgeType: 'curve'
				}).graphProperties({
					minNodeSize: 0.5,
					maxNodeSize: 5,
					minEdgeSize: 1,
					maxEdgeSize: 1
				}).mouseProperties({
					maxRatio: 1,
					mouseEnabled: false
				});
				sigInst.parseGexf(dataxxx);
				sigInst.activateFishEye().draw()
			}
			function custom() {
				document.getElementById("sigma-example").innerHTML = " ";
				var sigInst = sigma.init(document.getElementById('sigma-example')).drawingProperties({
					defaultLabelColor: '#fff',
					defaultLabelSize: 14,
					defaultLabelBGColor: '#fff',
					defaultLabelHoverColor: '#000',
					labelThreshold: 6,
					defaultEdgeType: 'curve'
				}).graphProperties({
					minNodeSize: 0.5,
					maxNodeSize: 5,
					minEdgeSize: 1,
					maxEdgeSize: 1
				}).mouseProperties({
					maxRatio: 4
				});
				sigInst.parseGexf(dataxxx);
				var greyColor = '#666';
				sigInst.bind('overnodes',
				function(event) {
					var nodes = event.content;
					var neighbors = {};
					sigInst.iterEdges(function(e) {
						if (nodes.indexOf(e.source) < 0 && nodes.indexOf(e.target) < 0) {
							if (!e.attr['grey']) {
								e.attr['true_color'] = e.color;
								e.color = greyColor;
								e.attr['grey'] = 1
							}
						} else {
							e.color = e.attr['grey'] ? e.attr['true_color'] : e.color;
							e.attr['grey'] = 0;
							neighbors[e.source] = 1;
							neighbors[e.target] = 1
						}
					}).iterNodes(function(n) {
						if (!neighbors[n.id]) {
							if (!n.attr['grey']) {
								n.attr['true_color'] = n.color;
								n.color = greyColor;
								n.attr['grey'] = 1
							}
						} else {
							n.color = n.attr['grey'] ? n.attr['true_color'] : n.color;
							n.attr['grey'] = 0
						}
					}).draw(2, 2, 2)
				}).bind('outnodes',
				function() {
					sigInst.iterEdges(function(e) {
						e.color = e.attr['grey'] ? e.attr['true_color'] : e.color;
						e.attr['grey'] = 0
					}).iterNodes(function(n) {
						n.color = n.attr['grey'] ? n.attr['true_color'] : n.color;
						n.attr['grey'] = 0
					}).draw(2, 2, 2)
				});
				sigInst.draw()
			}
			function attri() {
				document.getElementById("sigma-example").innerHTML = " ";
				var sigInst = sigma.init($('#sigma-example')[0]).drawingProperties({
					defaultLabelColor: '#fff'
				}).graphProperties({
					minNodeSize: 0.5,
					maxNodeSize: 5
				});
				sigInst.parseGexf(dataxxx); (function() {
					var popUp;
					function attributesToString(attr) {
						return '' + attr.map(function(o) {
							return '' + o.attr + ' : ' + o.val + ''
						}).join('') + ''
					}
					function showNodeInfo(event) {
						popUp && popUp.remove();
						var node;
						sigInst.iterNodes(function(n) {
							node = n
						},
						[event.content[0]]);
						popUp = $('').append(attributesToString(node['attr']['attributes'])).attr('id', 'node-info' + sigInst.getID()).css({
							'display': 'inline-block',
							'border-radius': 3,
							'padding': 5,
							'background': '#fff',
							'color': '#000',
							'box-shadow': '0 0 4px #666',
							'position': 'absolute',
							'left': node.displayX,
							'top': node.displayY + 15
						});
						$('ul', popUp).css('margin', '0 0 0 20px');
						$('#sigma-example').append(popUp)
					}
					function hideNodeInfo(event) {
						popUp && popUp.remove();
						popUp = false
					}
					sigInst.bind('overnodes', showNodeInfo).bind('outnodes', hideNodeInfo).draw()
				})()
			}
	}
	//关键词
	function keyword(data){
			var fill = d3.scale.category20();
			 var keywords = data;
			 var sizes = [50,45,44,43,34,33,32,29,24,23,22,21,20];
			  d3.layout.cloud().size([456, 330])
			      .words(keywords.map(function(d,i) {
			    	  var fsize = sizes[i];
			    	  if(fsize == null){
			    		  fsize = 10 + Math.random() * 20
			    	  }
			    	  
			    	  
			        return {text: d, size: fsize};
			      }))
			      .rotate(function() { return ~~(Math.random() * 2) *90;; })
			      .font("Impact")
			      .fontSize(function(d) { return d.size; })
			      .on("end", draw)
			      .start();

			  function draw(words) {
			    d3.select(".guanjianci svg ")
			        .attr("width", 456)
			        .attr("height", 334)
			      .append("g")
			        .attr("transform", "translate(220,170)")
			      .selectAll("text")
			        .data(words)
			      .enter().append("text")
			        .style("font-size", function(d) { return d.size + "px"; })
			        .style("font-family", "微软雅黑")
			        .style("margin","30px")
			        .style("padding","30px")
			        .style("fill", function(d, i) { return fill(i); })
			        .attr("text-anchor", "middle")
			        .attr("transform", function(d) {
			          return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
			        })
			        .text(function(d) { return d.text; });
			  } 
	}
