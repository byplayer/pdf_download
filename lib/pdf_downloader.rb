require 'bundler/setup'
require 'mechanize'
require 'fileutils'

class PdfDownloader
  def download(options)
    agent = Mechanize.new
    agent.user_agent_alias = 'Windows IE 7'
    dir = options[:dir]
    dir ||= 'work'
    FileUtils.mkdir_p(dir)

    page = agent.get(options[:url])
    page.root.search('a').each do |a|
      if a['href'] =~ /\.pdf$/
        puts "download:#{a['href']}"
        p2 = page.link_with(href: a['href']).click
        puts "save:#{p2.filename}"
        p2.save(File.join(dir, p2.filename))
      end
    end
  end
end
