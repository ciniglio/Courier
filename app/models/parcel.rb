class Parcel < ActiveRecord::Base
  validates :tracker, :presence => true
  validates :original_filename, :presence => true
  validates :location, :presence => true

  validates_uniqueness_of :tracker
  def create_tracker
    self.tracker = Digest::SHA256.hexdigest(self.original_filename + DateTime.now.to_f.to_s)
  end
end
