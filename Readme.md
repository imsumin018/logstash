### Logstash Command

```
$bash  #change shell to bash 
1001460000@logstash-node-0:~/bca_777$ pwd
/workspace/bca_777

1001460000@logstash-node-0:~/bca_777$ ls
N779XW-LOG-SYSTEM-messages-20220411-192002.log  N779XW-filter-01.conf  example_create_index.conf  output  test_yong.conf

1001460000@logstash-node-0:~/bca_777$ logstash -f /workspace/bca_777/N779XW-filter-01.conf 

```

# Refernces
logstash support grok patteren and regex 

## Official reference of logstash grok pattern
- https://www.elastic.co/guide/en/logstash/current/plugins-filters-grok.html
- https://www.elastic.co/blog/do-you-grok-grok
- https://github.com/elastic/logstash/blob/v1.4.2/patterns/grok-patterns

### Maps on kibana
- https://www.elastic.co/guide/en/kibana/current/maps-getting-started.html
- https://www.elastic.co/guide/en/kibana/current/indexing-geojson-data-tutorial.html

### korean 
- https://sites.google.com/view/elastic-tip/elasticsearch/pipelines-processor
- elastic korea Elastic Group :  https://www.youtube.com/watch?v=cCWhU7Kdf2c

### other references 
- Grok web debugger : http://grokconstructor.appspot.com/do/construction -> 'random example' 
- https://medium.com/hackernoon/structuring-unstructured-data-with-grok-bcdbb240fcd1
- https://coralogix.com/blog/logstash-grok-tutorial-with-examples/
- https://grokdebugger.com/
- regex debugger: https://regex101.com/ 
- https://note.com/airitech/n/n9ee79c2adff4

### 전세계 Airport point
- https://openflights.org/data.html#airport​
- https://github.com/jpatokal/openflights/tree/master/data
- https://blog.naver.com/xomyjoung/221675932480
- https://blog.naver.com/xomyjoung/221639085235
