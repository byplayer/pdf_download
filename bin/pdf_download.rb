require 'optparse'
require_relative File.join('..', 'lib', 'pdf_downloader')

options = {}

opts = OptionParser.new
opts.on('-u VALUE') { |v| options[:url] = v }
opts.on('-d VALUE') { |v| options[:dir] = v }

begin
  opts.parse!(ARGV)
  PdfDownloader.new.download(options)
rescue OptionParser::MissingArgument => e
  puts e.to_s
end
