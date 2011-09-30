class ListingsController < ApplicationController
  # before_filter :get_all_json

  def get_all_json
    near = params.delete(:s) and near[:q]

    # @listings = near ? Listing.near(near, 5) : Listing.all
    @listings = Listing.all
    @maps_json = @listings.to_gmaps4rails
  end
  
  # GET /listings
  # GET /listings.xml
  def index
    @listings = Listing.all
    @maps_json = @listings.to_gmaps4rails

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @listings }
    end
  end

  # GET /listings/1
  # GET /listings/1.xml
  def show
    @listing = Listing.find(params[:id])
    @maps_json = @listing.to_gmaps4rails

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @listing }
    end
  end

  def search
    render :action => :index
  end

  # GET /listings/new
  # GET /listings/new.xml
  def new
    @listing = Listing.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @listing }
    end
  end

  # GET /listings/1/edit
  def edit
    @listing = Listing.find(params[:id])
  end

  # POST /listings
  # POST /listings.xml
  def create
    @listing = Listing.new(params[:listing])
    @listing.start_time =
      Time.mktime(params[:listing]['start_time(1i)'].to_i, params[:listing]['start_time(2i)'].to_i,
      params[:listing]['start_time(3i)'].to_i, params[:start_time]['hour'].to_i, params[:start_time]['minute'])

    @listing.end_time =
      Time.mktime(params[:listing]['start_time(1i)'].to_i, params[:listing]['start_time(2i)'].to_i,
      params[:listing]['start_time(3i)'].to_i, params[:end_time]['hour'].to_i, params[:end_time]['minute'])
    
    respond_to do |format|
      if @listing.save
        format.html { render :action => "index", :notice => 'done deal!' }
        format.xml  { render :xml => @listing, :status => :created, :location => @listing }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @listing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /listings/1
  # PUT /listings/1.xml
  def update
    @listing = Listing.find(params[:id])

    respond_to do |format|
      if @listing.update_attributes(params[:listing])
        format.html { redirect_to(@listing, :notice => 'Listing was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @listing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.xml
  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to(listings_url) }
      format.xml  { head :ok }
    end
  end
end
