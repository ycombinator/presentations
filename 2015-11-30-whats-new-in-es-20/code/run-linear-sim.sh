open "http://localhost:5601/app/kibana#/visualize/create?type=line&indexPattern=logstash-*&_a=(filters:!(),linked:!f,query:(query_string:(analyze_wildcard:!t,query:'*')),vis:(aggs:!((id:'1',params:(field:value),schema:metric,type:avg),(id:'2',params:(customInterval:'2h',extended_bounds:(),field:'@timestamp',interval:s,min_doc_count:1),schema:segment,type:date_histogram)),listeners:(),params:(addLegend:!t,addTimeMarker:!f,addTooltip:!t,defaultYExtents:!f,drawLinesBetweenPoints:!t,interpolate:linear,radiusRatio:9,scale:linear,setYExtents:!f,shareYAxis:!t,showCircles:!t,smoothLines:!f,times:!(),yAxis:()),type:line))&_g=(refreshInterval:(display:'1%20second',pause:!f,section:1,value:1000),time:(from:now-5m,mode:quick,to:now))"

curl -XDELETE 'http://localhost:9200/logstash-*'

INTERVAL_IN_S=1 BASE_VALUE=2 ANOMALOUS_EVENT_INDEX=40 node generate-linear-data.js | ~/logstash-2.0.0/bin/logstash -e 'input { stdin {} } filter { json { source => message } } output { stdout { codec => rubydebug } elasticsearch {} }'


