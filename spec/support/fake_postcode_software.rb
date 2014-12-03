require 'sinatra/base'

class FakePostcodeSoftware < Sinatra::Base
  get '/lookup.asmx/getAddress' do
    case params[:account]
    when 'test'     then handle_test
    when 'valid'    then handle_valid
    when 'invalid'  then handle_invalid
    end
  end

  private

  def handle_test
    case params[:postcode]
    when 'LS18 4AA' then xml_response('LS184AA.xml')
    else
      xml_response 'only-LS18.xml'
    end
  end

  def handle_valid
    case params[:postcode]
    when 'LS18 4AA' then xml_response('LS184AA.xml')
    end
  end

  def handle_invalid
  end

  def xml_response(file_name)
    content_type :xml
    status 200
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end
