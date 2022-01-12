class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[bulk_destroy]
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    @items = Item.all
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
    @item.build_inventory
  end

  # GET /items/1/edit
  def edit

  end

  # POST /items or /items.json
  def create
    @errors = []
    @item = Item.new(item_params)

   format_fields

    if @item.save
      redirect_to edit_item_path(@item), notice: "Product was successfully created."
    else
      @errors = @item.errors.full_messages
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    @errors = []

    @item.assign_attributes(item_params)

    format_fields

    if @item.save
      redirect_to edit_item_path(@item), notice: "Product was successfully updated."
    else
      @errors = @item.errors.full_messages
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @errors = []
    if @item.destroy
      redirect_to items_url, notice: "Item was successfully deleted."
    else
      @errors = @item.errors.full_messages
    end
  end

  # POST /items/bulk_delete
  def bulk_destroy
    
    if(params[:item_ids])
      respond_to do |format|
        if Item.where(id: params[:item_ids]).destroy_all
          format.json { render :index, status: :ok}
        else
          format.json { render json: @type.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    def format_fields
      @item.price = (item_params[:price].to_f * 100).to_i if item_params[:price]
      @item.compare_at_price = (item_params[:compare_at_price].to_f * 100).to_i if item_params[:compare_at_price]
      @item.unit_cost = (item_params[:unit_cost].to_f * 100).to_i if item_params[:unit_cost]

      @item.inventory.track_quantity = item_params[:inventory_attributes][:track_quantity] == "1" ? true : false if item_params[:inventory_attributes]
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:title, 
        :price, 
        :sku, 
        :description, 
        :tags, 
        :status,
        :compare_at_price,
        :unit_cost,
        inventory_attributes: [
          :id,
          :quantity,
          :sku,
          :barcode,
          :track_quantity
        ]
      )
    end
end
