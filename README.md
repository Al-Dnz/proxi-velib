# README

# http://proxivelib.herokuapp.com/

Proxivelib is an application that display the 5 nearest velib stations around geolocalised point.
By default , the central point is THP office in Paris.
But you can geolocalize velib stations everywhere in Paris.
Proxivelib use Geocoder , be accurate in your research if you want find the right place you expect.
The app is configured to find stations only in Paris, and soon for the other French metropolis.

Datas are updated every 30 seconds with scheduled background-jobs API requests.


Velib datas are given by http://api.citybik.es/v2/

* Ruby 2.6.2
* Rails 5.2.3

* To run tests , launch in your term
  `$ rspec`

* To run scheduled background-jobs launch
  `$ sidekiq`
