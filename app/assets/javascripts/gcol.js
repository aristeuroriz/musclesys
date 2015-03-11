$(function () {
    $('#gcol').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Evolução em barra'
        },
        subtitle: {
            text: ''
        },
        xAxis: {
            categories: [gon.data1, gon.data2, gon.data3, gon.data4]
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Centímetros (cm)'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.1f} cm</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: 'Tórax',
            data: [gon.torax1, gon.torax2, gon.torax3, gon.torax4]

        }, {
            name: 'Braços',
            data: [gon.bracos1, gon.bracos2, gon.bracos3, gon.bracos4]

        }, {
            name: 'Cintura',
            data: [gon.cintura1, gon.cintura2, gon.cintura3, gon.cintura4]

        }, {
            name: 'Pernas',
            data: [gon.pernas1, gon.pernas2, gon.pernas3, gon.pernas4]

        }]
    });
});