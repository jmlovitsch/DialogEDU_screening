class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /comments
  def index
    if params[:article_id]
        @comments = Comment.comments_by_article(params[:article_id])
    else
        @comments = Comment.all
    end
    @comments = @comments.page(page).per(per_page)
    set_pagination_headers
    render json: @comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content, :article_id)
    end

    def page
        @page ||= params[:page]
    end

    def per_page
        @per_page ||= params[:per_page]
    end

    #can be used by the font end to enable links to navigate between pages
    def set_pagination_headers
        response.header['X-Total-Articles'] = @comments.count
        links = []
        links << page_link(1, 'first') unless @comments.first_page?
        links << page_link(@comments.prev_page, 'prev') if @comments.prev_page
        links << page_link(@comments.next_page, 'next') if @comments.next_page
        links << page_link(@comments.total_pages, 'last') unless @comments.last_page?
        response.header['Link'] = links.join(",") if links.present?
    end


    def page_link(page, rel)
        "<#{articles_url(request.query_parameters.merge(page: page))}>; rel='#{rel}'"
    end

end
