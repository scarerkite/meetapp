module EventsHelper
  # Bing
  # def get_coords(address)
  #   data = Geocoder.search(address).first
  #   if data.present?

  #     data.data["point"]["coordinates"]
  #   else
  #     [0,0]
  #   end
  # end

  # Google

  # def get_coords(address)
  #   data = Geocoder.search(address).first.data
  #   return data["geometry"]["location"]
  # end


  def get_address(latlng)
    data = Geocoder.search(latlng).first.data
    return data["formatted_address"]

  end
end
