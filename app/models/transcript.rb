class Transcript < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader # use uploader 'attachment' for this model
  validates :attachment, file_size: { less_than: 1.megabytes, message: 'File should be less than 1mb' }
  def self.get_info(this)
      l = this.attachment_url.split(/\//)
      l[0] = "public"
      path = Rails.root
      l.each {|seg| path = path.join seg}
      reader = PDF::Reader.new(path)
      text = ""
      reader.pages.each {|page| text += page.text}
      text
  end
end
