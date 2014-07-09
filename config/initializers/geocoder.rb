Geocoder.configure({
  lookup: :bing,
  api_key: ENV["BING_MAPS_PORTAL_KEY"],
  timeout: 30
})