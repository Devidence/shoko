class SkillsController < ApplicationController
  def index
    @new_skill = Skill.new
    @skills = Skill.all
  end
  
  def create
    @skill = Skill.new(skill_params)
    
    # Temporary Auth Logic for Mentor
    redirect_to :back and return unless current_mentor
    @skill.mentor = current_mentor
    
    @skill.save
    
    redirect_to :back
  end
  
  private
  
  def skill_params
    params.require(:skill).permit(:name, :description)
  end
end
