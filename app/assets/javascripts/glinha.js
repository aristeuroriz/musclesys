$(function () {
  $('#glinha').highcharts({
     title: {
        text: 'Evolução em linha',
            x: -20 //center
        },
        subtitle: {
        	text: '',
        	x: -20
        },
        xAxis: {
        	categories: [gon.data1, gon.data2, gon.data3, gon.data4]
        },
        yAxis: {
        	title: {
        		text: 'Valores'
        	},
        	plotLines: [{
        		value: 0,
        		width: 1,
        		color: '#808080'
        	}]
        },
        tooltip: {
        	valueSuffix: ' cm'
        },
        legend: {
        	layout: 'vertical',
        	align: 'right',
        	verticalAlign: 'middle',
        	borderWidth: 0
        },
        series: [{
        	name: 'Tórax',
        	data: [gon.torax1, gon.torax2, gon.torax3, gon.torax4]
        }, {
        	name: 'Braços',
        	data: [gon.bracos1, gon.bracos2, gon.bracos3, gon.bracos4]
        }, {
        	name: 'Abdómen',
        	data: [gon.cintura1, gon.cintura2, gon.cintura3, gon.cintura4]
        }, {
        	name: 'Pernas',
        	data: [gon.pernas1, gon.pernas2, gon.pernas3, gon.pernas4]
        }, {
            name: 'Peso',
            data: [gon.peso1, gon.peso2, gon.peso3, gon.peso4],
                tooltip: {
                valueSuffix: ' kg'
        }
        }]
    });
});


