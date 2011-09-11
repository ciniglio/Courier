class ParcelController < ApplicationController
  def package
    unless params[:parcel].blank?
      uploaded_io = params[:parcel]
      parcel = Parcel.new
      parcel.original_filename = uploaded_io.original_filename
      parcel.create_tracker
      parcel.location = 'uploads_' + parcel.tracker
      parcel.save!
      File.open(Rails.root.join('public', 'uploads', parcel.tracker), 'wb') do |file|
        file.write(uploaded_io.read)
      end
    end
  end

  def ship
  end

  def recieve
  end

end
