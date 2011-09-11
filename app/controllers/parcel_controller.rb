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
    parcel = Parcel.where(:tracker => params[:tracker]).first
    unless parcel.blank?
      send_file(Rails.root.join('public', 'uploads', parcel.tracker), :filename => parcel.original_filename)
      @message = parcel.original_filename
    else
      @message = "none"
    end
  end

  def recieve
  end

end
