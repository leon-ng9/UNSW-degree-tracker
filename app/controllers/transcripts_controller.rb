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
    @transcript.destroy
    redirect_to transcripts_path, notice:  "The transcript has been deleted."
  end

private
  def transcript_params
    params.require(:transcript).permit(:attachment)
  end
end