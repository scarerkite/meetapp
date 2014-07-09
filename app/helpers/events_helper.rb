module EventsHelper
  def get_coords(address)
    data = Geocoder.search(address).first
    if data.present?

      data.data["point"]["coordinates"]
    else
      [0,0]
    end
  end

  def get_address
    reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.address  = geo.city
      obj.postcode = geo.postal_code
    end
  end

  end


end
