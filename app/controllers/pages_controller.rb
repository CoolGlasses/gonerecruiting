class PagesController < ApplicationController
    def index
        @news_items = get_news()
        render :home  
    end

    protected
    def get_news
        news = NewsItem.all
        news = news.to_a
        return news
    end
end