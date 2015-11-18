class Document < ActiveRecord::Base
	belongs_to :vehicles
	mount_uploader :file, DocumentsUploader

  def is_image?
  	extension = self.file.file.extension.downcase rescue nil
  	
		%w{jpg png jpg gif bmp }.include?(extension)
  end
end
