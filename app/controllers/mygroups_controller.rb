class MygroupsController < ApplicationController
  before_action :set_mygroup, only: [:show, :edit, :update, :destroy]

  # GET /mygroups
  # GET /mygroups.json
  def index
    @mygroup=Mygroup.new
    #  @mygroup = Mygroup.all
     @mygroups = Mygroup.all
    # @mygroup = current_user.mygroups.build
  end
  def new
    @mygroup=Mygroup.new
  end

  def create
    # @mygroup = current_user.mygroups.build(mygroup_params)
    # @mygroup.user_id = current_user.id
    #
     @mygroup = Mygroup.new(mygroup_params)

    respond_to do |format|
      if @mygroup.save
        format.html { redirect_to @mygroup, notice: 'Mygroup was successfully created.' }
        format.json { render :show, status: :created, location: @mygroup }
      else
        format.html { render :new }
        format.json { render json: @mygroup.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @mygroup.update(mygroup_params)
        format.html { redirect_to @mygroup, notice: 'Mygroup was successfully updated.' }
        format.json { render :show, status: :ok, location: @mygroup }
      else
        format.html { render :edit }
        format.json { render json: @mygroup.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @mygroup.destroy
    respond_to do |format|
      format.html { redirect_to mygroups_url, notice: 'Mygroup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mygroup
      @mygroup = Mygroup.find(params[:id])
        # @group = Mygroup.where(id: params[:id]).take
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mygroup_params
      params.require(:mygroup).permit(:name , :user_id)
    end
end
