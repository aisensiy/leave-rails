class LeaveConflictsController < ApplicationController
  before_action :set_leave_conflict, only: [:show, :edit, :update, :destroy]

  # GET /leave_conflicts
  # GET /leave_conflicts.json
  def index
    @leave_conflicts = LeaveConflict.all
  end

  # GET /leave_conflicts/1
  # GET /leave_conflicts/1.json
  def show
  end

  # GET /leave_conflicts/new
  def new
    @leave_conflict = LeaveConflict.new
  end

  # GET /leave_conflicts/1/edit
  def edit
  end

  # POST /leave_conflicts
  # POST /leave_conflicts.json
  def create
    @leave_conflict = LeaveConflict.new(leave_conflict_params)

    respond_to do |format|
      if @leave_conflict.save
        format.html { redirect_to @leave_conflict, notice: 'Leave conflict was successfully created.' }
        format.json { render :show, status: :created, location: @leave_conflict }
      else
        format.html { render :new }
        format.json { render json: @leave_conflict.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leave_conflicts/1
  # PATCH/PUT /leave_conflicts/1.json
  def update
    respond_to do |format|
      if @leave_conflict.update(leave_conflict_params)
        format.html { redirect_to @leave_conflict, notice: 'Leave conflict was successfully updated.' }
        format.json { render :show, status: :ok, location: @leave_conflict }
      else
        format.html { render :edit }
        format.json { render json: @leave_conflict.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leave_conflicts/1
  # DELETE /leave_conflicts/1.json
  def destroy
    @leave_conflict.destroy
    respond_to do |format|
      format.html { redirect_to leave_conflicts_url, notice: 'Leave conflict was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leave_conflict
      @leave_conflict = LeaveConflict.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leave_conflict_params
      params[:leave_conflict]
    end
end
