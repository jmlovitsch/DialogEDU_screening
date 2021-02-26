class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]
  # GET /articles
  def index
    
    if params[:search]
        @articles = Article.search_articles(params[:search])
    else
        @articles = Article.all
        @articles = @articles.page(page).per(per_page)
        set_pagination_headers
    end

    render json: @articles

  end

  # GET /articles/1
  def show
    render json: @article
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article, status: :created, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :body)
    end

    def page
        @page ||= params[:page]
    end

    def per_page
        @per_page ||= params[:per_page]
    end

    #can be used by the font end to enable links to navigate between pages
    def set_pagination_headers
        response.header['X-Total-Articles'] = @articles.count
        links = []
        links << page_link(1, 'first') unless @articles.first_page?
        links << page_link(@articles.prev_page, 'prev') if @articles.prev_page
        links << page_link(@articles.next_page, 'next') if @articles.next_page
        links << page_link(@articles.total_pages, 'last') unless @articles.last_page?
        response.header['Nav-Page-Links'] = links.join(",") if links.present?
    end


    def page_link(page, rel)
        "<#{articles_url(request.query_parameters.merge(page: page))}>; rel='#{rel}'"
    end





end
