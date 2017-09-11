require 'csv'
require 'rubygems'
require 'zip'
class Csvzip
    def unzip_file (file, destination)
        Zip::File.open(file) do |zip_file|
            zip_file.each do |f|
                f_path = File.join(destination, f.name)
                FileUtils.mkdir_p(File.dirname(f_path))
                f.extract(f_path)unless File.exist?(f_path)
                @a=f
            end
        end
        a="#{@a}"
        i=1
        $ar=[]
        CSV.foreach(a) do |row| 
            $ar << row[1]
            i=i+1
            if (i==1000) 
                break
            end
        end
        # puts ($ar)
        File.open("tempunzip", 'w') { |file| file.puts($ar) }
    end        
end
@zipfile=Csvzip.new
@zipfile.unzip_file("top.zip", "/home/user/test1")

