class HomesController < ApplicationController
  def about
  end

  def top
    @cafes = Cafe.all
  end

end
