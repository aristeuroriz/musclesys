$(function () {
    $('#gpizza').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: 1,//null,
            plotShadow: false
        },
        title: {
            text: 'Proporções corporais'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },       
        series: [{
        	type: 'pie',
        	name: 'Proporções',
        	data: [
        	['Tórax', gon.torax1 ],
        	['Braços', gon.bracos1],
        	['Abdómen',   gon.cintura1],
        	['Quadríceps', gon.pernas1],
        	['Pernas', gon.pernas1]
        	]
        }]
    });
});