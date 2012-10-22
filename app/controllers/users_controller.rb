class UsersController < ApplicationController

  respond_to :html

  def links
    if current_user.id == params[:id].to_i
      @links = current_user.links.recent
      respond_with(@links)
    end
  end

end
