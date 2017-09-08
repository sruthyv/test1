require 'csv'
require 'rubygems'
require 'zip'
require 'net/http'

Net::HTTP.start("s3.amazonaws.com/") do |http|
    resp = http.get("http://s3.amazonaws.com/alexa-static/top-1m.csv.zip")
    open("top", "wb") do |file|
        file.write(resp.body)
    end
end
puts "Done."

def unzip_file (file, destination)
Zip::File.open(file) do |zip_file|
zip_file.each do |f|
f_path = File.join(destination, f.name)
FileUtils.mkdir_p(File.dirname(f_path))
f.extract(f_path)unless File.exist?(f_path)
@a=f

end
end
end

unzip_file("top", "/home/user/test1")
a="#{@a}"
i=1
ar=[]
CSV.foreach(a) do |row| 
    ar << row[1]
   
    i=i+1
    if (i==1000) 
    
        break
    end
  end

puts (ar)
File.open("temp", 'w') { |file| file.puts(ar) }
