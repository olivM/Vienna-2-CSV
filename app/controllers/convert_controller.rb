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

    @output = @output.split(/\\fs22 Grippe near:Paris within:25km - Twitter Search/)
    
    @output.delete_if { |l| ! l.match(/";"\d{2}:\d{2}";"/) }
    
        
  end

end
