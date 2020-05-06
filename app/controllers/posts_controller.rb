class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :toggle_status]
  layout "blog"
  access all: [:show, :index], user: {except: [:destroy, :new, :edit, :update, :create, :toggle_status]},
        site_admin: :all


  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.page(params[:page]).per(5)
    @page_title = "My Portfolio | Blog"
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @page_title = @post.title
    @seo_keywords = @post.body
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.topic_id = "1"

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, alert: 'Post was successfully destroyed.' }
    end
  end

  def toggle_status
    if @post.published?
      @post.draft!
    elsif @post.draft?
        @post.published!
    end
    redirect_to posts_url, alert: 'Post status was successfully updated.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
