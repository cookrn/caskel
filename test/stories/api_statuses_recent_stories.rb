require "stories_helper"

class ApiStatusesRecentStories < Test::Unit::TestCase
  
  story "do some setup of test data for these stories" do
    
    #instantiate a time object to create unique test cases
    time = Time.new
    
    #setup some runtime specific variables
    $user_id = Digest::MD5.hexdigest( time.inspect ).to_s
    
    $cassandra.insert( :Users , $user_id , { 'screen_name' => 'HOLYTWITTER' + $user_id } )
    puts "Screen Name: " + 'HOLYTWITTER' + $user_id
    $cassandra.insert( :Statuses , $user_id+'1' , { 'text' => 'oh hai test fake tweet' , 'user_id' => $user_id } )
    $cassandra.insert( :Statuses , $user_id+'2' , { 'text' => '@faketweeter oh hai test fake tweet 2' , 'user_id' => $user_id , 'reply_to_id' => '8' } )
    $cassandra.insert( :UserRelationships , $user_id , { 'user_timeline' => { UUID.new => $user_id+'1' } } )
    $cassandra.insert( :UserRelationships , $user_id , { 'user_timeline' => { UUID.new => $user_id+'2' } } )
    
  end
  
  story "As a developer I want to see the a GET request to the /statuses/recent url return a response with recent statuses" do
    
    scenario "A GET request is made to the /statuses/recent url" do
      get "/statuses/recent/#{$user_id}"
      response = JSON.parse( last_response.body )
      assert_equal response['response']['status']['code'], 200
      assert_equal response['response']['data'].length, 2
    end
    
  end
  
end
