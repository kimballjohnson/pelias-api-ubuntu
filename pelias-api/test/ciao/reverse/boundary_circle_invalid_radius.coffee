
#> bounding circle
path: '/v1/reverse?point.lat=40.744243&point.lon=-73.990342&boundary.circle.radius=foo'

#? 200 ok
response.statusCode.should.be.equal 400
response.should.have.header 'charset', 'utf8'
response.should.have.header 'content-type', 'application/json; charset=utf-8'

#? valid geocoding block
should.exist json.geocoding
should.exist json.geocoding.version
should.exist json.geocoding.attribution
should.exist json.geocoding.query
should.exist json.geocoding.engine
should.exist json.geocoding.engine.name
should.exist json.geocoding.engine.author
should.exist json.geocoding.engine.version
should.exist json.geocoding.timestamp

#? valid geojson
json.type.should.be.equal 'FeatureCollection'
json.features.should.be.instanceof Array

#? expected errors
should.exist json.geocoding.errors
json.geocoding.errors.should.eql [ 'missing param \'boundary.circle.radius\'' ]

#? expected warnings
should.exist json.geocoding.warnings
json.geocoding.warnings.should.eql [ 'boundary.circle is currently unsupported' ]

#? inputs
# json.geocoding.query['size'].should.eql 10
# json.geocoding.query['point.lat'].should.eql 40.744243
# json.geocoding.query['point.lon'].should.eql -73.990342
# json.geocoding.query['boundary.circle.lat'].should.eql 40.744243
# json.geocoding.query['boundary.circle.lon'].should.eql -73.990342
# should.not.exist json.geocoding.query['boundary.circle.radius']
