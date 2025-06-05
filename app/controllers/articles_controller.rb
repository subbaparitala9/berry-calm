class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show update destroy]

  def index
    @articles = Article.by_published_date_desc
    render json: @articles
  end

  def show
    render json: @article
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    head :method_not_allowed
  end

  def destroy
    head :method_not_allowed
  end

  private

  def set_article
    @article = Article.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

  def article_params
    params.permit(:title, :content, :author, :category, :published_at)
  end
end
