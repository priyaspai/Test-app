class UsersController < ApplicationController

  def links
    if current_user.id == params[:id].to_i
      @links = current_user.links.recent
    end
  end

end
