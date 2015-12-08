class CheckinsController < ApplicationController
  before_action :set_reporter

  def new
  end

  # POST /checkins/:uuid
  def create
    @checkin = Checkin.create(reporter: @reporter)

    respond_to do |format|
      if @checkin.save
        @reporter.task = nil # reset our notification system
        format.html { render :new, notice: 'Checked in at <time>' }
        format.json { render :new, status: :created, location: root_url + 'checkins/' + params[:uuid] }
      else
        format.html { render :new, notice: 'Checkin failed.' }
        format.json { render json: checkin.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reporter
    @reporter = Reporter.find_by(uuid: params[:uuid])
  end
end
