$(function () {

    $('#interpersonalDimension').highcharts({

        chart: {
            polar: true,
            borderColor: '#34aadc',
            borderWidth: 2,
            type: 'line',
        },

        legend: {
            enabled: false
        },


        title: {
            text: "Interpersonal Scale",
	        margin: 10
        },

        pane: {
            size: '65%',
        },

        xAxis: {
            categories: ['Empathy', 'Assert'],
            tickmarkPlacement: 'on',
            lineWidth: 0,
			labels: {
				style: {
					whiteSpace: 'nowrap',
				}
			}
        },

        yAxis: {
            lineWidth: 0,
			tickInterval: 4,
            max: 8,
			min: 0,
			labels: {
				enabled: false
			}
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
                    fillColor: '#fff',
                    lineWidth: 2,
                    lineColor: null // inherit from series
                }
            },
        },

        series: [{
            name: 'Rating',
            type: 'area',
            data: [8, 8],
			lineWidth: 5,
            animation: {
                duration: 4000
            }

        }]

    });
});

$(function () {

    $('#outcomeDimension').highcharts({

        chart: {
            polar: true,
            borderColor: '#34aadc',
            borderWidth: 2,
            type: 'line',
        },

        legend: {
            enabled: false
        },


        title: {
            text: "Outcomes Scale",
	        margin: 10
        },

        pane: {
            size: '65%',
	        startAngle: -90,
        },

        xAxis: {
            categories: ['Creating Value', 'Claiming Value'],
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
            max: 8,
			min: 0,
			labels: {
				enabled: false
			}
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
            data: [8, 8],
			lineWidth: 5,
            animation: {
                duration: 4000
            }

        }]

    });
});

$(function () {

    $('#equalRatings').highcharts({

        chart: {
            polar: true,
            borderColor: '#34aadc',
            borderWidth: 2,
            type: 'line',
        },

        legend: {
            enabled: false
        },


        title: {
            text: "Equal Ratings",
	        margin: 10
        },

        pane: {
            size: '65%',
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
            max: 8,
			min: 0
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
            data: [5, 5, 5, 5],
			lineWidth: 5,
            animation: {
                duration: 4000
            }

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
	        margin: 10
        },

        pane: {
            size: '65%',
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
            max: 8,
			min: 0
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
            data: [7, 7, 3, 3],
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
	        margin: 10
        },

        pane: {
            size: '65%',
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
            max: 8,
			min: 0
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
            data: [3, 3, 7, 7],
			lineWidth: 5,
            animation: {
                duration: 4000
            }
        }]

    });
});		
