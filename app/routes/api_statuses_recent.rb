class Main
  
  get "/statuses/recent/:user_id" do
    
    if !defined? params[:user_id]
      return400('No User ID!11')
    end
    
    timeline = $cassandra.get(:UserRelationships, params[:user_id], 'user_timeline', :reversed => true)
    
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
    
    #set some HTTP headers
    status 200
    content_type 'application/json', :charset => 'UTF-8'
    
    #return the response as the hash converted to json
    response.to_json
    
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
