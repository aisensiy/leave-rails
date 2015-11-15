class LeaveConflictsController < ApplicationController
  # before_action :set_leave_conflict, only: [:show, :edit, :update, :destroy]
  before_filter :set_member, only: [:show, :index]

  # GET /leave_conflicts
  # GET /leave_conflicts.json
  def index
    @leave_conflicts = @member.leave_conflicts.all
  end

  # GET /leave_conflicts/1
  # GET /leave_conflicts/1.json
  def show
    @leave_conflict = @member.leave_conflicts.find(params[:id])
    if @leave_conflict.nil?
      render status: 404, nothing: true and return
    end
  end

  # GET /leave_conflicts/new
  def new
    @leave_conflict = LeaveRequest.new
  end

  # POST /leave_conflicts
  # POST /leave_conflicts.json
  def create
    unless current_user.system?
      render status: 403, nothing: true and return
    end

    @member = Member.find(params[:member_id])
    @leave_conflict = @member.leave_conflicts.build(leave_conflict_params)

    if @leave_conflict.save
      render :show, status: :created, location: member_leave_conflict_url(@member, @leave_conflict)
    else
      render status: 400, nothing: true
    end
  end

  private

  def set_member
    @member = Member.find(params[:member_id])
    if @member != current_user && @member.assign != current_user
      render status: 403, nothing: true and return
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def leave_conflict_params
    params.require(:leave_conflict).permit(:leave_request_id, :leave_conflict_id)
  end
end
