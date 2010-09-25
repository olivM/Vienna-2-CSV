class ConvertController < ApplicationController
  
  def index
  end
  
  def upload
    uploaded_io = params[:vienna_file]
    @input = uploaded_io.read

    @output = @input
    @output.gsub!(/ \\'e0 /, '";"')
    @output.gsub!(/(";"\d{2}:\d{2})/, '\\1";"')
    @output.gsub!(/\\\s*\\f1\\fs24/, '";"')
    @output.gsub!(/\\\s*\\'a0\\\s*\\f0/, '";"')

    @output.gsub!(/\\\s*$/, '"')
    @output.gsub!(/^/, '"')

    @output.gsub!(/;"[^"]+"$/, '')

    @output.gsub!(/^([^"])/, '"\\1')

    @output.gsub!(/\\'ee/, "î")
    @output.gsub!(/\\'ef/, "ï")
    @output.gsub!(/\\'b0/, "°")
    @output.gsub!(/\\'9c/, "oe")
    @output.gsub!(/\\'f4/, "ô")
    @output.gsub!(/\\'fb/, "û")
    @output.gsub!(/\\'92/, "'")
    @output.gsub!(/\\'ea/, "ê")
    @output.gsub!(/\\'e0/, "à")
    @output.gsub!(/\\'e2/, "â")
    @output.gsub!(/\\'e7/, "ç")
    @output.gsub!(/\\'e8/, "è")
    @output.gsub!(/\\'e9/, "é")

    @output = @output.split(/\\fs22 Grippe near:Paris within:25km - Twitter Search/)
    
    @output.delete_if { |l| ! l.match(/";"\d{2}:\d{2}";"/) }
    
    @filename = "output.csv"
    
#    f = File.new("public/#{@filename}", "w")
#    f.write @output
#    f.close
    
    

  end

end
