require "rubygems"
require "bundler/setup"
require "stringex"

## -- Config -- ##

posts_dir       = "_posts"    # directory for blog files
drafts_dir       = "_drafts"  # directory for draft files
new_post_ext    = "md"  # default new post file extension when using the new_post task
new_page_ext    = "md"  # default new page file extension when using the new_page task


####################################################
# Create a new Post, Page, Draft (make or publish) #
####################################################

# usage rake new_draft
desc "Create a new draft in #{drafts_dir}"
task :new_draft, :title do |t, args|
  if args.title
    title = args.title
  else
    title = get_stdin("Enter a title for your post: ")
  end
  filename = "#{drafts_dir}/#{title.to_url}.#{new_post_ext}"
  if File.exist?(filename)
    abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
  end
  tags = get_stdin("Enter tags to classify your draft post (comma separated): ")
  puts "Creating new draft post: #{filename}"
  open(filename, 'w') do |post|
    post.puts "---"
    post.puts "layout: post"
    post.puts "title: \"#{title.gsub(/&/,'&amp;')}\""
    post.puts "modified: #{Time.now.strftime('%Y-%m-%d %H:%M:%S %z')}"
    post.puts "tags: [#{tags}]"
    post.puts "image:"
    post.puts "  feature: "
    post.puts "  credit: "
    post.puts "  creditlink: "
    post.puts "comments: "
    post.puts "share: "
    post.puts "---"
  end
end

# usage rake publish_draft
desc "Publishing a draft from #{drafts_dir} to #{posts_dir}"
task :publish_draft, :title do |t, args|
  if args.title
    title = args.title
  else
    puts ""
    puts "Current files in #{drafts_dir}"
    puts Dir["#{drafts_dir}/*"]
    puts ""
    title = get_stdin("Enter the title for the draft you want to publish: ")
  end
  filename = "#{drafts_dir}/#{title.to_url}.#{new_post_ext}"
  if File.exist?(filename)
    new_name = "#{posts_dir}/#{Time.now.strftime('%Y-%m-%d')}-#{title.to_url}.#{new_post_ext}"
    File.rename(filename,new_name)
  else
    abort("No file with the name #{filename} exists. rake aborted!")
  end
  puts "Published draft #{filename}"
end

# usage rake new_post
desc "Create a new post in #{posts_dir}"
task :new_post, :title do |t, args|
  if args.title
    title = args.title
  else
    title = get_stdin("Enter a title for your post: ")
  end
  filename = "#{posts_dir}/#{Time.now.strftime('%Y-%m-%d')}-#{title.to_url}.#{new_post_ext}"
  if File.exist?(filename)
    abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
  end
  tags = get_stdin("Enter tags to classify your post (comma separated): ")
  puts "Creating new post: #{filename}"
  open(filename, 'w') do |post|
    post.puts "---"
    post.puts "layout: post"
    post.puts "title: \"#{title.gsub(/&/,'&amp;')}\""
    post.puts "modified: #{Time.now.strftime('%Y-%m-%d %H:%M:%S %z')}"
    post.puts "tags: [#{tags}]"
    post.puts "image:"
    post.puts "  feature: "
    post.puts "  credit: "
    post.puts "  creditlink: "
    post.puts "comments: "
    post.puts "share: "
    post.puts "---"
  end
end

# usage rake new_page
desc "Create a new page"
task :new_page, :title do |t, args|
  if args.title
    title = args.title
  else
    title = get_stdin("Enter a title for your page: ")
  end
  filename = "#{title.to_url}.#{new_page_ext}"
  if File.exist?(filename)
    abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
  end
  tags = get_stdin("Enter tags to classify your page (comma separated): ")
  puts "Creating new page: #{filename}"
  open(filename, 'w') do |page|
    page.puts "---"
    page.puts "layout: page"
    page.puts "permalink: /#{title.to_url}/"
    page.puts "title: \"#{title}\""
    page.puts "modified: #{Time.now.strftime('%Y-%m-%d %H:%M')}"
    page.puts "tags: [#{tags}]"
    page.puts "image:"
    page.puts "  feature: "
    page.puts "  credit: "
    page.puts "  creditlink: "
    page.puts "share: "
    page.puts "---"
  end
end

def get_stdin(message)
  print message
  STDIN.gets.chomp
end

def ask(message, valid_options)
  if valid_options
    answer = get_stdin("#{message} #{valid_options.to_s.gsub(/"/, '').gsub(/, /,'/')} ") while !valid_options.include?(answer)
  else
    answer = get_stdin(message)
  end
  answer
end