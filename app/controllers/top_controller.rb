class TopController < ApplicationController
  def index
    @problem = Problem.new
    @feed_contents = FeedContent.includes(:content).page(params[:page]).per(5)
    @feed_contents_resource = @feed_contents.map(&:content)
  end
end