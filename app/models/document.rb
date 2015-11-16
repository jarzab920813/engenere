class Document < ActiveRecord::Base
	belongs_to :vehicles
	mount_uploader :file, DocumentsUploader
end
