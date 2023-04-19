#Jupyter Notebook terminal에서 실행
#01 인덱스 조회
curl -XGET -u elastic:bketc123 http://192.168.16.148:9200/_cat/indices?v

#02 지도위에 표기할 GeoJSON 필드 미리 생성
curl -XPUT -u elastic:bketc123 http://192.168.167.219:9200/n779_data-20230404-01 -H 'Content-Type: application/json' -d '
{
  "mappings": {
    "properties": {
      "location": {
        "type": "geo_point"
      }
    }
  }
}'

curl -XPUT -u elastic:bketc123 http://192.168.167.219:9200/n779_data-20230404-02 -H 'Content-Type: application/json' -d '
{
  "mappings": {
    "properties": {
      "location": {
        "type": "geo_point"
      }
    }
  }
}'

curl -XPUT -u elastic:bketc123 http://192.168.167.219:9200/n779_data-20230404-03 -H 'Content-Type: application/json' -d '
{
  "mappings": {
    "properties": {
      "location": {
        "type": "geo_point"
      }
    }
  }
}'

#참고용
curl -XPUT -u elastic:bketc123 http://192.168.16.148:9200/_template/test-log777-n779xw-01-wh001-message -H 'Content-Type: application/json' -d '
{
  "order":0,
  "index_patterns":"test-log777-n779xw-01-wh001-message",
  "mappings": {
   "calls": {
      "dynamic_templates": [
        {
          "locations": {
            "match": "location",
            "mapping": { "type": "geo_point" }
          }
        }
      ]
    }
  }
}'
{"error":{"root_cause":[{"type":"mapper_parsing_exception","reason":"Root mapping definition has unsupported parameters:  [calls : {dynamic_templates=[{locations={mapping={type=geo_point}, match=location}}]}]"}],"type":"mapper_parsing_exception","reason":"Failed to parse mapping: Root mapping definition has unsupported parameters:  [calls : {dynamic_templates=[{locations={mapping={type=geo_point}, match=location}}]}]","caused_by":{"type":"mapper_parsing_exception","reason":"Root mapping definition has unsupported parameters:  [calls : {dynamic_templates=[{locations={mapping={type=geo_point}, match=location}}]}]"}},"status":400}1001460000@logstash-node-0:/usr/share/logstash$ 


#GeoJSON 데이터 추가 테스트
PUT my-index-000001/_doc/1
{
  "text": "Geopoint as an object using GeoJSON format",
  "location": { 
    "type": "Point",
    "coordinates": [-71.34, 41.12]
  }
}


PUT _template/nyc 
 {
    "order":0,
    "index_patterns":"nyc",
    "mappings":{
      "_default_":{
        "properties":{
          "location":{
            "type":"geo_point"
          }
        }
      }
    }
 }

PUT _template/nyc 
{
  "order":0,
  "index_patterns":"nyc",
  "mappings": {
   "calls": {
      "dynamic_templates": [
        {
          "locations": {
            "match": "location",
            "mapping": { "type": "geo_point" }
          }
        }
      ]
    }
  }
}

curl -XPUT -u elastic:bketc123 http://192.168.16.148:9200/_template/test-log777-n779xw-01-wh001-message -H 'Content-Type: application/json'
-d '{
  "order":0,
  "index_patterns":"test-log777-n779xw-01-wh001-message",
  "mappings": {
   "calls": {
      "dynamic_templates": [
        {
          "locations": {
            "match": "location",
            "mapping": { "type": "geo_point" }
          }
        }
      ]
    }
  }
}'

#필드수가 많은 경우 설정 (필드개수 많으면 성능저하 있음, 비추)
#ref: https://discuss.elastic.co/t/location-dosent-convert-to-geo-point/131199

curl -XPUT -u elastic:bketc123 http://192.168.151.119:9200/log777-n779xw-wh001-message/_settings  -H 'Content-Type: application/json' -d '{"index.mapping.total_fields.limit": 400000}'
curl -XPUT -u elastic:bketc123 http://192.168.151.119:9200/log777-n779xx-wh002-message/_settings  -H 'Content-Type: application/json' -d '{"index.mapping.total_fields.limit": 400000}'
curl -XPUT -u elastic:bketc123 http://192.168.151.119:9200/log777-n779xy-wh003-message/_settings  -H 'Content-Type: application/json' -d '{"index.mapping.total_fields.limit": 400000}'
