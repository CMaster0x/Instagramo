module ApplicationHelper
  def hashtag_linkeable(string)
    string.gsub(/\#\w+/) do |hashtag|
      link_param = hashtag[1..-1]
      link_to(hashtag, explore_path(link_param))
    end
  end
end
