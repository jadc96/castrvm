class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @castles = Castle.last(6).reverse
  end
end
