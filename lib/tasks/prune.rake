namespace :prune do
    desc "destroy old or unvisited URLs"
    task prune_urls: :environment do
        puts "Please enter how many minutes prior"
        minutes = STDIN.gets.chomp.to_i
        puts "Removing old URLs..."
        ShortenedUrl.prune(minutes)
    end
end