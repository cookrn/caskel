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
    
    #return the response
    return200( response )
    
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
