class ReportersController < ApplicationController
  before_action :set_environment, only: [:show, :edit, :update, :destroy]

  # GET /reporters
  # GET /reporters.json
  def index
    @user = current_user
    if not @user.nil?
      @reporters = Reporter.where(user_id: @user.id)
    end
  end

  # GET /reporters/1
  # GET /reporters/1.json
  def show
  end

  # GET /reporters/new
  def new
    @user = User.find(params[:user_id])
    @reporter = Reporter.new
  end

  # GET /reporters/1/edit
  def edit
  end

  # POST /reporters
  # POST /reporters.json
  def create
    @reporter = Reporter.new(reporter_params)

    Mailer.invite(@reporter).deliver_now
    Invite.create(reporter: @reporter)

    respond_to do |format|
      if @reporter.save
        format.html { redirect_to user_reporter_path(:id => @reporter.id, :user_id => params[:user_id]), notice: 'Successfully invited ' + @reporter.name }
        format.json { render :show, status: :created, location: @reporter }
      else
        format.html { render :new }
        format.json { render json: @reporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reporters/1
  # PATCH/PUT /reporters/1.json
  def update
    respond_to do |format|
      if @reporter.update(reporter_params)
        format.html { redirect_to user_reporter_path(:id => @reporter.id, :user_id => @user.id), notice: 'Successfully updated ' + @reporter.name }
        format.json { render :show, status: :ok, location: @reporter }
      else
        format.html { render :edit }
        format.json { render json: @reporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reporters/1
  # DELETE /reporters/1.json
  def destroy
    @reporter.destroy
    respond_to do |format|
      format.html { redirect_to user_reporters_url, notice: 'Successfully removed ' + @reporter.name }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_environment
    @user = User.find(params[:user_id])
    @reporter = Reporter.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def reporter_params
    params.require(:reporter).permit(:email, :name, :interval, :interval_units, :user_id)
  end
end
