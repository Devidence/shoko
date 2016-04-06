class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @mentor = Mentor.find_by_email(params[:sender])
    if @mentor.present?
      @skill = Skill.find_by_name(params[:subject])
      if @skill == nil
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
        # TODO
        # Send confirmation email.
        head 200
      else
        puts "Error Occurred."
        # TODO
        #Send error email.
        head 500
      end
    else
      # Deny access to the Bookmark address.
      head 403
    end
  end
end
