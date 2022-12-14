class Users::AnalyzeController < ApplicationController
  layout 'no_header'
  before_action :set_project, only: %i[show]

  def show
    @song = @project.songs.find_by(selectstate_1: :true)
    if @song.present?
      @song
    else 
      @song = @project.songs.first
    end
  end

  private

  def set_project
    @project = current_user.projects.find(params[:project_uuid])
  end
end
