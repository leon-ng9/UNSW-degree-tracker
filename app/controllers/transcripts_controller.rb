class TranscriptsController < ApplicationController
  include TranscriptsHelper
  def index
    @transcripts = Transcript.all
  end

  def new
    @transcript = Transcript.new
  end

  def create

    @transcript = Transcript.new(transcript_params)
    reader = PDF::Reader.new(transcript_params[:attachment])
    result = reader.text
    if @transcript.save
      redirect_to result_path, notice: "The transcript has been uploaded. #{result}"
    else
      render "new"
    end
  end

  def show
    @transcript = Transcript.find(params[:id])
    @text = Transcript.get_info(@transcript)
  end
  def destroy
    @transcript = Transcript.find(params[:id])
    File.delete(@transcript.attachment_url) if File.exist?(@transcript.attachment_url)
    #fail to remove the directory
    # dir = @transcript.attachment_url.sub(File.basename(@transcript.attachment_url),"")
    # remove_entry_secure(File.basename("/home/gumby/work/ruby.rb"), force = false)
    # dir = "/public"+@transcript.attachment_url.sub(/\/[^\/]*$/,'/')
    # Dir.rmdir(dir)
    @transcript.destroy
    redirect_to transcripts_path, notice:  "The transcript has been deleted."
  end


private
  def transcript_params
    params.require(:transcript).permit(:attachment)
  end
end
