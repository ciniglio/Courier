class ParcelController < ApplicationController
  def package
    unless params[:parcel].blank?
      uploaded_io = params[:parcel]
      File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end
    end
  end

  def ship
  end

  def recieve
  end

end
