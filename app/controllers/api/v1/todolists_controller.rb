class Api::V1::TodolistsController < ApplicationController
  before_action :set_api_v1_todolist, only: [:show, :update, :destroy]

  # GET /api/v1/todolists
  def index
    @api_v1_todolists = Api::V1::Todolist.all

    render json: @api_v1_todolists
  end

  # GET /api/v1/todolists/1
  def show
    list = Api::V1::Todolist.find(params[:id])
    render json: list

  end

  # POST /api/v1/todolists
  def create
    newitem = Api::V1::Todolist.new(list_params)

    if newitem.save
      render json: {
        status: 200,
        message: "Successfully created todolist",
        todolist: newitem
      }.to_json
      # render json: @api_v1_todolist, status: :created, location: @api_v1_todolist
    else
      head 500
      # render json: @api_v1_todolist.errors, status: :unprocessable_entity
    end
  end



  # PATCH/PUT /api/v1/todolists/1
  def update
    if @api_v1_todolist.update(api_v1_todolist_params)
      render json: @api_v1_todolist
    else
      render json: @api_v1_todolist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/todolists/1
  def destroy
    @api_v1_todolist.destroy
    render json: {
      status: 200,
      message: "Successfully deleted To-do List."
    }
  end

  private

  def list_params
    params.require("todolist").permit("title")
  end


    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_todolist
      @api_v1_todolist = Api::V1::Todolist.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_todolist_params
      params.fetch(:api_v1_todolist, {})
    end
end
