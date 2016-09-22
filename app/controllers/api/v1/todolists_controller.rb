class Api::V1::TodolistsController < ApplicationController

  # GET /api/v1/todolists
  def index
    render json: Api::V1::Todolist.all
  end

  # GET /api/v1/todolists/1
  def show
    list = Api::V1::Todolist.find(params[:id])
    render json: list
  end

  # POST /api/v1/todolists
  def create
    list = Api::V1::Todolist.new({title: params[:title]})

    if list.save
      render json: {
        status: 200,
        message: "Successfully created todolist",
        todolist: list
      }.to_json
    else
      render json: {
        status: 500,
        errors: list.errors
      }.to_json

    end
  end

  # PATCH/PUT /api/v1/todolists/1
  def update
    list = Api::V1::Todolist.find(params[:id])
    if list.update(list_params)
      render json: {
        status: 200,
        message: "Successfully updated",
        todolist: list
      }.to_json
    else
      render json: {
        status: 500,
        message: "Could not be updated",
        todolist: list
      }.to_json
    end

  end

  # DELETE /api/v1/todolists/1
  def destroy
    list = Api::V1::Todolist.find(params[:id])
    list.destroy

    render json: {
      status: 200,
      message: "Successfully deleted To-do List."
    }.to_json
  end

  private

  def list_params
      params.require(:api_v1_todolist).permit(:title)
      # params.fetch(:api_v1_todolist, {params[:title]})
  end


    # Use callbacks to share common setup or constraints between actions.
    # def set_api_v1_todolist
    #   @api_v1_todolist = Api::V1::Todolist.find(params[:id])
    # end

    # # Only allow a trusted parameter "white list" through.
    # def api_v1_todolist_params
    #   params.fetch(:api_v1_todolist, {})
    # end
end
