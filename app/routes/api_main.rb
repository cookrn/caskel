class Main
  
  get "/" do
    
    #define your response hash
    response = {
      'response' => {
        'status' =>{
          'code' => 200,
          'message' => 'OK'
        },
        'data' => {
          'message' => 'HELLO WORLD!'
        }
      }
    }
    
    #set some HTTP headers
    status 200
    content_type 'application/json', :charset => 'UTF-8'
    
    #return the response as the hash converted to json
    response.to_json
    
  end
  
  post "/" do
    
    return405
    
  end
  
  put "/" do
    
    return405
    
  end
  
  delete "/" do
    
    return405
    
  end
  
end
