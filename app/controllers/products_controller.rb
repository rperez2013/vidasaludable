class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    
    if(params[:categoria]!=nil)
     # @products = Product.find(:all, :conditions=>{:categoria=>[params[:categoria]]})
      @products =Product.search2(params[:search],params[:categoria])
    elsif (params[:user_id]!=nil)
      #filtro por los productos que posee un proveedor
      @products =Product.misproductos(params[:user_id])
    else

      @products =Product.search(params[:search])
    end
  #  @products = Product.order(:id).page(params[:page]).per(20)
    if @products.class == Array
      @products = Kaminari.paginate_array(@products).page(params[:page]).per(4)
    else
      @products = @products.page(params[:page]).per(4) # if @posts is AR::Relation object
    end 
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end
 
  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    #puts YAML::dump(@product.user_id)
    if (@product.user_id!=nil)     
      @user= Product.findUser(@product.user_id)
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end    
  end
  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
  # DELETE /products/1
  # DELETE /products/1.json
 
end
