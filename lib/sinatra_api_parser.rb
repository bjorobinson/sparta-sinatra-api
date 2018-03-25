require_relative 'services/validation_service'

class SinatraAPIParser

  def validation_service
    ValidationService.new
  end
  
end

# thing = SinatraAPIParser.new
# output = File.open( "API_printout.json", "w" )
# output << thing.get_response
# output.close
