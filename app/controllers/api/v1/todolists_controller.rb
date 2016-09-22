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
      render status: 200,
      json: {
          message: "Successfully created todolist",
          todolist: list
      }.to_json
    else
      render status: 422,
      json: {errors: list.errors}.to_json
    end
  end

  # PATCH/PUT /api/v1/todolists/1
  def update
    list = Api::V1::Todolist.find(params[:id])
    if list.update({title: params[:title]})
      render status: 200,
      json: {
        message: "Successfully updated",
        todolist: list
      }.to_json
    else
      render status: 422,
      json: {
        message: "Could not be updated",
        todolist: list
      }.to_json
    end

  end

  # DELETE /api/v1/todolists/1
  def destroy
    list = Api::V1::Todolist.find(params[:id])
    list.destroy

    render status: 200,
    json: {
      message: "Successfully deleted To-do List."
    }.to_json
  end

  private

  def list_params
      params.require(:api_v1_todolist).permit(:title)
  end
end
