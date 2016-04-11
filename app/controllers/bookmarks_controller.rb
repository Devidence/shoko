class BookmarksController < ApplicationController
  before_action :authenticate!

  def index
    @new_bookmark = Bookmark.new
    @bookmarks = Bookmark.all
  end

  def new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    # Temporary Auth Logic for Mentor
    redirect_to :back and return unless current_mentor
    @bookmark.mentor = current_mentor

    @bookmark.save

    redirect_to :back
  end

  def show
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url, :skill_id)
  end
end
