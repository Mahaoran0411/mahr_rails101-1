class GroupMembersController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    if !current_user.is_member_of?(@group)
      current_user.join!(@group)
      flash[:notice] = "加入本讨论组成功!"
    else
      flash[:warning] = "你已经是本讨论组成员!"
    end
    redirect_to group_path(@group)
  end

  def destroy
    @group = Group.find(params[:group_id])
    if current_user.is_member_of?(@group)
      current_user.quit!(@group)
      flash[:alert] = "你已退出本讨论组!"
    else
      flash[:warning] = "你不是本讨论组成员，怎么退出？XD"
    end
    redirect_to group_path(@group)
  end
end
