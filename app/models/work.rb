class Work < ActiveRecord::Base
  attr_accessible :work_dated, :notes, :p_image, :title, :photo
  has_attached_file :photo, styles: {thumb: "x100"}
  belongs_to :exhibition
  
	def self.search(search, page)
	  	paginate :per_page => 5, :page => page,
		 	     :conditions => ['title like ?', "%#{search}%"], 
		 	     :order => 'work_dated'
	end
	
	def self.thumb(id,photo)
		require 'RMagick'
		image = Magick::Image.read(photo).first

		thumb = image.change_geometry!('100x150') { |cols, rows, img|
 			img.resize!(cols, rows)
 			}
		saveas = "/var/www/musa/app/assets/images/thumb_#{id.to_s}.jpg"
		thumb.write(saveas)
	end

end
