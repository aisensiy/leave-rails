class LeaveRequestsController < ApplicationController
  before_action :set_leave_request, only: [:show, :edit, :update, :destroy]

  # GET /leave_requests
  # GET /leave_requests.json
  def index
    @leave_requests = LeaveRequest.all
  end

  # GET /leave_requests/1
  # GET /leave_requests/1.json
  def show
  end

  # GET /leave_requests/new
  def new
    @leave_request = LeaveRequest.new
  end

  # GET /leave_requests/1/edit
  def edit
  end

  # POST /leave_requests
  # POST /leave_requests.json
  def create
    @member = Member.find(params[:member_id])
    if @member != current_user
      render status: 403, nothing: true and return
    end
    @leave_request = @member.leave_requests.build(leave_request_params)

    if @leave_request.save
      render :show, status: :created, location: member_leave_request_url(@member, @leave_request)
    else
      render status: 400, nothing: true
    end
  end

  # PATCH/PUT /leave_requests/1
  # PATCH/PUT /leave_requests/1.json
  def update
    respond_to do |format|
      if @leave_request.update(leave_request_params)
        format.html { redirect_to @leave_request, notice: 'Leave request was successfully updated.' }
        format.json { render :show, status: :ok, location: @leave_request }
      else
        format.html { render :edit }
        format.json { render json: @leave_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leave_requests/1
  # DELETE /leave_requests/1.json
  def destroy
    @leave_request.destroy
    respond_to do |format|
      format.html { redirect_to leave_requests_url, notice: 'Leave request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_leave_request
    @leave_request = LeaveRequest.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def leave_request_params
    params.require(:leave_request).permit(:from, :to, :title)
  end
end
