$(function () {

  $('#gimc').highcharts({

    chart: {
      type: 'gauge',
      plotBackgroundColor: null,
      plotBackgroundImage: null,
      plotBorderWidth: 0,
      plotShadow: false
    },

    title: {
      text: 'IMC - Índice de Massa Corporal'
    },


    pane: {
      startAngle: -150,
      endAngle: 150,
      background: [{
        backgroundColor: {
          linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
          stops: [
          [0, '#FFF'],
          [1, '#333']
          ]
        },
        borderWidth: 0,
        outerRadius: '109%'
      }, {
        backgroundColor: {
          linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
          stops: [
          [0, '#333'],
          [1, '#FFF']
          ]
        },
        borderWidth: 1,
        outerRadius: '107%'
      }, {
                // default background
              }, {
                backgroundColor: '#DDD',
                borderWidth: 0,
                outerRadius: '105%',
                innerRadius: '103%'
              }]
            },

        // the value axis
        yAxis: {
          min: 15,
          max: 35,

          minorTickInterval: 'auto',
          minorTickWidth: 1,
          minorTickLength: 10,
          minorTickPosition: 'inside',
          minorTickColor: '#666',

          tickPixelInterval: 30,
          tickWidth: 2,
          tickPosition: 'inside',
          tickLength: 10,
          tickColor: '#666',
          labels: {
            step: 2,
            rotation: 'auto'
          },
          title: {
            text: 'IMC'
          },
          plotBands: [{
            from: 15,
            to: 17,
                color: '#DF5353' // red
              }, {
                from: 17.01,
                to: 18.49,
                color: '#DDDF0D' // yellow
              }, {
                from: 18.50,
                to: 24.99,
                color: '#55BF3B' // green
              }, {
                from: 25,
                to: 29.99,
                color: '#DDDF0D' // yellow
              }, {
                from: 30,
                to: 34.99,
                color: '#DF5353' // red
              }]
            },

            series: [{
              name: 'IMC',
              data: [gon.imc],
              tooltip: {
                valueSuffix: ' kg/m²'
              }
            }]

          },
        // Add some life
        function (chart) {
          if (!chart.renderer.forExport) {
            setInterval(function () {
              var point = chart.series[0].points[0],
              newVal,
           //   inc = Math.round((Math.random() - 0.5) * 20);

              newVal = point.y + inc;
              if (newVal < 0 || newVal > 200) {
                newVal = point.y - inc;
              }

              point.update(newVal);

            }, 3000);
          }
        });

});