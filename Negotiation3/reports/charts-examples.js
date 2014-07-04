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
	        margin: 15
        },

        pane: {
            size: '80%',
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
			step: 2,
            endOnTick: false,
			endOnTick: true,
            showLastLabel: true,
            startOnTick: true,
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
            data: [7, 7],
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
	        margin: 15
        },

        pane: {
            size: '80%',
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
			step: 2,
            endOnTick: false,
			endOnTick: true,
            showLastLabel: true,
            startOnTick: true,
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
            data: [7, 7],
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
            data: [4, 4, 4, 4],
			lineWidth: 5,
            animation: {
                duration: 4000
            }

        }]

    });
});		

