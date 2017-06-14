module Octopress
  module Utils

    # Smart capitalization for titles
    #
    def self.titlecase(input)
      small_words = %w(a an and as at but by en for if in of on or the to v v. via vs vs.)

      x = input.split(" ").map do |word|
        # note: word could contain non-word characters!
        # downcase all small_words, capitalize the rest
        small_words.include?(word.gsub(/\W/, "").downcase) ? word.downcase! : smart_capitalize!(word)
        word
      end
      # capitalize first and last words
      smart_capitalize!(x.first)
      smart_capitalize!(x.last)
      # small words are capitalized after colon, period, exclamation mark, question mark
      x.join(" ").gsub(/(:|\.|!|\?)\s?(\W*#{small_words.join("|")}\W*)\s/) { "#{$1} #{smart_capitalize($2)} " }
    end

    def self.titlecase!(input)
      input.replace(titlecase(input))
    end

    def self.smart_capitalize(input)
      target = input.dup
      # ignore any leading crazy characters and capitalize the first real character
      if target =~ /^['"\(\[']*([a-z])/
        i = input.index($1)
        x = target[i,target.length]
        # word with capitals and periods mid-word are left alone
        target[i,1] = target[i,1].upcase unless x =~ /[A-Z]/ or x =~ /\.\w+/
      end
      target
    end
    
    def self.smart_capitalize!(input)
      input.replace(smart_capitalize(input))
    end
  end
end
