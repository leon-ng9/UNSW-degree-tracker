class Transcript < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader # use uploader 'attachment' for this model
  validates :attachment, file_size: { less_than: 1.megabytes, message: 'File should be less than 1mb' }
  def self.get_info(this)
    file_name = "#{Rails.root}#{this.attachment_url}"
    File.open(file_name, "rb") do |io|
      reader = PDF::Reader.new(file_name)
      result = reader.text
    end
    result
  end
end
