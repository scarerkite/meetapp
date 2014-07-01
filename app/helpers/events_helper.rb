module EventsHelper
  def get_coords(address)
    data = Geocoder.search(address).first.data
    return data["geometry"]["location"]
  end
end
