require "test_helper"

class ApiStatusesRecentTests < Test::Unit::TestCase
  
  test "/statuses/recent url GET request returns a failure because no user_id" do
    get "/statuses/recent"
    response = JSON.parse(last_response.body)
    puts response
    assert !last_response.ok?
    assert_equal "application/json;charset=UTF-8", last_response.content_type
    assert_equal 400, response['response']['status']['code']
    assert_equal 'No User ID!11', response['response']['status']['message']
  end
  
  test "/statuses/recent url POST request returns a 405 and allow header is properly set" do
    post "/statuses/recent"
    assert_equal last_response.status, 405
    assert_equal last_response.headers['Allow'], 'GET'
    assert_equal "application/json;charset=UTF-8", last_response.content_type
  end
  
  test "/statuses/recent url PUT request returns a 405 and allow header is properly set" do
    put "/statuses/recent"
    assert_equal last_response.status, 405
    assert_equal last_response.headers['Allow'], 'GET'
    assert_equal "application/json;charset=UTF-8", last_response.content_type
  end
  
  test "/statuses/recent url DELETE request returns a 405 and allow header is properly set" do
    put "/statuses/recent"
    assert_equal last_response.status, 405
    assert_equal last_response.headers['Allow'], 'GET'
    assert_equal "application/json;charset=UTF-8", last_response.content_type
  end
  
end
