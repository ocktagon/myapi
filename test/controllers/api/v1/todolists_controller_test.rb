require 'test_helper'

class Api::V1::TodolistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_todolist = api_v1_todolists(:one)
  end

  test "should get index" do
    get api_v1_todolists_url, as: :json
    assert_response :success
  end

  test "should create api_v1_todolist" do
    assert_difference('Api::V1::Todolist.count') do
      post api_v1_todolists_url, params: { api_v1_todolist: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_todolist" do
    get api_v1_todolist_url(@api_v1_todolist), as: :json
    assert_response :success
  end

  test "should update api_v1_todolist" do
    patch api_v1_todolist_url(@api_v1_todolist), params: { api_v1_todolist: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_todolist" do
    assert_difference('Api::V1::Todolist.count', -1) do
      delete api_v1_todolist_url(@api_v1_todolist), as: :json
    end

    assert_response 204
  end
end
