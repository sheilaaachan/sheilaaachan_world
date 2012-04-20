class ProverbsController < ApplicationController
  
  def index
    @proverbs = Proverb.alphabetical.active.paginate(:page => params[:page]).per_page(10)
  end


  def show
    @proverb = Proverb.find(params[:id])
  end


  def new
    @proverb = Proverb.new
  end


  def edit
    @proverb = Proverb.find(params[:id])
    flash[:notice] = 'Revise proverbs only if there is a typo; altering its meaning will cost you your life.'
  end


  def create
    @proverb = Proverb.new(params[:proverb])
    if @proverb.save
      flash[:notice] = 'A new proverb was successfully created.'
      redirect_to proverb_path(@proverb)
    else
      render :action => "new"
    end
  end


  def update
    @proverb = Proverb.find(params[:id])
    if @proverb.update_attributes(params[:proverb])
      flash[:notice] = 'Proverb was successfully updated ...and for your sake it better be correct.'
      redirect_to proverb_path(@proverb)
    else
      render :action => "edit"
    end
  end


  def destroy
    @proverb = Proverb.find(params[:id])
    flash[:error] = 'petaQ! You cannot destroy a hallowed Klingon proverb. '
    redirect_to proverbs_path
  end
end
