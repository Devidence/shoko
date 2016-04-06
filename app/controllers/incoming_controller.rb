class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @mentor = Mentor.find_by_email(params[:sender])
    @skill = Skill.find_by_name(params[:subject])

    if @skill == nil
      puts "Adding Skill."
      @skill          = Skill.new
      @skill.name     = params[:subject]
      @skill.mentor   = @mentor
      @skill.save!
    end

    @bookmark         = Bookmark.new
    @bookmark.url     = params["body-plain"]
    @bookmark.skill   = @skill
    @bookmark.mentor  = @mentor

    if @bookmark.save!
      puts "Saving Bookmark."
      # Send confirmation email.
      head 200
    else
      puts "Error Occurred."
      #Send error email.
      head 500
    end
  end

end
