require 'net/http'
class CsvDownload
    def download
        Net::HTTP.start("s3.amazonaws.com") do |http|
            content = http.get("http://s3.amazonaws.com/alexa-static/top-1m.csv.zip")
                File.open("top.zip", "w") do |file|
                    file.write(content.body)
                end
        puts"csv file downloaded"
        end
    end
end
@download=CsvDownload.new
@download.download
