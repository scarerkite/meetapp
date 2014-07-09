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

  def get_coords(address)
    data = Geocoder.search(address).first.data
    return data["geometry"]["location"]
  end


  def get_address
    reverse_geocoded_by :latitude, :longitude do |obj, results|
      if geo = results.first
        obj.address  = geo.address
        obj.postcode = geo.postal_code
      end
    end
  end
end
