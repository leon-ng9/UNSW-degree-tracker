class Transcript < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader # use uploader 'attachment' for this model
  validates :attachment, file_size: { less_than: 1.megabytes, message: 'File should be less than 1mb' }
end
