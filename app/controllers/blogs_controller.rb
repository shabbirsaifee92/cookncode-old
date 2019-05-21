class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :destroy, :toggle_status]
  layout "blog"
  access all: [:show, :index], user: { except: [:destroy, :new, :create, :update, :edit, :toggle_status] }, site_admin: :all

  def index
    if logged_in? :site_admin
      @blogs = Blog.page(params[:page]).per 5
    else
      @blogs = Blog.published.page(params[:page]).per 5
    end
    @page_title = 'My portfolio blog'

  end

  def show
    @blog = Blog.includes(:comments).friendly.find(params[:id])
    if logged_in? :site_admin || @blog.published?
      @page_title = @blog.title
      @comment = Comment.new
    else
      render plain: 'The page you are looking for does not exist'
    end
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_status
    respond_to do |format|
      if @blog.draft?
        @blog.published!
        format.html { redirect_to blogs_url, notice: 'Published'}
      else
        @blog.draft!
        format.html { redirect_to blogs_url, notice: 'Unpublished'}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :body)
    end
end
