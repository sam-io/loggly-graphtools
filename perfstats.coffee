loggly.bark.external_command {
	perfstats: {
		run: (args, stdin, context)->
					
			plotProperty = args[0]						
							
			drawChart = ()->
                datadisplayed = false
                elem = $("<div></div>")
                context.$output.append(elem)
                dataArray = [["Timestamp", plotProperty]]
                minVal = Number.MAX_VALUE
                maxVal = Number.MIN_VALUE
                
                jsonProperty = plotProperty.substring(5) if plotProperty.indexOf("json.")==0

                for data in stdin.series[0].data                
                    ticks = if jsonProperty!="" then parseInt(data.json[jsonProperty]) else parseInt(data[plotProperty])                
                    dataArray.push([new Date(data.timestamp).toLocaleTimeString(), ticks]) 
                    minVal = Math.min(ticks, minVal)
                    maxVal = Math.max(ticks, maxVal)

                emptyArray = [["Timestamp", plotProperty]]
                emptyArray.push([new Date(data.timestamp).toLocaleTimeString(), minVal]) for data in stdin.series[0].data
                emptyArray[1][1] = maxVal

                data = google.visualization.arrayToDataTable(emptyArray)

                options = {
                    title:  "Performance",
                    backgroundColor: "transparent",
                    animation: {
                        duration: 500,
                        easing: "linear"
                    }
                }
									
                chart = new google.visualization.LineChart(elem[0])
                google.visualization.events.addListener(chart, 'ready', ()->
                    if !datadisplayed
                        datadisplayed = true
                        data = google.visualization.arrayToDataTable(dataArray)
                        chart.draw(data, options)
                )
                chart.draw(data, options)
										
            google.load("visualization", "1", {'packages':['corechart', 'table'], "callback" : drawChart})
	}
}

myscript = document.createElement("script")
myscript.src = "https://www.google.com/jsapi"
document.body.appendChild(myscript)


