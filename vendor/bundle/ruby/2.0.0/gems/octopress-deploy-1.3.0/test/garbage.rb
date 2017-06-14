require 'find'

def add_garbage
  Find.find('_site').to_a.each do |f| 
    system("echo '#{garbage}' >> #{f}") unless File.directory?(f)
  end
end

def garbage
  o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
  (0...50).map { o[rand(o.length)] }.join
end

add_garbage
