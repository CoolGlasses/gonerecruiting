class NewsItems < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        @news_item = NewsItem.new(news_params)

        @news_item.save!
        redirect_back root_url
    end

    protected

    def news_params
        self.params.require(:news_item).permit(:title, :author, :textarea)
    end
end