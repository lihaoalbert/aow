class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

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

  def export
    @products = Product.all
    respond_to do |format|
      format.xls {
        send_data(xls_content_for(@products),
                  :type => "text/excel;charset=utf-8; header=present",
                  :filename => "Report_Products_#{Time.now.strftime("%Y%m%d%H%M")}.xls")
      }
    end
  end

  def import
    excel_file = params[:excel_file]
    file = ProductUploader.new
    file.store!(excel_file)
    book = Spreadsheet.open "#{file.store_path}"
    sheet1 = book.worksheet 0
    @products = []
    @errors = Hash.new
    @counter = 0

    sheet1.each 1 do |row|
      @counter+=1
      p = Product.new
      Product.get_field_array.each_with_index do |field, index|
        p "#{field[0]}=#{row[index]}"
        p.send("#{field[0]}=", row[index])
      end

      if p.valid?
        p.save!
        @products << p
      else
        @errors["#{@counter+1}"] = p.errors
      end
    end
    file.remove!
  end

  def import_template
    respond_to do |format|
      format.xls {
        send_data(xls_content_for(nil),
                  :type => "text/excel;charset=utf-8; header=present",
                  :filename => "Template_Products_#{Time.now.strftime("%Y%m%d%H%M")}.xls")
      }
    end
  end

  private
  def xls_content_for(objs)
    xls_report = StringIO.new
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet :name => "Products"

    blue = Spreadsheet::Format.new :color => :blue, :weight => :bold, :size => 10
    sheet1.row(0).default_format = blue

    sheet1.row(0).concat Product.get_field_array.collect{|arr| arr[1] }
    count_row = 1
    if objs
      objs.each do |obj|
        columns = Product.get_field_array.collect{|arr| arr[0] }
        columns.each_with_index do |column_name, index|
          sheet1[count_row, index] = obj.send(column_name)
        end
        count_row += 1
      end
    end

    book.write xls_report
    xls_report.string
  end
end
