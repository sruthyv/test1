require "minitest/autorun" 
require_relative "csvdownload"
require_relative "csvzip"
class CsvDownloadTest < Minitest::Test
    def test_is_file_downloaded  
        assert File.exist?("/home/user/test1/top.zip")
    end
end

class CsvzipTest < Minitest::Test
    def test_is_file_unzipped  
        assert File.exist?("/home/user/test1/top-1m.csv")
    end
end
