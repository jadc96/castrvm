class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home intro]

  def home
  end

  def intro
    @castles = Castle.last(3).reverse
  end
end
