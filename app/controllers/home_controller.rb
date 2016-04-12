require 'mailgun'
class HomeController < ApplicationController
    def room
        
    end
    
    def hoho
        @email=params[:email]
        @title=params[:title]
        @content=params[:content]
        
        mg_client = Mailgun::Client.new("key-bae8a97f210b4551a2b9d7ebf75fc275")

        message_params =  {
                   from: 'likelion@naver.com',
                   to:   @email,
                   subject: @title,
                   text:    @content
                  }

        result = mg_client.send_message('sandbox1ee16db259af4fda9c238c63bfd605bc.mailgun.org', message_params).to_h!

        message_id = result['id']
        message = result['message']
    end

end
