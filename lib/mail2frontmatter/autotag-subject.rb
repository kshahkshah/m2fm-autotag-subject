require 'mail2frontmatter'

module Mail2FrontMatter
  class AutotagSubject < PreProcessor
    def self.run(metadata, body)
      parsed_subject = metadata[:subject].match(/(\[(.*)\])?(.*)/)

      # [tag1, tag2] title of post
      # [1] -> tags in quotes
      # [2] -> tags without quotes
      # [3] -> subject
      if parsed_subject[2]
        metadata[:subject] = parsed_subject[3].strip
        metadata[:tags] = (metadata[:tags]||[] + parsed_subject[2].split(',').map(&:strip)).uniq
      end

      return metadata, body
    end
  end
end
