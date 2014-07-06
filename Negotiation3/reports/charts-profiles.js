$(function () {

    $('#clusterGraph').highcharts({

        chart: {
            polar: true,
            borderColor: '#34aadc',
            borderWidth: 2,
            type: 'line'
        },

        legend: {
            enabled: false
        },


        title: {
            text: null,
	        margin: 15
        },

        pane: {
            size: '80%',
	        startAngle: -45,
        },

        xAxis: {
            categories: ['Creating Value', 'Empathy', 'Claiming Value', 'Assert'],
            tickmarkPlacement: 'on',
            lineWidth: 0,
			labels: {
				style: {
					whiteSpace: 'nowrap'
				}
			}
        },

        yAxis: {
            lineWidth: 0,
			tickInterval: 4,
			step: 2,
            endOnTick: false,
			endOnTick: true,
            showLastLabel: true,
            startOnTick: true
        },

        tooltip: {
            enabled: false
        },

		credits: {
            enabled: false
         },

        navigation: {
            buttonOptions: {
                enabled: false
            }
        },

        plotOptions: {
            series: {
                fillOpacity: 0.33,
                marker: {
                    fillColor: '#FFFFFF',
                    lineWidth: 2,
                    lineColor: null // inherit from series
                }
            },
        },

        series: [{
            name: 'Rating',
            type: 'area',
            data: [6, 6, 2, 2],
			lineWidth: 5,
            animation: {
                duration: 1000
            }, 
        },	{
	            name: 'Rating',
	            type: 'area',
	            data: [2, 2, 6, 6],
				lineWidth: 5,
	            animation: {
	                duration: 2000
	            }, 
	        }, 	{
			            name: 'Rating',
			            type: 'area',
			            data: [6, 2, 6, 2],
						lineWidth: 5,
			            animation: {
			                duration: 4000
			            }, 
			        }]

    });
});		

$(function () {

    $('#fiveProfiles').highcharts({

        chart: {
            polar: true,
            borderColor: '#34aadc',
            borderWidth: 2,
            type: 'line'
        },

        legend: {
            enabled: false
        },


        title: {
            text: null,
	        margin: 15
        },

        pane: {
            size: '80%',
	        startAngle: -45,
        },

        xAxis: {
            categories: ['Creating Value', 'Empathy', 'Claiming Value', 'Assert'],
            tickmarkPlacement: 'on',
            lineWidth: 0,
			labels: {
				style: {
					whiteSpace: 'nowrap'
				}
			}
        },

        yAxis: {
            lineWidth: 0,
			tickInterval: 4,
			step: 2,
            endOnTick: false,
			endOnTick: true,
            showLastLabel: true,
            startOnTick: true
        },

        tooltip: {
            enabled: false
        },

		credits: {
            enabled: false
         },

        navigation: {
            buttonOptions: {
                enabled: false
            }
        },

        plotOptions: {
            series: {
                fillOpacity: 0.33,
                marker: {
                    fillColor: '#FFFFFF',
                    lineWidth: 2,
                    lineColor: null // inherit from series
                }
            },
        },

        series: [{
            name: 'Rating',
            type: 'area',
            data: [4.861538462, 5.528205128, 2.830769231, 2.77948718],
			lineWidth: 5,
            animation: {
                duration: 1000
            }, 
        },	{
	            name: 'Rating',
	            type: 'area',
	            data: [2.542857143, 3.657142857, 4.542857143, 5.257142857],
				lineWidth: 5,
	            animation: {
	                duration: 2000
	            }, 
	        }, 	{
			            name: 'Rating',
			            type: 'area',
			            data: [4.628571429, 3.085714286, 2.838095238, 5.447619048],
						lineWidth: 5,
			            animation: {
			                duration: 3000
			            }, 
			        }	,	{
					            name: 'Rating',
					            type: 'area',
					            data: [3.222857143, 5.382857143, 2.754285714, 4.64],
								lineWidth: 5,
					            animation: {
					                duration: 4000
					            }, 
					        }, 	{
							            name: 'Rating',
							            type: 'area',
							            data: [4.756363636, 3.636363636, 4.203636364, 3.403636364],
										lineWidth: 5,
							            animation: {
							                duration: 5000
							            }, 
							        }]

    });
});

$(function () {

    $('#empatheticValueCreators').highcharts({

        chart: {
            polar: true,
            borderColor: '#34aadc',
            borderWidth: 2,
            type: 'line'
        },

        legend: {
            enabled: false
        },


        title: {
            text: null,
	        margin: 15
        },

        pane: {
            size: '80%',
	        startAngle: -45,
        },

        xAxis: {
            categories: ['Creating Value', 'Empathy', 'Claiming Value', 'Assert'],
            tickmarkPlacement: 'on',
            lineWidth: 0,
			labels: {
				style: {
					whiteSpace: 'nowrap'
				}
			}
        },

        yAxis: {
            lineWidth: 0,
			tickInterval: 4,
			step: 2,
            endOnTick: false,
			endOnTick: true,
            showLastLabel: true,
            startOnTick: true
        },

        tooltip: {
            enabled: false
        },

		credits: {
            enabled: false
         },

        navigation: {
            buttonOptions: {
                enabled: false
            }
        },

        plotOptions: {
            series: {
                fillOpacity: 0.33,
                marker: {
                    fillColor: '#FFFFFF',
                    lineWidth: 2,
                    lineColor: null // inherit from series
                }
            },
        },

        series: [{
            name: 'Rating',
            type: 'area',
            data: [4.861538462, 5.528205128, 2.830769231, 2.77948718],
			lineWidth: 5,
            animation: {
                duration: 4000
            }
        }]

    });
});		

$(function () {

    $('#assertiveValueClaimers').highcharts({

        chart: {
            polar: true,
            borderColor: '#34aadc',
            borderWidth: 2,
            type: 'line',
            animation: {
                duration: 2000
            }
        },

        legend: {
            enabled: false
        },


        title: {
            text: null,
	        margin: 15
        },

        pane: {
            size: '80%',
	        startAngle: -45,
        },

        xAxis: {
            categories: ['Creating Value', 'Empathy', 'Claiming Value', 'Assert'],
            tickmarkPlacement: 'on',
            lineWidth: 0,
			labels: {
				style: {
					whiteSpace: 'nowrap'
				}
			}
        },

        yAxis: {
            lineWidth: 0,
			tickInterval: 4,
			step: 2,
            endOnTick: false,
			endOnTick: true,
            showLastLabel: true,
            startOnTick: true
        },

        tooltip: {
            enabled: false
        },

		credits: {
            enabled: false
         },

        navigation: {
            buttonOptions: {
                enabled: false
            }
        },

        plotOptions: {
            series: {
                fillOpacity: 0.33,
                marker: {
                    fillColor: '#FFFFFF',
                    lineWidth: 2,
                    lineColor: null // inherit from series
                }
            },
        },

        series: [{
            name: 'Rating',
            type: 'area',
            data: [2.542857143, 3.657142857, 4.542857143, 5.257142857],
			lineWidth: 5,
            animation: {
                duration: 4000
            }
        }]

    });
});		

$(function () {

    $('#assertiveValueCreators').highcharts({

        chart: {
            polar: true,
            borderColor: '#34aadc',
            borderWidth: 2,
            type: 'line',
            animation: {
                duration: 2000
            }
        },

        legend: {
            enabled: false
        },


        title: {
            text: null,
	        margin: 15
        },

        pane: {
            size: '80%',
	        startAngle: -45,
        },

        xAxis: {
            categories: ['Creating Value', 'Empathy', 'Claiming Value', 'Assert'],
            tickmarkPlacement: 'on',
            lineWidth: 0,
			labels: {
				style: {
					whiteSpace: 'nowrap'
				}
			}
        },

        yAxis: {
            lineWidth: 0,
			tickInterval: 4,
			step: 2,
            endOnTick: false,
			endOnTick: true,
            showLastLabel: true,
            startOnTick: true
        },

        tooltip: {
            enabled: false
        },

		credits: {
            enabled: false
         },

        navigation: {
            buttonOptions: {
                enabled: false
            }
        },

        plotOptions: {
            series: {
                fillOpacity: 0.33,
                marker: {
                    fillColor: '#FFFFFF',
                    lineWidth: 2,
                    lineColor: null // inherit from series
                }
            },
        },

        series: [{
            name: 'Rating',
            type: 'area',
            data: [4.628571429, 3.085714286, 2.838095238, 5.447619048],
			lineWidth: 5,
            animation: {
                duration: 4000
            }
        }]

    });
});		


$(function () {

    $('#relationalNegotiatiors').highcharts({

        chart: {
            polar: true,
            borderColor: '#34aadc',
            borderWidth: 2,
            type: 'line',
            animation: {
                duration: 2000
            }
        },

        legend: {
            enabled: false
        },


        title: {
            text: null,
	        margin: 15
        },

        pane: {
            size: '80%',
	        startAngle: -45,
        },

        xAxis: {
            categories: ['Creating Value', 'Empathy', 'Claiming Value', 'Assert'],
            tickmarkPlacement: 'on',
            lineWidth: 0,
			labels: {
				style: {
					whiteSpace: 'nowrap'
				}
			}
        },

        yAxis: {
            lineWidth: 0,
			tickInterval: 4,
			step: 2,
            endOnTick: false,
			endOnTick: true,
            showLastLabel: true,
            startOnTick: true
        },

        tooltip: {
            enabled: false
        },

		credits: {
            enabled: false
         },

        navigation: {
            buttonOptions: {
                enabled: false
            }
        },

        plotOptions: {
            series: {
                fillOpacity: 0.33,
                marker: {
                    fillColor: '#FFFFFF',
                    lineWidth: 2,
                    lineColor: null // inherit from series
                }
            },
        },

        series: [{
            name: 'Rating',
            type: 'area',
            data: [3.222857143, 5.382857143, 2.754285714, 4.64],
			lineWidth: 5,
            animation: {
                duration: 4000
            }
        }]

    });
});		

$(function () {

    $('#outcomeFocusedNegotiatiors').highcharts({

        chart: {
            polar: true,
            borderColor: '#34aadc',
            borderWidth: 2,
            type: 'line',
            animation: {
                duration: 2000
            }
        },

        legend: {
            enabled: false
        },


        title: {
            text: null,
	        margin: 15
        },

        pane: {
            size: '80%',
	        startAngle: -45,
        },

        xAxis: {
            categories: ['Creating Value', 'Empathy', 'Claiming Value', 'Assert'],
            tickmarkPlacement: 'on',
            lineWidth: 0,
			labels: {
				style: {
					whiteSpace: 'nowrap'
				}
			}
        },

        yAxis: {
            lineWidth: 0,
			tickInterval: 4,
			step: 2,
            endOnTick: false,
			endOnTick: true,
            showLastLabel: true,
            startOnTick: true
        },

        tooltip: {
            enabled: false
        },

		credits: {
            enabled: false
         },

        navigation: {
            buttonOptions: {
                enabled: false
            }
        },

        plotOptions: {
            series: {
                fillOpacity: 0.33,
                marker: {
                    fillColor: '#FFFFFF',
                    lineWidth: 2,
                    lineColor: null // inherit from series
                }
            },
        },

        series: [{
            name: 'Rating',
            type: 'area',
            data: [4.756363636, 3.636363636, 4.203636364, 3.403636364],
			lineWidth: 5,
            animation: {
                duration: 4000
            }
        }]

    });
});		
