class Main
  helpers do

    # Your helpers go here. You can also create another file in app/helpers with the same format.
    # All helpers defined here will be available across all the application.
    #
    # @example A helper method for date formatting.
    #
    #   def format_date(date, format = "%d/%m/%Y")
    #     date.strftime(format)
    #   end
    
    def return405
      
      #define your response hash
      response = {
        'response' => {
          'status' =>{
            'code' => 405,
            'message' => 'METHOD NOT ALLOWED'
          }
        }
      }

      #set some HTTP headers
      status 405
      content_type 'application/json', :charset => 'UTF-8'
      headers 'Allow' => 'GET'

      #return the response as the hash converted to json
      response.to_json
      
    end
    
    def return400( message )
      
      #define your response hash
      response = {
        'response' => {
          'status' =>{
            'code' => 400,
            'message' => message
          }
        }
      }

      #set some HTTP headers
      status 400
      content_type 'application/json', :charset => 'UTF-8'

      #return the response as the hash converted to json
      response.to_json
      
    end
    
  end
end
