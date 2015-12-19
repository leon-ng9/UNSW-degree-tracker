class TranscriptsController < ApplicationController
  def index
    @transcripts = Transcript.all
  end

  def new
    @transcript = Transcript.new
  end

  def create
    @transcript = Transcript.new(transcript_params)

    if @transcript.save
      redirect_to result_path, notice: "The transcript has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @transcript = Transcript.find(params[:id])
    File.delete(@transcript.attachment_url) if File.exist?(@transcript.attachment_url)
    FileUtils.rm_rf(@transcript.attachment_url.gsub(/\/[^\/]*/,''))
    @transcript.destroy
    redirect_to transcripts_path, notice:  "The transcript has been deleted."
  end

private
  def transcript_params
    params.require(:transcript).permit(:attachment)
  end
end
