module EventsHelper
  def get_coords(address)
    data = Geocoder.search(address).first
    if data.present?
      data.data["geometry"]["location"]
    else
      {}
    end
  end


end
