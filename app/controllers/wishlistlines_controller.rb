class WishlistlinesController < ApplicationController
before_filter :authenticate,    :except => [:new]
before_filter :authorized_user, :only => [:edit, :update, :destroy, :show]


  # GET /wishlistlines/1
  # GET /wishlistlines/1.json
  def show
    @wishlistline = Wishlistline.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wishlistline }
    end
  end

  # GET /wishlistlines/1/edit
  def edit
    @wishlistline = Wishlistline.find(params[:id])
  end

  # POST /wishlistlines
  # POST /wishlistlines.json
  def create
    @wishlistline = Wishlistline.new(params[:wishlistline])

    respond_to do |format|
      if @wishlistline.save
        format.html { redirect_to @wishlistline.wishlist, notice: 'Wishlistline was successfully created.' }
        format.json { render json: @wishlistline, status: :created, location: @wishlistline }
      else
        format.html { redirect_to @wishlistline.wishlist, notice: 'Wishlistline was not created.' }
        format.json { render json: @wishlistline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wishlistlines/1
  # PUT /wishlistlines/1.json
  def update
    @wishlistline = Wishlistline.find(params[:id])

    respond_to do |format|
      if @wishlistline.update_attributes(params[:wishlistline])
        format.html { redirect_to @wishlistline, notice: 'Wishlistline was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wishlistline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wishlistlines/1
  # DELETE /wishlistlines/1.json
  def destroy
    @wishlistline = Wishlistline.find(params[:id])
    @wishlistline.destroy

    respond_to do |format|
      format.html { redirect_to @wishlistline.wishlist }
      format.json { head :no_content }
    end
  end
  
  private
  def authorized_user
    @wishlistline = Wishlistline.find(params[:id])
    redirect_to root_path unless current_user?(@wishlistline.wishlist.user)
  end
end
