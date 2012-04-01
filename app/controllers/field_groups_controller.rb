class FieldGroupsController < ApplicationController
  # GET /field_groups
  # GET /field_groups.json
  def index
    @field_groups = FieldGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @field_groups }
    end
  end

  # GET /field_groups/1
  # GET /field_groups/1.json
  def show
    @field_group = FieldGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @field_group }
    end
  end

  # GET /field_groups/new
  # GET /field_groups/new.json
  def new
    @field_group = FieldGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @field_group }
    end
  end

  # GET /field_groups/1/edit
  def edit
    @field_group = FieldGroup.find(params[:id])
  end

  # POST /field_groups
  # POST /field_groups.json
  def create
    @field_group = FieldGroup.new(params[:field_group])

    respond_to do |format|
      if @field_group.save
        format.html { redirect_to @field_group, notice: 'Field group was successfully created.' }
        format.json { render json: @field_group, status: :created, location: @field_group }
      else
        format.html { render action: "new" }
        format.json { render json: @field_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /field_groups/1
  # PUT /field_groups/1.json
  def update
    @field_group = FieldGroup.find(params[:id])

    respond_to do |format|
      if @field_group.update_attributes(params[:field_group])
        format.html { redirect_to @field_group, notice: 'Field group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @field_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /field_groups/1
  # DELETE /field_groups/1.json
  def destroy
    @field_group = FieldGroup.find(params[:id])
    @field_group.destroy

    respond_to do |format|
      format.html { redirect_to field_groups_url }
      format.json { head :no_content }
    end
  end
end
