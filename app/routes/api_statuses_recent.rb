class Main
  
  get "/statuses/recent" do
  
    return400("No User ID!")
  
  end
  
  get "/statuses/recent/*" do
    
    timeline = $cassandra.get(:UserRelationships, params[:splat][0], 'user_timeline', :reversed => true)
    
    #define your response hash
    response = {
      'response' => {
        'status' =>{
          'code' => 200,
          'message' => 'OK'
        },
        'data' => timeline.map { |time, id| $cassandra.get(:Statuses, id, 'text') }
      }
    }
    
    #return the response
    return200( response )
    
  end
  
  post "/statuses/recent/*" do
    
    return405
    
  end
  
  put "/statuses/recent/*" do
    
    return405
    
  end
  
  delete "/statuses/recent/*" do
    
    return405
    
  end
  
  post "/statuses/recent" do
    
    return405
    
  end
  
  put "/statuses/recent" do
    
    return405
    
  end
  
  delete "/statuses/recent" do
    
    return405
    
  end
  
end
