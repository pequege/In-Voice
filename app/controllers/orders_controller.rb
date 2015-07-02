class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :client_presence

  # GET /orders
  # GET /orders.json
  def index
    @orders = current_user.orders
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = current_user.orders.find_by(id: params[:id])
    I18n.locale = @order.client.language
    respond_to do |format|
      if @order
        format.html
        format.pdf do
          render pdf: "order",
          page_size: 'A4',
          template: 'orders/show.pdf.html.erb',
          show_as_html:params[:debug].present? ,
          layout: "pdf_layout.html"
        end
      else
        format.html { redirect_to root_path, notice: 'invalid url'}
      end
    end
  end

  # GET /orders/new
  def new
    @order = current_user.orders.new
    @order.details.build
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = current_user.orders.new(order_params)
    respond_to do |format|
      if @order.save
        generate_and_save_pdf(@order)
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = current_user.orders.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:date, :extra, :other, :created_at, :client_id, :charge, :order_number, :currensy_type, details_attributes: [ :id, :project, :task, :description, :amount, :rate, :hour, :_destroy ])
    end

    def client_presence
      @client = current_user.clients
        unless @client.any?
          redirect_to root_path
        end
    end

    def generate_and_save_pdf(order)
      @order = order
      pdf_string = WickedPdf.new.pdf_from_string(
        ActionController::Base.new().render_to_string(
          template: 'orders/show.pdf.html.erb',
          locals: {
            :@order => order
          },
          formats: [:pdf],
          layout: "pdf_layout.html"
        ), pdf: "test", template: 'orders/show.pdf.html.erb', encoding: "UTF-8", layout: "pdf_layout.html",page_size: 'A4')
      # pdf_string = WickedPdf.new.pdf_from_string(html, page_size: 'A4', encoding: 'UTF-8', template: 'orders/show.pdf.html.erb', show_as_html:params[:debug].present?, layout: "pdf_layout.html")
      tempfile = Tempfile.new(["#{@order.order_number}", ".pdf"])
      tempfile.binmode
      tempfile.write pdf_string
      tempfile.close
      @order.invoice_file = File.open tempfile.path
      @order.invoice_file_file_name = "#{@order.order_number}_#{@order.created_at.strftime("%m-%d-%y")}_#{@order.client.name}.pdf"
      @order.save
    end
end
