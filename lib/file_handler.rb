module FileHandler
	def self.show_posts
		filestream = File.open("/home/dell/ruby/myblogger/app/views/main_page/show.html.erb").readlines.to_s
    Parser.process_arguements(filestream)
	end

	def self.add_post
		"<h1>this should add a post<h1>"
	end

module Parser
  def self.process_arguements(stream)
    #debugger
    stream.gsub(/(<%)(.*?)(%>)/) do
      #debugger
      Parser.process_arguement($2)
    end
  end

  def self.process_arguement(stream)
    if stream =~ /^=/
      return eval(stream[1..-1])
    else
      eval(stream)
      return ''
    end
  end
end
end
