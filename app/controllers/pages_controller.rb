class PagesController < ApplicationController
  def home
  	@posts = Post.all
  	@skills = Skill.all
  end

  def about
  end

  def contact
  end

  def tech_news
    @tweets = SocialTool.twitter_search
  end
end
