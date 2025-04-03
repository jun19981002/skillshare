class UsersController < ApplicationController
  def index
    @user = current_user
    @skill = Skill.new
    @users = User.all
  end

  def create
    @skill = Skill.new(skill_params)
    @skill.user_id = current_user.id
    if @skill.save
      redirect_to skills_path
    else
      @user = current_user
      @skills = Skill.all
      render :index
    end
  end

  def show
    @user = User.find(params[:id])
    @skill = @user.skill
  end

  def edit
  end
end
