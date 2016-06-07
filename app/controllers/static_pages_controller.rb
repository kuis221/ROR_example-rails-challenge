class StaticPagesController < ApplicationController
  def home
    @customers = Customer.all
  end
end
