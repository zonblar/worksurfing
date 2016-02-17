class PagesController < ApplicationController
  before_filter :disable_nav, only: [:home]
  def home

   @workspaces = Workspace.where.not(latitude: nil)


  end
end
