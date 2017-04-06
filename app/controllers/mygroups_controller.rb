class MygroupsController < ApplicationController
  before_action :set_mygroup, only: [:show, :edit, :update, :destroy]

  # GET /mygroups
  # GET /mygroups.json
  def index
    @mygroup=Mygroup.new
     @mygroups = Mygroup.all

  end
  def show
    @mygroup=Mygroup.new
     @mygroups = Mygroup.all
    @usergroup=GroupMember.all
    @users=User.all
    @selectedgroup=Mygroup.find(params[:id])

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
     @mygroup = Mygroup.find(params[:id])
    @mygroup.destroy
    respond_to do |format|
      format.html { redirect_to mygroups_url, notice: 'Mygroup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_users

    @usersIds= GroupMember.where(group_id: params[:id]).map { |e| e.user_id }
    respond_with User.where(id: @usersIds)

  end

  # GET /groups/new
  def new_member

    @email = params[:user][:email]
    @group_id=params[:group_id]
    @mygroup = Mygroup.find(params[:id])
    if @email !=""
     @user = User.find_by_email(@email)
      if @user != nil
       if current_user != @user.id
            @userfound = GroupMember.where(:user_id => @user.id , :mygroup_id => @mygroup.id)
            if @userfound.exists? == false
                @GroupMember = GroupMember.new(
                mygroup_id: @mygroup.id,
                user_id: @user.id )
              if @GroupMember.save
              end
            end
       end
     end

 end
 redirect_to mygroup_url

end

  # GET /groups/1/edit
  def delete_member
    @GroupMember = GroupMember.find(params[:id])
    if @GroupMember.destroy
      flash[:notice] = "Group member was successfully destroyed"
      redirect_to mygroups_url
    else
      flash[:notice] = "Unable to remove member."
      redirect_to mygroups_url
    end
    # respond_to do |format|
    #   format.html { redirect_to mygroup_url, notice: 'Group member was successfully destroyed.' }
    #   format.json { head :no_content }
    # end

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mygroup
      #@mygroup = Mygroup.find(params[:id])
        @group = Mygroup.where(id: params[:id]).take
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mygroup_params
      params.require(:mygroup).permit(:name , :user_id)
    end
end
