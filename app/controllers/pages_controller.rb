class PagesController < ApplicationController

#  layout 'default'

  before_action :confirm_logged_in

  def index
    #@pages = Page.where(:subject_id => @subject.id).sorted
    @pages = Page.sorted
  #  @page = Page.find(params[:id])


  end

  def show
    @page = Page.find(params[:id])
  #  respond_to do |format|
      #  format.js
      #  format.json { render json: @page }
  #  end
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    @page.user_id = session[:user_id] #for avatars to work
    if @page.save
    #  flash[:notice] = "Successfully submitted..."
      redirect_to(:controller => 'pages', :action => 'index')
    else
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(page_params)
      flash[:notice] = "Successfully updated..."
      redirect_to(:action => 'show', :id => @page.id)
    else
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    page = Page.find(params[:id]).destroy
    flash[:notice] = "Successfully destroyed..."
    redirect_to(:action => 'index')
  end

  private

  def page_params
    params.require(:page).permit(:title, :author, :permalink, :content, :submission_image)
  end

end
