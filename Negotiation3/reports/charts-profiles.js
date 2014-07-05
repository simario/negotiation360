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
            text: "Cluster Analysis",
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
            text: "Empathetic Value-Creators",
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
            text: "Assertive Value-Claimers",
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
            data: [2, 2, 6, 6],
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
            text: "Assertive Value-Creators",
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
            data: [6, 2, 2, 6],
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
            text: "Relational Negotiatiors",
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
            data: [2, 6, 2, 6],
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
            text: "Outcome-Focused Negotiators",
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
            data: [6, 2, 6, 2],
			lineWidth: 5,
            animation: {
                duration: 4000
            }
        }]

    });
});		
