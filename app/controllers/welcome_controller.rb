class WelcomeController < ApplicationController

  def index
    flash[:notice] = "早安!你好!"
    flash[:alert] = "晚安!"
    flash[:warning] = "警告!"
  end
end
