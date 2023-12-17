class ArticlesController < ApplicationController
  before_action :load_article

  def show
    render
  end

  private

    def load_article
      @article = Article.find_by("slug_en": params[:slug])
      render :not_found, status: 404 if @article.nil?
    end
end
