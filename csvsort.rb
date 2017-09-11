require 'csv'
require 'rubygems'
require 'zip'
require_relative 'csvzip'
# require './csvdownload'
class SortFile
    puts "SORTED LIST:::::::::::::::::::"
    def mergesort(list)
        # puts list
        return list if list.size <= 1
        mid   = list.size / 2
        left  = list[0, mid]
        right = list[mid, list.size]
        merge(mergesort(left), mergesort(right))
    end
  
    def merge(left, right)
        sorted = []
        until left.empty? || right.empty?
            if left.first <= right.first
                sorted << left.shift
            else
                sorted << right.shift
            end
        end
        @b=sorted.concat(left).concat(right)
    end
    def writeFile
        File.open("temp", 'w') { |file| file.puts(@b) }
    end
end
@zipfile=SortFile.new
@zipfile.mergesort($ar)
@zipfile.writeFile
