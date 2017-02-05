class LinksController < ApplicationController
	before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @links = Link.all
  end

  def show
  end

  def new
    @link = Link.new
  end

  def edit
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
    	redirect_to links_path, notice: 'Link was successfully created.'
    else
      render :new
    end
  end

  def update
    if @link.update(link_params)
    	redirect_to @link, notice: 'Link was successfully update.'
    else
      render :edit
    end
  end

  def destroy
    @link.destroy
    redirect_to  links_url, notice: 'Link was successfully destroyed.'
  end

  private

    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:url, :link_type)
    end
end
