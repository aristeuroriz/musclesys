$(function () {
    $('#gpizza').highcharts({
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45,
                beta: 0
            }
        },
        title: {
            text: 'Proporções do corpo'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                depth: 35,
                dataLabels: {
                    enabled: true,
                    format: '{point.name}'
                }
            }
        },
    series: [{
            type: 'pie',
            name: 'Proporção',
            data: [
            ['Tórax', gon.torax],
            ['Braços', gon.bracos],
            ['Cintura',   gon.cintura],
            ['Quadril', gon.quadril],
            ['Pernas', gon.pernas]
            ]
        }]
    });
});