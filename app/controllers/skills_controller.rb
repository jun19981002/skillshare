class SkillsController < ApplicationController

  def index
    @user = current_user
    @skill = Skill.new 
    @skills= Skill.all
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
    @skill = Skill.new
    @skill_show = Skill.find(params[:id])
    @skills = Skill.all
    @user = @skill_show.user
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])
    @skill.update(skill_params)
    redirect_to skills_path(@skill.id)
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    redirect_to skills_path
  end
  private

  def skill_params
    params.require(:skill).permit(:title, :body)
  end
  
end
