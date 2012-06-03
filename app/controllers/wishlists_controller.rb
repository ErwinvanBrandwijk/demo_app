class WishlistsController < ApplicationController
before_filter :authenticate,    :except => [:new]
before_filter :authorized_user, :only => [:edit, :update, :destroy, :show]

  # GET /wishlists
  # GET /wishlists.json
  def index
    @wishlists = current_user.wishlists.all
    @wishlist = Wishlist.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wishlists }
    end
  end

  # GET /wishlists/1
  # GET /wishlists/1.json
  def show
    @wishlist = Wishlist.find(params[:id])
    @wishlistlines = @wishlist.wishlistlines.paginate(:page => params[:page], :per_page => 5)
    @wishlistline = Wishlistline.new
    @wishlistline.wishlist_id = params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wishlist }
    end
  end

  # GET /wishlists/new
  # GET /wishlists/new.json
  def new
    @wishlist = Wishlist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wishlist }
    end
  end

  # GET /wishlists/1/edit
  def edit
    @wishlist = Wishlist.find(params[:id])
  end

  # POST /wishlists
  # POST /wishlists.json
  def create
    @wishlist = current_user.wishlists.build(params[:wishlist])

    respond_to do |format|
      if @wishlist.save
        format.html { redirect_to @wishlist, notice: 'Wishlist was successfully created.' }
        format.json { render json: @wishlist, status: :created, location: @wishlist }
      else
        format.html { redirect_to @wishlist, notice: 'Failed to create wishlist.' }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wishlists/1
  # PUT /wishlists/1.json
  def update
    @wishlist = Wishlist.find(params[:id])

    respond_to do |format|
      if @wishlist.update_attributes(params[:wishlist])
        format.html { redirect_to @wishlist, notice: 'Wishlist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wishlists/1
  # DELETE /wishlists/1.json
  def destroy
    @wishlist = Wishlist.find(params[:id])
    @wishlist.destroy

    respond_to do |format|
      format.html { redirect_to wishlists_url }
      format.json { head :no_content }
    end
  end
  
  private
  def authorized_user
    @wishlist = Wishlist.find(params[:id])
    redirect_to root_path unless current_user?(@wishlist.user)
  end
end
