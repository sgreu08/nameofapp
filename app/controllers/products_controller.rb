class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  # this is a comment
  # GET /products
  # GET /products.json
  # added some comments to see if the branch thing works

# code for entering the search field 
  def index
    #conditional to see if the search term is present 
    if params[:q]
      search_term = params[:q]
 # we can’t expect users to enter a name exactly as it is spelled 
 # in the database, for this SQL has a useful matching operator called LIKE
 # and it allows you to include a “wildcard” character (%) to indicate that 
 # the matching term may be part of a longer string. 
 # So we need to put percentage characters around our search_term string. 
 # In order for us to do this, we need to use the string substitution method 
 # that you learned in the Ruby primer, with the # character. 
      @products = Product.where("name LIKE ?", "%#{search_term}%")
    else
      @products = Product.all
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @comments = @product.comments.all.order ("created_at DESC")
    @comments = @product.comments.all.paginate(:page => params[:page], :per_page => 3)
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # Make sure that users need to login before they can see the products page
  before_filter :authenticate_user!

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to "/static_pages/landing" }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to @products, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :image_url, :color, :price, :size)
    end


end
