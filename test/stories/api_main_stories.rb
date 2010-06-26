require "stories_helper"

class ApiMainStories < Test::Unit::TestCase
  
  story "As a developer I want to see the a GET request to the root url return a hello world json response" do
    
    scenario "A GET request is made to the root url" do
      get "/"
      response = JSON.parse( last_response.body )
      assert_equal "HELLO WORLD!", response['response']['data']['message']
    end
    
  end
  
end
