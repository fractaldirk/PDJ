class ListsController < ApplicationController
  # GET /lists
  # GET /lists.json
  def index
    @lists = List.find(:all, :order => "created_at DESC", :limit => 20)
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    @list = List.find(params[:id])
  end

  # GET /lists/new
  # GET /lists/new.json
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
    @list = List.find(params[:id])
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(params[:list])

    if @list.save
      redirect_to @list
    else
      render action: "new"
    end
  end

  # PUT /lists/1
  # PUT /lists/1.json
  def update
    @list = List.find(params[:id])

    if @list.update_attributes(params[:list])
      redirect_to @list
    else
      render action: "edit"
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list = List.find(params[:id])
    @list.destroy
  end
end
