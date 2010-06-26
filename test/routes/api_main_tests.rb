require "test_helper"

class ApiMainTests < Test::Unit::TestCase
  
  test "root url GET request returns a successfully formatted response" do
    get "/"
    assert last_response.ok?
    assert_equal "application/json;charset=UTF-8", last_response.content_type
  end
  
  test "root url POST request returns a 405 and allow header is properly set" do
    post "/"
    assert_equal last_response.status, 405
    assert_equal last_response.headers['Allow'], 'GET'
    assert_equal "application/json;charset=UTF-8", last_response.content_type
  end
  
  test "root url PUT request returns a 405 and allow header is properly set" do
    put "/"
    assert_equal last_response.status, 405
    assert_equal last_response.headers['Allow'], 'GET'
    assert_equal "application/json;charset=UTF-8", last_response.content_type
  end
  
  test "root url DELETE request returns a 405 and allow header is properly set" do
    put "/"
    assert_equal last_response.status, 405
    assert_equal last_response.headers['Allow'], 'GET'
    assert_equal "application/json;charset=UTF-8", last_response.content_type
  end
  
end
