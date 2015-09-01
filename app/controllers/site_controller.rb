class SiteController < ApplicationController

  before_filter :set_title

  def index
  end

  def about
  end

  def privacy
  end

  def terms
  end

  private
    def set_title
      @title = "Co-op App"
    end
end
